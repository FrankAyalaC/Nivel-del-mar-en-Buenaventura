import pandas as pd #Manejo de datos (Importar csv)
import numpy as np
import keras
import sklearn
from sklearn import metrics 
#import tensorflow as tf
from keras.models import Sequential
from keras.layers import Dense

#Vector de columnas que se usaran de la BD
col_names=['']		
#lectura de DB
datos = pd.read_csv(".csv",names=col_names)
#nombre de las columnas de las variables independientes
cols_atributos = ['']
#seleccion de las x1,x2,x3.....
X = datos[cols_atributos]
#normalizacion de variables cualitativas. se genera una columna en al matriz de entrada por cada etiqueta de una variable cualitativa
X = pd.get_dummies(X)
#y variable dependiente
y = datos.sex
#y = keras.utils.to_categorical(y)
#70% entrenamiento y 30% prueba
#Formulacion del modelo
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=1)
#Creación del modelo
model = Sequential()
#Capa de entrada y capa escondida 1
#en input dim se debe configurar segun el tamaño de la matriz de entrada
model.add(Dense(10, input_dim = 32, activation ='relu'))
#Capa escondida 2
model.add(Dense(10, activation ='relu'))
#Capa de salida
model.add(Dense(1,activation='sigmoid'))
#Compilación del modelo
model.compile(loss = 'binary_crossentropy', optimizer = 'adam', metrics = ['accuracy'])
#Entrenamiento del modelo
model.fit(X_train, y_train, verbose = 0)#,epochs=200,batch_size=20)
#Evaluación
_, accuracy = model.evaluate(X_test, y_test, verbose = 0)

print('Precisión: %.2f' % (accuracy))
#Predicción
predicciones = model.predict(X) #--->Predice con probabilidades
#predicciones = model.predict_classes(X)
prec=pd.DataFrame(data)


 

