from pade.misc.utility import display_message, start_loop
from pade.core.agent import Agent
from pade.acl.aid import AID
from pade.behaviours.protocols import TimedBehaviour
from pade.acl.messages import ACLMessage
from pade.behaviours.protocols import FipaRequestProtocol
from sys import argv

class ComportamentoVendedor(FipaRequestProtocol):
    def __init__(self, agent):
        super(ComportamentoVendedor, self).__init__(agent=agent,
                                                    message=None,
                                                    is_initiator=False)
        self.produtos = 'TV 55, Notebook, Microondas'

    def handle_request(self, message):
        super(ComportamentoVendedor, self).handle_request(message)
        display_message(self.agent.aid.localname, 'Recebeu a requisição')
        resposta = message.create_reply()
        resposta.set_performative(ACLMessage.INFORM)
        resposta.set_content(self.produtos)
        self.agent.send(resposta)

class ComportamentoComprador(FipaRequestProtocol):
    def __init__(self, agent, message):
        super(ComportamentoComprador, self).__init__(agent=agent,
                                                     message=message,
                                                     is_initiator=True)

    def handle_inform(self, message):
        display_message(self.agent.aid.localname, message.content)

class ComportamentoTemporal(TimedBehaviour):
    def __init__(self, agent, time, message):
        super(ComportamentoTemporal, self).__init__(agent, time)
        self.message = message

    def on_time(self):
        super(ComportamentoTemporal, self).on_time()
        self.agent.send(self.message)

class AgenteVendedor(Agent):
    def __init__(self, aid):
        super(AgenteVendedor, self).__init__(aid=aid)
        self.comport_request = ComportamentoVendedor(self)
        self.behaviours.append(self.comport_request)

class AgenteComprador(Agent):
    def __init__(self, aid, recebedor):
        super(AgenteComprador, self).__init__(aid=aid)

        mensagem = ACLMessage(ACLMessage.REQUEST)
        mensagem.set_protocol(ACLMessage.FIPA_REQUEST_PROTOCOL)
        mensagem.add_receiver(AID(name=recebedor))
        mensagem.set_content('produtos')

        self.comport_request = ComportamentoComprador(self, mensagem)
        self.comport_temp = ComportamentoTemporal(self, 8.0, mensagem)

        self.behaviours.append(self.comport_request)
        self.behaviours.append(self.comport_temp)

if __name__ == '__main__':
    numero_agentes = 1
    c = 0
    agentes = list()
    for i in range(numero_agentes):
        porta = int(argv[1]) + c
        nome_agente_vendedor = 'agente_vendedor_{}@localhost:{}'.format(porta, porta)
        agente_vendedor = AgenteVendedor(AID(name=nome_agente_vendedor))
        agentes.append(agente_vendedor)

        nome_agente_comprador = 'agente_comprador_{}@localhost:{}'.format(porta - 10000, porta - 10000)
        agente_comprador = AgenteComprador(AID(name=nome_agente_comprador), nome_agente_vendedor)
        agentes.append(agente_comprador)

        c += 500
    start_loop(agentes)



















