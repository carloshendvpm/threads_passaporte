import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("results.csv")

algorithms = df['Algorithm'].unique()

plt.figure(figsize=(12, 8))

for algorithm in algorithms:
    data = df[df['Algorithm'] == algorithm]
    plt.plot(data['Size'], data['Time'], marker='o', label=algorithm)

plt.title("Desempenho dos Algoritmos de Ordenação")
plt.xlabel("Tamanho do Array")
plt.ylabel("Tempo de Execução (segundos)")
plt.legend()
plt.grid()

plt.savefig("sorting_performance.png")
plt.show()
