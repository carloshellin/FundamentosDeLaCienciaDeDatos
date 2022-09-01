# Muestra de ejemplo
(muestra=t(matrix(c(3,2,3.5,12,4.7,4.1,5.2,4.9,7.1,6.1,6.2,5.2,14,5.3),2,7,dimnames=list(c("r","d")))))

	  r	 d
[1,]  3.0  2.0
[2,]  3.5 12.0
[3,]  4.7  4.1
[4,]  5.2  4.9
[5,]  7.1  6.1
[6,]  6.2  5.2
[7,] 14.0  5.3

# Convertir la matriz de la muestra en un data frame
(muestra=data.frame(muestra))
     r    d
1  3.0  2.0
2  3.5 12.0
3  4.7  4.1
4  5.2  4.9
5  7.1  6.1
6  6.2  5.2
7 14.0  5.3

# Técnica Caja y Bigotes
(boxplot(muestra$r, range=1.5, plot=FALSE))
$stats
     [,1]
[1,] 3.00
[2,] 4.10
[3,] 5.20
[4,] 6.65
[5,] 7.10

$n
[1] 7

$conf
         [,1]
[1,] 3.677181
[2,] 6.722819

$out
[1] 14

$group
[1] 1

$names
[1] "1"

(cuar1r=quantile(muestra$r,0.25))
25% 
4.1 

(cuar3r=quantile(muestra$r,0.75))
 75% 
6.65 

(int=c(cuar1r-1.5*(cuar3r-cuar1r), cuar3r+1.5*(cuar3r-cuar1r)))
   25%    75% 
 0.275 10.475 

for(i in 1:length(muestra$r))
{if(muestra$r[i]<int[1] || muestra$r[i]>int[2])
{print("el suceso");print(i);print(muestra$r[i]);print("es un suceso anómalo o outlier")}}
[1] "el suceso"
[1] 7
[1] 14
[1] "es un suceso anómalo o outlier"

# Técnica Desviación típica
xa = mean(muestra$d)
xa
[1] 5.657143

sd = sd(muestra$d)
sd
[1] 3.085913

(int=c(xa - 2*sd, xa + 2*sd))
[1] -0.5146825 11.8289682

sdd = sqrt(var(muestra$d)*((length(muestra$d)-1)/length(muestra$d)))
sdd
[1] 2.857

(int=c(xa - 2*sdd, xa + 2*sdd))
[1] -0.05685714 11.37114285

for(i in 1:length(muestra$d))
{if(muestra$d[i]<int[1] || muestra$d[i]>int[2])
{print("el suceso");print(i);print(muestra$d[i]);print("es un suceso anómalo o outlier")}}
[1] "el suceso"
[1] 2
[1] 12
[1] "es un suceso anómalo o outlier"

# Técnica Regresión
(dfr=lm(muestra$d~muestra$r))

Call:
lm(formula = muestra$d ~ muestra$r)

Coefficients:
(Intercept)    muestra$r  
    6.01445     -0.05723  

(summary(dfr))

Call:
lm(formula = muestra$d ~ muestra$r)

Residuals:
       1        2        3        4        5        6        7 
-3.84275  6.18587 -1.64545 -0.81683  0.49192 -0.45960  0.08684 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)  
(Intercept)  6.01445    2.64632   2.273   0.0722 .
muestra$r   -0.05723    0.37148  -0.154   0.8836  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 3.372 on 5 degrees of freedom
Multiple R-squared:  0.004725,  Adjusted R-squared:  -0.1943 
F-statistic: 0.02374 on 1 and 5 DF,  p-value: 0.8836

(res = summary(dfr)$residuals)
         1          2          3          4          5          6          7 
-3.8427477  6.1858698 -1.6454482 -0.8168308  0.4919157 -0.4595958  0.0868370 

(sr = sqrt(sum(res^2)/7))
[1] 2.850242

for(i in 1:length(res))
{if (res[i]>2*sr)
{print("el suceso"); print(res[i]); print("es un suceso anómalo o outlier")}}
[1] "el suceso"
      2 
6.18587 
[1] "es un suceso anómalo o outlier"