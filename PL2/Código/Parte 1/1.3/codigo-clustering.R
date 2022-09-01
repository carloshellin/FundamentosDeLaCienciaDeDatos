> install.packages("LearnClust_1.1.zip")
Installing package into ‘C:/Users/atien/OneDrive - Universidad de Alcala/Documents/R/win-library/4.1’
(as ‘lib’ is unspecified)
inferring 'repos = NULL' from 'pkgs'
package ‘LearnClust’ successfully unpacked and MD5 sums checked

> library("LearnClust")
Error: package ‘magick’ required by ‘LearnClust’ could not be found
Además: Warning message:
package ‘LearnClust’ was built under R version 4.1.2 

> install.packages("magick")
Installing package into ‘C:/Users/atien/OneDrive - Universidad de Alcala/Documents/R/win-library/4.1’
(as ‘lib’ is unspecified)
--- Please select a CRAN mirror for use in this session ---
probando la URL 'https://cran.rediris.es/bin/windows/contrib/4.1/magick_2.7.3.zip'
Content type 'application/zip' length 33810271 bytes (32.2 MB)
downloaded 32.2 MB

package ‘magick’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\atien\AppData\Local\Temp\RtmpAprs7c\downloaded_packages

> library("LearnClust")
Loading required package: magick
Linking to ImageMagick 6.9.12.3
Enabled features: cairo, freetype, fftw, ghostscript, heic, lcms, pango, raw, rsvg, webp
Disabled features: fontconfig, x11
Warning messages:
1: package ‘LearnClust’ was built under R version 4.1.2 
2: package ‘magick’ was built under R version 4.1.2

> m=matrix(c(0.89,2.94,4.36,5.21,3.75,1.12,6.25,3.14,4.1,1.8,3.9,4.27),2,6)
> m
     [,1] [,2] [,3] [,4] [,5] [,6]
[1,] 0.89 4.36 3.75 6.25  4.1 3.90
[2,] 2.94 5.21 1.12 3.14  1.8 4.27

> m=t(m)
> m
     [,1] [,2]
[1,] 0.89 2.94
[2,] 4.36 5.21
[3,] 3.75 1.12
[4,] 6.25 3.14
[5,] 4.10 1.80
[6,] 3.90 4.27


> agglomerativeHC(m,'EUC','MIN')
$dendrogram
Number of objects: 6 


$clusters
$clusters[[1]]
    X1   X2
1 0.89 2.94

$clusters[[2]]
    X1   X2
1 4.36 5.21

$clusters[[3]]
    X1   X2
1 3.75 1.12

$clusters[[4]]
    X1   X2
1 6.25 3.14

$clusters[[5]]
   X1  X2
1 4.1 1.8

$clusters[[6]]
   X1   X2
1 3.9 4.27

$clusters[[7]]
    X1   X2
1 3.75 1.12
2 4.10 1.80

$clusters[[8]]
    X1   X2
1 4.36 5.21
2 3.90 4.27

$clusters[[9]]
    X1   X2
1 3.75 1.12
2 4.10 1.80
3 4.36 5.21
4 3.90 4.27

$clusters[[10]]
    X1   X2
1 6.25 3.14
2 3.75 1.12
3 4.10 1.80
4 4.36 5.21
5 3.90 4.27

$clusters[[11]]
    X1   X2
1 0.89 2.94
2 6.25 3.14
3 3.75 1.12
4 4.10 1.80
5 4.36 5.21
6 3.90 4.27


$groupedClusters
  cluster1 cluster2
1        3        5
2        2        6
3        7        8
4        4        9
5        1       10


> agglomerativeHC.details(m,'EUC','MIN')
  Agglomerative hierarchical clustering is a classification technique that initializes 
 a cluster for each data. 


  It calculates the distance between datas depending on the approach type given and 


 it creates a new cluster joining the most similar clusters until getting only one.  

  'toList' creates a list initializing datas by creating clusters with each one 


  These are the clusters with only one element:

[[1]]
     [,1] [,2] [,3]
[1,] 0.89 2.94    1

[[2]]
     [,1] [,2] [,3]
[1,] 4.36 5.21    1

[[3]]
     [,1] [,2] [,3]
