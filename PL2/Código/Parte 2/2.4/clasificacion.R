valoresUnicos <- function(datos, columna)
{
	unique(datos[columna])
}

contarClases <- function(datos)
{
	table(datos[, ncol(datos)])
}

esNumero <- function(valor)
{
	is.numeric(valor)
}

crearPregunta <- function(columna, valor)
{
	list(columna = columna, valor = valor)
}

coincide <- function(pregunta, fila)
{
	valor = fila[pregunta$columna]
	
	if (esNumero(valor))
	{
		valor >= pregunta$valor
	}
	else
	{
		valor == pregunta$valor
	}
}

dividir <- function(datos, pregunta)
{
    coincidencias <- data.frame()
    eliminar <- c()
	
	for (i in 1:nrow(datos))
	{
		fila <- datos[i, ]
		if (coincide(pregunta, fila))
		{
			coincidencias <- rbind(coincidencias, fila)
            eliminar <- c(eliminar, i)
		}
	}
    
    izquierda <- datos[-eliminar, ]
    
    claseUnica <- valoresUnicos(coincidencias, ncol(coincidencias))
    if (nrow(claseUnica) == 1)
    {
        derecha <- coincidencias
    }
    else
    {
        derecha <- data.frame()
    }
		
    list(izquierda = izquierda, derecha = derecha)
}

gini <- function(datos)
{
	contadores <- contarClases(datos)
	impureza <- 1
	n <- nrow(datos)
	
	for (contador in contadores)
	{
		probabilidad <- contador / n
		impureza <- impureza - probabilidad ^ 2
	}
	
	impureza
}

gananciaInformacion <- function(izquierda, derecha, impurezaPadre)
{
	p = nrow(izquierda) / (nrow(izquierda) + nrow(derecha))
	impurezaPadre - p * gini(izquierda) - (1 - p) * gini(derecha)
}

buscarMejorDivision <- function(datos)
{
	mejorGanancia <- 0
	mejorDivision <- NULL
	mejorColumna <- 0
	impurezaPadre <- gini(datos)
	columnas <- ncol(datos) - 1
	
	for (columna in 1:columnas)
	{	
    	valores <- valoresUnicos(datos, columna)
        
    	for (i in 1:nrow(valores))
        {
            valor <- valores[i, 1]
			
            pregunta <- crearPregunta(columna, valor)
            
            division <- dividir(datos, pregunta)
            
            if (nrow(division$izquierda) == 0 || nrow(division$derecha) == 0)
            {
                next
            }
		
            ganancia <- gananciaInformacion(division$izquierda, division$derecha, impurezaPadre)
			
            if (ganancia > mejorGanancia)
            {
                mejorGanancia <- ganancia
                mejorDivision <- division
                mejorColumna <- columna
            }
        }
	}

	list(ganancia = mejorGanancia, columna = names(datos[mejorColumna]), division = mejorDivision)
}

crearHoja <- function(datos)
{
	list(n = contarClases(datos))
}

crearNodo <- function(resultado, ramaIzquierda, ramaDerecha)
{
	list(resultado = resultado, ramaIzquierda = ramaIzquierda, ramaDerecha = ramaDerecha)
}

construirArbol <- function(datos)
{	
	resultado <- buscarMejorDivision(datos)
	
	if (resultado$ganancia == 0)
	{
		return(crearHoja(datos))
	}	
	
	ramaIzquierda <- construirArbol(resultado$division$izquierda)
	ramaDerecha <- construirArbol(resultado$division$derecha)
	
	return(crearNodo(resultado, ramaIzquierda, ramaDerecha))
}

pintarRaiz <- function(raiz)
{
    cat(paste(raiz$resultado$columna, "ganancia:", raiz$resultado$ganancia, "\n"))
}

pintarRama <- function(raiz, tab="\t")
{
    if (length(raiz$n) > 0)
    {
        cat("*\n")
        return()
    }
    cat(paste("\n", tab))
    pintarRaiz(raiz)
    
    cat(tab)
    pintarContenidoRama(raiz$resultado$division$derecha)
    pintarRama(raiz$ramaDerecha, paste(tab, "\t"))
    
    cat(tab)
    pintarContenidoRama(raiz$resultado$division$izquierda)
    pintarRama(raiz$ramaIzquierda, paste(tab, "\t"))
}

pintarContenidoRama <- function(rama)
{
    clase <- contarClases(rama)
    
    for (i in 1:length(clase))
    {
        cat(paste(names(clase[i]), ":", clase[[i]], ""))
    }
}

pintarArbol <- function(arbol)
{   
    pintarRaiz(arbol)
    
    pintarContenidoRama(arbol$resultado$division$derecha)
    pintarRama(arbol$ramaDerecha)
    
    pintarContenidoRama(arbol$resultado$division$izquierda)
    pintarRama(arbol$ramaIzquierda)
    
    cat("\n")
}

clasificacion <- function(datos)
{
    arbol <- construirArbol(datos)
    pintarArbol(arbol)
}