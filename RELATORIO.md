## Relatorio do jogo

### Fases

- Fase 1
    - Tema de inverno, neve e montanhas com percurso composto por diferentes tipos de percurso.
- Fase 2
    - Tema de floresta ou lago com o percurso composto por pulos mais difíceis e com uma passagem secreta que da acesso a outra área.

### Parallax

- os valores utilizados de scroll scale foram:
    - 0.1 para o background/fundo mais longe
    - 0.2 para nuvens e partes que estão mais a frente que o background
    - 0.3 para árvores mais proximas

- A mudança foi feita para que diferentes partes do plano de fundo ,que antes era estático, se movam em diferentes velocidades

### Área secreta

- A área secreta fica no meio do nível 2, dentro de uma passagem cercada por árvores que podem servir de indicação para o jogador

### Câmera

- A câmera escolhida foi a que fica dentro do Player, única para todos os cenários pois não foi necessária a mudança

### A transição

- A troca de fase não deve ser chamada diretamente durante a detecção da colisão porque esse sinal pode ser executado enquanto o Godot ainda está processando a física da cena atual. Se a cena for removida ou substituída nesse momento, podem ocorrer erros por alterar nós que ainda estão sendo utilizados pelo processamento de física. Por isso, utilizamos call_deferred(), que adia a troca de cena até um momento seguro, depois que o processamento atual termina.

### O que travou

- Um pouco de dificuldade na configuraçao das transiçoes entre as fases e configuraçao do "portal"