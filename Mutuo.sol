pragma solidity 0.5.12;
// pode usar essas duas barras para incluir um comentário
/*
entre barra asterisco também pode colocar comentários que o compilador descarta
*/
contract Mutuo
{

    string public mutuante;
    string public mutuario;
    uint256 private valor;
    uint256 private reajuste;
    uint256 public parcelas;
    uint256 constant multaatraso = 2
    
    constructor(
        string memory nomeMutuante,
        string memory nomeMutuario,
        uint256 valorEmprestimo
        uint256 jurosMensais
        uint256 numeroParcelas) public
    {
        mutuante = nomeMutuante;
        mutuario = nomeMutuario;
        valor = valorEmprestimo;
        reajuste = jurosMensais;
        parcelas = numeroParcelas;
    }
    
    function valorDaParcela() public view 
    returns (uint256 valorAtualdaParcela)
    {
        valorAtualdaParcela=valor/parcelas*((1+(reajuste/100)));
        return valorAtualdaParcela
    }
    
    
    
    function reajustaParcela(uint256 jurosMensais) public
    {
        if (jurosMensais > 10)
        {
            jurosMensais = 10;
        }
        uint256 valorDoAcrescimo = 0;
        valorDoAcrescimo = ((valor*percentualReajuste)/100);
        valor = valor+valorDoAcrescimo;
    }

    
    function aplicaMulta (uint256 mesesAtraso) 
    public view
    returns(uint256 valorMulta)
    {
        require (mesesRestantes=0, "Não há atraso nas parcelas");
        for (uint i=1; i<mesesAtraso; i++)
        {
            valorMulta = valorAtualdaParcela+((valorAtualdaParcela*multaatraso)/100);
            return valorMulta
        }

    }