[1,] 3.75 1.12    1

[[4]]
     [,1] [,2] [,3]
[1,] 6.25 3.14    1

[[5]]
     [,1] [,2] [,3]
[1,]  4.1  1.8    1

[[6]]
     [,1] [,2] [,3]
[1,]  3.9 4.27    1


  In each step: 
   - It calculates a matrix distance between active clusters depending on the approach and distance type. 

   - It gets the minimum distance value from the matrix. 

   - It creates a new cluster joining the minimum distance clusters. 

   - It repeats these steps while final clusters do not include all datas. 


_____________________________________________________________________________________________

STEP => 1


 Matrix Distance (distance type = EUC, approach type = MIN): 

         [,1]     [,2]      [,3]     [,4]      [,5]     [,6]
[1,] 0.000000 4.146541 3.3899853 5.363730 3.4064204 3.290745
[2,] 4.146541 0.000000 4.1352388 2.803034 3.4198977 1.046518
[3,] 3.389985 4.135239 0.0000000 3.214094 0.7647876 3.153569
[4,] 5.363730 2.803034 3.2140940 0.000000 2.5333969 2.607566
[5,] 3.406420 3.419898 0.7647876 2.533397 0.0000000 2.478084
[6,] 3.290745 1.046518 3.1535694 2.607566 2.4780839 0.000000

 The minimum distance is: 0.764787552199956 


 The closest clusters are: 3, 5 


 The grouped clusters are added to the solution.


 Grouping clusters 3 and cluster 5, it is created a new cluster: 

    X1   X2
1 3.75 1.12
2 4.10 1.80

 The new cluster is added to the solution.


_____________________________________________________________________________________________

STEP => 2


 Matrix Distance (distance type = EUC, approach type = MIN): 

         [,1]     [,2] [,3]     [,4] [,5]     [,6]     [,7]
[1,] 0.000000 4.146541    0 5.363730    0 3.290745 3.389985
[2,] 4.146541 0.000000    0 2.803034    0 1.046518 3.419898
[3,] 0.000000 0.000000    0 0.000000    0 0.000000 0.000000
[4,] 5.363730 2.803034    0 0.000000    0 2.607566 2.533397
[5,] 0.000000 0.000000    0 0.000000    0 0.000000 0.000000
[6,] 3.290745 1.046518    0 2.607566    0 0.000000 2.478084
[7,] 3.389985 3.419898    0 2.533397    0 2.478084 0.000000

 The minimum distance is: 1.04651803615609 


 The closest clusters are: 2, 6 


 The grouped clusters are added to the solution.


 Grouping clusters 2 and cluster 6, it is created a new cluster: 

    X1   X2
1 4.36 5.21
2 3.90 4.27

 The new cluster is added to the solution.


_____________________________________________________________________________________________

STEP => 3


 Matrix Distance (distance type = EUC, approach type = MIN): 

         [,1] [,2] [,3]     [,4] [,5] [,6]     [,7]     [,8]
[1,] 0.000000    0    0 5.363730    0    0 3.389985 3.290745
[2,] 0.000000    0    0 0.000000    0    0 0.000000 0.000000
[3,] 0.000000    0    0 0.000000    0    0 0.000000 0.000000
[4,] 5.363730    0    0 0.000000    0    0 2.533397 2.607566
[5,] 0.000000    0    0 0.000000    0    0 0.000000 0.000000
[6,] 0.000000    0    0 0.000000    0    0 0.000000 0.000000
[7,] 3.389985    0    0 2.533397    0    0 0.000000 2.478084
[8,] 3.290745    0    0 2.607566    0    0 2.478084 0.000000

 The minimum distance is: 2.47808393723861 


 The closest clusters are: 7, 8 


 The grouped clusters are added to the solution.


 Grouping clusters 7 and cluster 8, it is created a new cluster: 

    X1   X2
1 3.75 1.12
2 4.10 1.80
3 4.36 5.21
4 3.90 4.27

 The new cluster is added to the solution.


_____________________________________________________________________________________________

