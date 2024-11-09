import exceptionsPropias.*

class Expedicion{
    const aldeasAInvadir
    const capitalAInvadir
    const vikingos

    method subirAExpedicion(unVikingo)
    {  if(unVikingo.puedeIrAexpedicion())
        {
            vikingos.add(unVikingo)
        }else{ throw new NoPuedoIrAlaExpedicionException()}
    
    }

    method valeLaPenaInvadirCapital() =
        self.botinDeInvasionACapital() > 3 * vikingos.size()
    

    method botinDeInvasionACapital()=
        vikingos.size() * capitalAInvadir.factorDeRiqueza()
    

    method invadirCapital()
    {
        vikingos.forEach({unVikingo => unVikingo.cobrarVida()})
    }

    method valeLaPenaInvadirAldeas()=
        aldeasAInvadir.all({unaAldea => self.botinDeInvasionAAldea(unaAldea)  > 15}) &&
        aldeasAInvadir.all({unaAldea => unaAldea.defensaDeVikingos() < vikingos.size()})
    
    method botinDeInvasionAAldea(unaAldea) =
        unaAldea.crucifijos()
    
    method botinDeInvasionAAldeas()
    {
        return aldeasAInvadir.sum({unaAldea => self.botinDeInvasionAAldea(unaAldea)})
    }

    method valeLaPenaRealizarExpedicion() =
        self.valeLaPenaInvadirAldeas() &&
        self.valeLaPenaInvadirCapital()

    method botinDeExpedicion()
    {
        return self.botinDeInvasionAAldeas() + self.botinDeInvasionACapital()       
    }

    method realizarExpedicion()
    {
        self.invadirCapital()
        self.dividirBotinDeExpedicion(self.botinDeExpedicion())
    }
    
    method dividirBotinDeExpedicion(unBotin)
    {
        vikingos.forEach({unVikingo => unVikingo.obtener(unBotin/ vikingos.size())})
    }
    

}