#’ Lectura del fichero
#’
#’ Función que identifica los candidatos en cada dimensión
#’
#’ @param file Una cadena de texto
#’
#’ @return Matriz con los datos de file
#’ @export
read.apriori <- function(file)
{
	if (!is.character(file))
	{
		stop("file is not a character")
	}
	
	muestra <- Matrix(as.matrix(read.table(file)), sparse=T)
	muestrangCMatrix <- as(muestra, "nsparseMatrix")
	t(muestrangCMatrix)
}

#’ Algoritmo apriori_gen
#’
#’ Función que identifica los candidatos en cada dimensión
#’
#’ @param frecuents Un vector
#’ @param k Un número
#’
#’ @return Vector con los candidatos
#’ @export
apriori_gen <- function(frequents, k)
{
	candidates = list()
	
	for (f in 1:length(frequents[[k - 1]]))
	{
		for (j in f + 1:length(frequents[[k - 1]]) - 1)
		{
			if (j > length(frequents[[k - 1]]))
			{
				next
			}			
			
			a <- frequents[[k - 1]][[f]]
			b <- frequents[[k - 1]][[j]]
			
			if (k - 2 > 0)
			{
				for (i in 1:(k - 2))
				{
					if (a[i] != b[i])
					{
						next
					}
				}
			}
			
			if (a[k - 1] != b[k - 1])
			{
				candidates <- c(candidates, list(union(a, b)))
			}
		}
	}
	
	candidates
}

#’ Count Ocurrences
#’
#’ Función que calcula las apariciones de un candidato en la matriz
#’
#’ @param matrix Una matriz
#’ @param candidate Un vector
#’ @param transactions Un vector
#’
#’ @return Cuantas veces aparece candidate en matrix
#’ @export
countOccurrences <- function(matrix, candidate, transactions)
{
	counter <- 0
	
	for (t in transactions)
	{
		contains <- T
		for (i in candidate)
		{
			contains <- matrix[i, t] && contains
		}
		
		if (contains)
		{
			counter <- counter + 1
		}
	}
	
	counter
}

#’ Prune
#’
#’ Función que realiza la primera poda de los sucesos elementales
#’
#’ @param matrix Una matriz
#’ @param candidates Un vector
#’ @param transactions Un vector
#’ @param support Un número
#’
#’ @return Vector con los candidatos que superan el soporte
#’ @export
prune <- function(matrix, candidates, transactions, support)
{
	supportCounters = c()
	
	for (c in 1:length(candidates))
	{
		counter <- countOccurrences(matrix, candidates[[c]], transactions)
		supportCounters = c(supportCounters, counter)
	}
	
	frequents <- list()
	for (c in 1:length(candidates))
	{
		if ((supportCounters[c] / length(transactions)) >= support)
		{
			frequents <- c(frequents, candidates[c])
		}
	}
	
	list(unique(frequents))
}

#’ Prune
#’
#’ Función que comprueba las asociaciones que superan el umbral de confianza.
#’
#’ @param matrix Una matriz
#’ @param rules Un vector
#’ @param A Un vector
#’ @param B Un vector
#’ @param dimensions Un número
#’ @param transactions Un vector
#’ @param confidence Un número
#’
#’ @return Vector de las asociaciones que superan el valor de confidence
#’ @export
ap_genrules <- function(matrix, rules, A, B, dimensions, transactions, confidence)
{	
	if (length(A) == 0)
	{
		combinations <- combn(B, dimensions - 1)
	}
	else
	{
		combinations <- combn(A, dimensions - 1)
	}
	
	if (length(combinations) == 0)
	{
		return(rules)
	}
	
	for (col in 1:ncol(combinations))
	{
		lhs <- c()
		for (row in 1:nrow(combinations))
		{
			lhs <- c(lhs, combinations[row, col])
		}
		
		rhs <- setdiff(B, lhs)
		
		nB <- countOccurrences(matrix, B, transactions)
		nA <- countOccurrences(matrix, lhs, transactions)
		
		if ((nB / nA) >= confidence)
		{			
			rules <- c(rules, list(c(lhs = list(lhs), rhs = rhs)))
			
			ap_genrules(matrix, rules, lhs, B, dimensions - 1, transactions,
				confidence)
		}
	}
	
	rules
}

#’ Pintar resultados
#’
#’ Función que muestra por pantalla los resultados del algoritmo Apriori
#’
#’ @param matrix Una matriz
#’ @param rules Un vector
#’ @param transactions Un vector
#’
#’ @return data.frame con los resultados
#’ @export
printResults <- function(matrix, rules, transactions)
{
	rows <- rownames(matrix)
	n <- length(transactions)
	lhs <- c()
	rhs <- c()
	support <- c()
	confidence <- c()
	coverage <- c()
	lift <- c()
	count <- c()
	for (i in length(rules):1)
	{	
		count_lhs_rhs <- countOccurrences(matrix, c(rules[[i]]$lhs, rules[[i]]$rhs),
			transactions)
		count_lhs <- countOccurrences(matrix, rules[[i]]$lhs, transactions)
		count_rhs <- countOccurrences(matrix, rules[[i]]$rhs, transactions)
		
		support_i <- count_lhs_rhs / n
		coverage_i <- count_lhs / n
		
		lhs <- c(lhs, paste("{", paste(rows[rules[[i]]$lhs], collapse=","), "}", sep=""))
		rhs <- c(rhs, paste("{", paste(rows[rules[[i]]$rhs], collapse=","), "}", sep=""))
		support <- c(support, support_i)	
		confidence <- c(confidence, (count_lhs_rhs / count_lhs))
		coverage <- c(coverage, coverage_i)
		lift <- c(lift, (support_i / (coverage_i * (count_rhs / n))))
		count <- c(count, count_lhs_rhs)
	}
	
	results <- data.frame(lhs, "=>", rhs, support, confidence, coverage, lift, count)
	names(results) <- c("lhs", "", "rhs", "support", "confidence", "coverage", "lift", "count")
	
	results
}

#’ Main del algoritmo Apriori
#’
#’ Función que pone en funcionamiento el algoritmo Apriori
#’
#’ @param matrix Una matriz
#’ @param support Un número
#’ @param confidence Un número
#’
#’ @export
apriori_main <- function(matrix, support, confidence)
{
	candidates <- list()
	for (c in seq(length(rownames(matrix))))
	{
		candidates <- c(candidates, c)
	}
	transactions <- seq(length(colnames(matrix)))
	
	frequents = prune(matrix, candidates, transactions, support)
	
	k <- 2
	repeat
	{		
		candidates <- apriori_gen(frequents, k)
		
		if (length(candidates) == 0)
		{
			break
		}
		
		frequents_k <- prune(matrix, candidates, transactions, support)
		frequents <- c(frequents, frequents_k)		
		
		k <- k + 1
	}
	
	rules <- c()
	for (n in length(frequents):2)
	{
		for (i in 1:length(frequents[[n]]))
		{
			rules_n <- ap_genrules(matrix, c(), c(), frequents[[n]][[i]], n,
				transactions, confidence)
			rules <- c(rules, rules_n)
		}
	}
	
	printResults(matrix, rules, transactions)
}