STEP => 4


 Matrix Distance (distance type = EUC, approach type = MIN): 

          [,1] [,2] [,3]     [,4] [,5] [,6] [,7] [,8]     [,9]
 [1,] 0.000000    0    0 5.363730    0    0    0    0 3.290745
 [2,] 0.000000    0    0 0.000000    0    0    0    0 0.000000
 [3,] 0.000000    0    0 0.000000    0    0    0    0 0.000000
 [4,] 5.363730    0    0 0.000000    0    0    0    0 2.533397
 [5,] 0.000000    0    0 0.000000    0    0    0    0 0.000000
 [6,] 0.000000    0    0 0.000000    0    0    0    0 0.000000
 [7,] 0.000000    0    0 0.000000    0    0    0    0 0.000000
 [8,] 0.000000    0    0 0.000000    0    0    0    0 0.000000
 [9,] 3.290745    0    0 2.533397    0    0    0    0 0.000000

 The minimum distance is: 2.53339692902632 


 The closest clusters are: 4, 9 


 The grouped clusters are added to the solution.


 Grouping clusters 4 and cluster 9, it is created a new cluster: 

    X1   X2
1 6.25 3.14
2 3.75 1.12
3 4.10 1.80
4 4.36 5.21
5 3.90 4.27

 The new cluster is added to the solution.


_____________________________________________________________________________________________

STEP => 5


 Matrix Distance (distance type = EUC, approach type = MIN): 

          [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9]    [,10]
 [1,] 0.000000    0    0    0    0    0    0    0    0 3.290745
 [2,] 0.000000    0    0    0    0    0    0    0    0 0.000000
 [3,] 0.000000    0    0    0    0    0    0    0    0 0.000000
 [4,] 0.000000    0    0    0    0    0    0    0    0 0.000000
 [5,] 0.000000    0    0    0    0    0    0    0    0 0.000000
 [6,] 0.000000    0    0    0    0    0    0    0    0 0.000000
 [7,] 0.000000    0    0    0    0    0    0    0    0 0.000000
 [8,] 0.000000    0    0    0    0    0    0    0    0 0.000000
 [9,] 0.000000    0    0    0    0    0    0    0    0 0.000000
[10,] 3.290745    0    0    0    0    0    0    0    0 0.000000

 The minimum distance is: 3.29074459659208 


 The closest clusters are: 1, 10 


 The grouped clusters are added to the solution.


 Grouping clusters 1 and cluster 10, it is created a new cluster: 

    X1   X2
1 0.89 2.94
2 6.25 3.14
3 3.75 1.12
4 4.10 1.80
5 4.36 5.21
6 3.90 4.27

 The new cluster is added to the solution.


 This loop has been repeated until the last cluster contained every single clusters.
 
 
> agglomerativeHC(m,'EUC','MAX')
$dendrogram
Number of objects: 6 


$clusters
$clusters[[1]]
    X1   X2
1 0.89 2.94

$clusters[[2]]
    X1   X2
1 4.36 5.21

$clusters[[3]]
    X1   X2
1 3.75 1.12

$clusters[[4]]
    X1   X2
1 6.25 3.14

$clusters[[5]]
   X1  X2
1 4.1 1.8

$clusters[[6]]
   X1   X2
1 3.9 4.27

$clusters[[7]]
    X1   X2
1 3.75 1.12
2 4.10 1.80

$clusters[[8]]
    X1   X2
1 4.36 5.21
2 3.90 4.27

$clusters[[9]]
    X1   X2
1 6.25 3.14
2 4.36 5.21
3 3.90 4.27

$clusters[[10]]
    X1   X2
1 0.89 2.94
2 3.75 1.12
3 4.10 1.80

$clusters[[11]]
    X1   X2
1 6.25 3.14
2 4.36 5.21
3 3.90 4.27
4 0.89 2.94
5 3.75 1.12
6 4.10 1.80


$groupedClusters
  cluster1 cluster2
1        3        5
2        2        6
3        4        8
4        1        7
5        9       10


> agglomerativeHC.details(m,'EUC','MAX')
  Agglomerative hierarchical clustering is a classification technique that initializes 
 a cluster for each data. 


  It calculates the distance between datas depending on the approach type given and 


 it creates a new cluster joining the most similar clusters until getting only one.  

  'toList' creates a list initializing datas by creating clusters with each one 


  These are the clusters with only one element:

