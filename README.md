### Incidencia de la educación y el nivel de ingresos en la participación laboral

#### 1. Especificación de los modelos
Con el objetivo de entender los determinantes de la participación laboral de las mujeres en el mercado laboral colombiano, se realizan dos modelos econométricos que se centran en el análisis del nivel educativo y el rango de ingresos según sexo como variables dependientes de la tasa de ocupación; por medio de la estimación de dos modelos econométricos que toman datos de las 13 áreas metropolitanas principales de Colombia establecidas por la Gran Encuesta Integrada de Hogares (GEIH) del DANE. 

El trabajo investigativo recae en la observación del comportamiento de las variables en el rango contemplado entre I-2007 a I-2017. Para la especificación del modelo se utilizará el método de Mínimos Cuadrados Ordinarios con el objeto de encontrar los parámetros de la ecuación de regresión lineal (β1, β2). Se parte de la base empírica:

h1 = Relación positiva del nivel educativo, a mayor nivel educativo mayor posibilidad de hacer parte de la población económicamente activa en el mercado laboral.

h2 = Relación positiva del nivel de ingreso, indicando que a mayor nivel de ingreso existe mayor posibilidad de hacer parte de la población económicamente activa en el mercado laboral, pues existen mayores incentivos a pertenecer empleado en determinada actividad.

El conjunto de datos contiene 287 observaciones y 7 variables, a partir de los cuales se construirán dos sub grupos de datos que contienen la misma información, pero segmentada según sexo (femenino - masculino) para realizar el análisis comparativo correspondiente. Las variables son:

	“periodicity”, contiene la periodicidad de la muestra, la cual es trimestral.
	“avg_edu”, promedio de población ocupada según nivel educativo. 
	“income_am”, promedio de ingresos laborales mensuales.

#### 2. Análisis Exploratorio de los Datos

#### 2.1 Correlación, dispersión y normalidad
Los dos modelos se realizarán de forma simultánea, no obstante, para fines prácticos el modelo 1 contendrá los datos del modelo masculino y el modelo 2 los datos del modelo femenino. Se usa el método del test de Pearson para comprobar la correlación de las variables y también se utiliza un método de análisis visual.

![](Plots/correlation1.png)

Del análisis preliminar del modelo 1, se puede extraer que las variables dependientes tienen una buena relación lineal con la tasa de ocupación: nivel educativo (r = 0.61), ingreso (r = 0.79). También se puede observar una buena dispersión de las variables y una distribución normal con la posible presencia de valores atípicos.

![](Plots/correlation2.png)

Del análisis preliminar para el modelo 2, es posible determinar que las variables dependientes tienen una buena relación lineal respecto a la tasa de ocupación: nivel educativo (r = 0.75), ingreso (r = 0.83). La dispersión es adecuada y las variables se distribuyen de forma normal.

#### 2.2	Cambio Estructural
Con el fin de imitar la concurrencia de errores predictivos. Se comprueba la no presencia de cambio estructural, según el test Cusum.
![](Plots/cusum.png)

#### 3.	Modelos de Regresión Lineal Múltiple

#### 3.1. Modelo 1: Caso Masculino
El modelo con todas las variables introducidas como predictores tiene un R2 media - alta (0.64) por lo que es capaz de explicar el 64% de la variabilidad de la tasa de ocupación. El p-value del modelo es significativo (3.736e-09) lo cual significa que se puede aceptar que el modelo no está dado por azar; uno de los coeficientes parciales de regresión no es significativo lo que es un indicativo de que podría no contribuir al modelo.

![](Plots/001.png)

Con el mismo nivel de significancia de 95% se determina que en el caso masculino la variable avg_edum (educación) es significativa dentro de este intervalo, el resultado obtenido corrobora que el nivel de educación no afecta negativamente la demanda ni la ocupación laboral para los hombres, pues afecta de forma positiva, en 0.56 veces su acceso al mercado de trabajo.
Con respecto al nivel de significancia de las variables independientes, para la prueba T se encuentra que ingreso promedio de los hombres (income_amm) es significativo individualmente con un nivel de confianza de 5%, infiriendo que los hombres que cuentan con un nivel de ingresos más alto son 0,0000123 veces más dados a permanecer en el mercado laboral, lo que corrobora la hipótesis planteada inicialmente, sin embargo, no en un porcentaje significativo.

