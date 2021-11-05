from pade.misc.utility import display_message, start_loop
from pade.core.agent import Agent
from pade.acl.aid import AID
from sys import argv
from pade.behaviours.protocols import TimedBehaviour

class Comportamento(TimedBehaviour):
    def __init__(self, agent, time):
        super(Comportamento, self).__init__(agent, time)

    def on_time(self):
        super(Comportamento, self).on_time()
        display_message(self.agent.aid.localname,
                        'Olá do agente ' + str(self.agent.aid.localname))

class Agente(Agent):
    def __init__(self, aid):
        super(Agente, self).__init__(aid=aid)
        #display_message(self.aid.localname, 'Olá')
        comportamento = Comportamento(self, 2.0)
        self.behaviours.append(comportamento)

if __name__ == '__main__':
    numero_agentes = 2
    c = 0
    agentes = list()
    for i in range(numero_agentes):
        porta = int(argv[1]) + c
        nome_agente = 'agente{}@localhost:{}'.format(porta, porta)
        agente = Agente(AID(name=nome_agente))
        agentes.append(agente)
        c += 1000
    start_loop(agentes)