[[1]]
     [,1] [,2] [,3]
[1,] 0.89 2.94    1

[[2]]
     [,1] [,2] [,3]
[1,] 4.36 5.21    1

[[3]]
     [,1] [,2] [,3]
[1,] 3.75 1.12    1

[[4]]
     [,1] [,2] [,3]
[1,] 6.25 3.14    1

[[5]]
     [,1] [,2] [,3]
[1,]  4.1  1.8    1

[[6]]
     [,1] [,2] [,3]
[1,]  3.9 4.27    1


  In each step: 
   - It calculates a matrix distance between active clusters depending on the approach and distance type. 

   - It gets the minimum distance value from the matrix. 

   - It creates a new cluster joining the minimum distance clusters. 

   - It repeats these steps while final clusters do not include all datas. 


_____________________________________________________________________________________________

STEP => 1


 Matrix Distance (distance type = EUC, approach type = MAX): 

         [,1]     [,2]      [,3]     [,4]      [,5]     [,6]
[1,] 0.000000 4.146541 3.3899853 5.363730 3.4064204 3.290745
[2,] 4.146541 0.000000 4.1352388 2.803034 3.4198977 1.046518
[3,] 3.389985 4.135239 0.0000000 3.214094 0.7647876 3.153569
[4,] 5.363730 2.803034 3.2140940 0.000000 2.5333969 2.607566
[5,] 3.406420 3.419898 0.7647876 2.533397 0.0000000 2.478084
[6,] 3.290745 1.046518 3.1535694 2.607566 2.4780839 0.000000

 The minimum distance is: 0.764787552199956 


 The closest clusters are: 3, 5 


 The grouped clusters are added to the solution.


 Grouping clusters 3 and cluster 5, it is created a new cluster: 

    X1   X2
1 3.75 1.12
2 4.10 1.80

 The new cluster is added to the solution.


_____________________________________________________________________________________________

STEP => 2


 Matrix Distance (distance type = EUC, approach type = MAX): 

         [,1]     [,2] [,3]     [,4] [,5]     [,6]     [,7]
[1,] 0.000000 4.146541    0 5.363730    0 3.290745 3.406420
[2,] 4.146541 0.000000    0 2.803034    0 1.046518 4.135239
[3,] 0.000000 0.000000    0 0.000000    0 0.000000 0.000000
[4,] 5.363730 2.803034    0 0.000000    0 2.607566 3.214094
[5,] 0.000000 0.000000    0 0.000000    0 0.000000 0.000000
[6,] 3.290745 1.046518    0 2.607566    0 0.000000 3.153569
[7,] 3.406420 4.135239    0 3.214094    0 3.153569 0.000000

 The minimum distance is: 1.04651803615609 


 The closest clusters are: 2, 6 


 The grouped clusters are added to the solution.


 Grouping clusters 2 and cluster 6, it is created a new cluster: 

    X1   X2
1 4.36 5.21
2 3.90 4.27

 The new cluster is added to the solution.


_____________________________________________________________________________________________

STEP => 3


 Matrix Distance (distance type = EUC, approach type = MAX): 

         [,1] [,2] [,3]     [,4] [,5] [,6]     [,7]     [,8]
[1,] 0.000000    0    0 5.363730    0    0 3.406420 4.146541
[2,] 0.000000    0    0 0.000000    0    0 0.000000 0.000000
[3,] 0.000000    0    0 0.000000    0    0 0.000000 0.000000
[4,] 5.363730    0    0 0.000000    0    0 3.214094 2.803034
[5,] 0.000000    0    0 0.000000    0    0 0.000000 0.000000
[6,] 0.000000    0    0 0.000000    0    0 0.000000 0.000000
[7,] 3.406420    0    0 3.214094    0    0 0.000000 4.135239
[8,] 4.146541    0    0 2.803034    0    0 4.135239 0.000000

 The minimum distance is: 2.80303407043154 


 The closest clusters are: 4, 8 


 The grouped clusters are added to the solution.


 Grouping clusters 4 and cluster 8, it is created a new cluster: 

    X1   X2
