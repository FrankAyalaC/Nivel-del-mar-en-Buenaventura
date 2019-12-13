marea_real=mfull
marea_astro=pd.Series(index=,data=astro_completa)
maximos_real,maximos_astro=[],[]
for i in range(len()):
	real_window=marea_real[datetime():datetime]
	astro_window=marea_astro[datetime():datetime]
	max_real=np.max(real_window)
	max_astro=np.max(astro_window)
	maximos_real.append(max_real)
	maximos_astro.append(max_astro)
	
	
plt.plot(marea_real.index,maximos_real) 
plt.plot(marea_astro.index,maximos_astro)