#### 3.1.2. Intervalos de Confianza
Es posible determinar con estos intervalos que, con una confianza del 95%, la intersección se encuentra entre 36.63 y 64.48. Una vez más se encuentra que es muy poco probable que el verdadero valor sea 0. Se confirma el nivel de significancia bajo de la variable ingreso.

![](Plots/interval1.png)

#### 3.2. Modelo 2: Caso Femenino
El modelo con todas las variables introducidas como predictores tiene un R2 alta (0.71) por lo que es capaz de explicar el 71% de la variabilidad de la tasa de ocupación. El p-value del modelo es significativo (5.493e-11) con lo que se puede descartar que el modelo este dado por azar, uno de los coeficientes parciales de regresión no es significativo, lo que es un indicativo de que podría no contribuir al modelo.

![](Plots/002.png)

El predictor educación (avg_edum) no es significativo bajo este intervalo, lo que quiere decir que no corresponde a la hipótesis propuesta inicialmente y por tanto el nivel de educación afecta negativamente la ocupación de las mujeres. De acuerdo a los resultados, un nivel educativo más alto para una mujer disminuye sus posibilidades de acceder al mercado laboral en 6.13 veces; coeficiente que sí coincide con la problemática que aborda el problema de investigación, pues a pesar de que las mujeres cuentan con un nivel educativo más alto que los hombres en la actualidad, esto no influye directamente en sus posibilidades de acceder al mercado laboral.
Se infiere que mujeres con un nivel de ingreso más alto son 0.0000398 veces más propensas a permanecer insertadas en el mercado laboral, lo que corrobora la hipótesis planteada inicialmente que indica que entre más alto sea el rango de ingreso percibido por las mujeres existe mayor probabilidad de participación laboral, sin embargo, es un valor poco significativo.

#### 3.2.2. Intervalos de Confianza
Es posible determinar con estos intervalos que, con una confianza del 95%, la intersección se encuentra entre 10.49 y 147.72. Los intervalos de confianza para la variable educación están entre -13.78 y 1.52. E igual que con el modelo 1 se verifica el nivel de significancia bajo de la variable ingreso. La distancia en la estimación ingreso del modelo 1 y 2 son inestables lo que se confirmaría con las pruebas de colinealidad.

![](Plots/interval2.png)

#### 4.	Verificación de Supuestos

#### 4.1 Linealidad
Se calcula la relación lineal entre los predictores numéricos y los residuos del modelo. En el caso masculino los residuos se distribuyen aleatoriamente en torno a cero con una variabilidad constante, pero se percibe la posible existencia de un valor atípico en la variable educación. Se realiza una nueva gráfica que incluya la variable “periodicidad” para determinar en qué espacio temporal se ubica el valor atípico y analizarlo.


![](Plots/linearity1.png)

Este valor corresponde al tercer periodo del año 2008.

![](Plots/outlier.png)

Al abstraer la información de los residuales del predictor avg_edum se observa que, si bien existe un dato atípico, este no genera repercusión aparente en el resto de indicadores. Al analizar los datos para el año 2008 se determinan dos posibles hipótesis para esta variación. 

En términos macroeconómicos la economía colombiana sufrió una caída en la tasa del crecimiento del PIB relacionada a la crisis financiera mundial, la cual fue de más de tres puntos porcentuales con respecto a 2007; se determina que para el año 2008 hubo una variación negativa de 2,2 respecto al nivel educativo alcanzado para básica primaria, lo anterior puede explicar la afectación negativa en la disposición del gasto de los hogares y la promoción de la deserción escolar especialmente en los sectores más empobrecidos. 

En el cuarto trimestre de 2008 la crisis tuvo su mayor repercusión en la actividad económica cuando el PIB disminuyó en 0,7% en relación con 2007. Esto explicaría una disminución en el acceso a educación, sin embargo, la tasa de acceso a la educación para las mujeres permaneció constante, por lo que se podría descartar esta incidencia o asumir que la crisis económica afectó significativamente la permanencia en la educación de los niños, jóvenes y hombres.