1 6.25 3.14
2 4.36 5.21
3 3.90 4.27

 The new cluster is added to the solution.


_____________________________________________________________________________________________

STEP => 4


 Matrix Distance (distance type = EUC, approach type = MAX): 

         [,1] [,2] [,3] [,4] [,5] [,6]     [,7] [,8]     [,9]
 [1,] 0.00000    0    0    0    0    0 3.406420    0 5.363730
 [2,] 0.00000    0    0    0    0    0 0.000000    0 0.000000
 [3,] 0.00000    0    0    0    0    0 0.000000    0 0.000000
 [4,] 0.00000    0    0    0    0    0 0.000000    0 0.000000
 [5,] 0.00000    0    0    0    0    0 0.000000    0 0.000000
 [6,] 0.00000    0    0    0    0    0 0.000000    0 0.000000
 [7,] 3.40642    0    0    0    0    0 0.000000    0 4.135239
 [8,] 0.00000    0    0    0    0    0 0.000000    0 0.000000
 [9,] 5.36373    0    0    0    0    0 4.135239    0 0.000000

 The minimum distance is: 3.40642040858142 


 The closest clusters are: 1, 7 


 The grouped clusters are added to the solution.


 Grouping clusters 1 and cluster 7, it is created a new cluster: 

    X1   X2
1 0.89 2.94
2 3.75 1.12
3 4.10 1.80

 The new cluster is added to the solution.


_____________________________________________________________________________________________

STEP => 5


 Matrix Distance (distance type = EUC, approach type = MAX): 

      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]    [,9]   [,10]
 [1,]    0    0    0    0    0    0    0    0 0.00000 0.00000
 [2,]    0    0    0    0    0    0    0    0 0.00000 0.00000
 [3,]    0    0    0    0    0    0    0    0 0.00000 0.00000
 [4,]    0    0    0    0    0    0    0    0 0.00000 0.00000
 [5,]    0    0    0    0    0    0    0    0 0.00000 0.00000
 [6,]    0    0    0    0    0    0    0    0 0.00000 0.00000
 [7,]    0    0    0    0    0    0    0    0 0.00000 0.00000
 [8,]    0    0    0    0    0    0    0    0 0.00000 0.00000
 [9,]    0    0    0    0    0    0    0    0 0.00000 5.36373
[10,]    0    0    0    0    0    0    0    0 5.36373 0.00000

 The minimum distance is: 5.36373004540683 


 The closest clusters are: 9, 10 


 The grouped clusters are added to the solution.


 Grouping clusters 9 and cluster 10, it is created a new cluster: 

    X1   X2
1 6.25 3.14
2 4.36 5.21
3 3.90 4.27
4 0.89 2.94
5 3.75 1.12
6 4.10 1.80

 The new cluster is added to the solution.


 This loop has been repeated until the last cluster contained every single clusters.
 
 
> cmax=agglomerativeHC(m,'EUC','MAX')
> cmax
$dendrogram
Number of objects: 6 


$clusters
$clusters[[1]]
    X1   X2
1 0.89 2.94

$clusters[[2]]
    X1   X2
1 4.36 5.21

$clusters[[3]]
    X1   X2
1 3.75 1.12

$clusters[[4]]
    X1   X2
1 6.25 3.14

$clusters[[5]]
   X1  X2
1 4.1 1.8

$clusters[[6]]
   X1   X2
1 3.9 4.27

$clusters[[7]]
    X1   X2
1 3.75 1.12
2 4.10 1.80

$clusters[[8]]
    X1   X2
1 4.36 5.21
2 3.90 4.27

$clusters[[9]]
    X1   X2
1 6.25 3.14
2 4.36 5.21
3 3.90 4.27

$clusters[[10]]
    X1   X2
1 0.89 2.94
2 3.75 1.12
3 4.10 1.80

$clusters[[11]]
    X1   X2
1 6.25 3.14
2 4.36 5.21
3 3.90 4.27
4 0.89 2.94
5 3.75 1.12
6 4.10 1.80


$groupedClusters
  cluster1 cluster2
1        3        5
2        2        6
3        4        8
4        1        7
5        9       10

> plot(cmax$dendrogram)