pessoas = [('Lisboa', 'LIS'),
           ('Madrid', 'MAD'),
           ('Paris', 'CDG'),
           ('Dublin', 'DUB'),
           ('Bruxelas', 'BRU'),
           ('Londres', 'LHR')]

destino = 'FCO'

voos = {}
for linha in open('flights.txt'):
  #print(linha)
  #print(linha.split(','))
  origem, destino, saida, chegada, preco = linha.split(',')
  voos.setdefault((origem, destino), [])
  voos[(origem, destino)].append((saida, chegada, int(preco)))


def fitness_function(agenda):
    id_voo = -1
    total_preco = 0
    for i in range(len(agenda) // 2):
        origem = pessoas[i][1]
        id_voo += 1
        ida = voos[(origem, destino)][agenda[id_voo]]
        total_preco += ida[2]
        id_voo += 1
        volta = voos[(destino, origem)][agenda[id_voo]]
        total_preco += volta[2]

    return total_preco

agenda = [1,7, 3,1, 1,1, 6,3, 2,4, 5,3]
fitness_function(agenda)