Para finales de 2008 también hubo una variación en el máximo nivel educativo alcanzado para secundaria y postgrado, en ambos casos la variación negativa de los hombres excedió la de las mujeres. La diferencia en educación secundaria fue de 3 y mientras que la de posgrado de 1, mostrando la tendencia de las mujeres a contar con más años de estudio que se ha mencionado anteriormente.

Para el modelo femenino la distribución de la relación entre las variables es lineal, aunque es posible identificar dos observaciones inusuales al final del periodo de estudio, estás corresponden al aumento progresivo en el nivel educativo con su posible repercusión en el nivel de ingresos.


![](Plots/linearity2.png)

#### 4.2 Normalidad
En ambos casos, las variables se distribuyen de forma normal, esto se corrobora a través de medios gráficos y según la hipótesis nula del test Shapiro-Wilk. 

![](Plots/normality.png)

#### 4.3 Homocedasticidad
Esta característica que implica que la varianza de los errores es constante a lo largo del tiempo, entre más pequeña y constante dará como resultado un modelo más fiable. La distribución de los errores parece encontrarse sin perturbaciones en ambos modelos lo que se confirma con la prueba Breusch-Pagan pue se observa que se observa que el valor P es mayor que el nivel de significancia usual de 5%, por lo tanto, hay evidencias para decir que se cumple la homocedasticidad de los ei.

![](Plots/homoscedasticity.png)

#### 4.4 No Multicolinealidad
Se verifica la presencia de multicolinealidad que es un problema que sucede cuando las variables independientes están muy correlacionadas entre sí. Aunque es un valor arbitrario para este estudio se considerará como inusual el rango de 5 a 10 que es comúnmente aceptado. Se usa el método estadístico factor de inflación de la varianza (VIF, por sus siglas en inglés) que cuantifica este fenómeno en una regresión normal de mínimos cuadrados. Para los datos del modelo 1, es posible observar que los VIF son pequeños y, por lo tanto, concluir que no existe un problema de multicolinealidad.

![](Plots/multi1.png)

En el segundo modelo los valores del VIF son mayores a 10 lo que podría indicar un problema de colinealidad, esto se debe tener en cuenta en el momento de exponer las conclusiones del mismo.

![](Plots/multi2.png)

#### 4.5 No Autocorrelación
Dado que se trabaja con una medición temporal es importante que las observaciones sean independientes unas de las otras, para tal efecto se realiza el test de autocorrelación de Durbin-Watson. En el modelo masculino, con un p-value = 0.068, mayor de 0.05, no podemos rechazar la hipótesis nula. Por lo tanto, suponemos incorrelación para los residuos estudentizados del modelo ajustado. No hay evidencia de autocorrelación.

![](Plots/autoc1.png)


Mientras que en el modelo femenino el p-value = 0 y el estadístico Durbin-Watson, permite observar que ɖ cae en zona de indecisión (1.17) por lo que no es posible afirmar la presencia de autocorrelación o descartar su existencia, esto puede indicar que no existe autocorrelación de primer orden, pero sí de segundo orden.

![](Plots/autoc2.png)


Para el modelo femenino se realiza el test para Breusch-Godfrey que permite comprobar que con α: 0.05 no existe autocorrelación de primer orden, sin embargo, si de segundo orden como lo presumido el estadístico Durbin- Watson.

![](Plots/autoc22.png)

#### 5. Conclusiones
Aunque se buscaba dimensionar la incidencia del nivel de ingresos en relación a la participación laboral se pudo establecer que la variable ingreso no tiene una significancia importante para este estudio en ninguno de los modelos. El predictor educación influye de forma importante especialmente para el modelo femenino, puesto que no se constituye como la respuesta al aumento de la participación laboral, teniendo en realidad un comportamiento negativo (un nivel educativo más alto para una mujer disminuye sus posibilidades de acceder al mercado laboral en 6,13 veces). 

Por otro lado, se perciben deficiencias en la verificación de supuestos del modelo 2, encontrando un problema de multicolinealidad y de autocorrelación de segundo grado, por lo que se considera recomendable ampliar el conjunto de datos e insertar nuevos predictores.

![](Plots/summary.png)



