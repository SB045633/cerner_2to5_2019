import matplotlib.pyplot as plt
import numpy as np

years = (list(range(1970,2019)))
years = np.array(years)

spRate = np.array([0.10,10.79,15.63,-17.37,-29.72,31.55,19.15,-11.50,1.06,12.31,25.77,-9.73,14.76,17.27,1.40,26.33,14.62,2.03,12.40,27.25,-6.56,26.31,4.46,7.06,
-1.54,34.11,20.26,31.01,26.67,19.53,-10.14,-13.04,-23.37,26.38,8.99,3.00,13.62,3.53,-38.49,23.45,12.78,0.00,13.41,29.60,11.39,-0.73,9.54,19.42,-6.24])

infRate = np.array([5.60,3.30,3.40,8.70,12.30,6.90,4.90,6.70,9.00,13.30,12.50,8.90,3.80,3.80,3.90,3.80,1.10,4.40,4.40,4.60,6.10,3.10,2.90,2.70,2.70,2.50,3.30,1.70,1.60,2.70,
3.40,1.60,2.40,1.90,3.30,3.40,2.50,4.10,0.10,2.70,1.50,3.00,1.70,1.50,0.80,0.70,2.10,2.10,1.90])

plt.title('Inflation Rate vs S&P 500 Annual Returns')
plt.ylabel('Rates (%)')
plt.xlabel('Years')
plt.grid('True')

plt.xlim(1970,2020)
plt.plot(years, infRate, 'b', label = "Inflation Rate")
plt.plot(years, spRate, 'g', label = "S&P 500 Annual Return")

plt.legend()
plt.show()