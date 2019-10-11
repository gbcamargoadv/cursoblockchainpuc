pragma solidity 0.5.12;


contract Mutuo
{

    string public mutuante;
    string public mutuario;
    uint256 private valor;
    uint256 private reajuste;
    uint256 public parcelas;
    uint256 public multaatraso;
    
    constructor(
        string memory nomeMutuante,
        string memory nomeMutuario,
        uint256 valorEmprestimo,
        uint256 jurosMensais,
        uint256 numeroParcelas,
        uint256 percentualMulta) public
    {
        mutuante = nomeMutuante;
        mutuario = nomeMutuario;
        valor = valorEmprestimo;
        reajuste = jurosMensais;
        parcelas = numeroParcelas;
        multaatraso = percentualMulta;
    }
    
    function valorDaParcela (uint256 juros, uint256 valorEmprestado, uint256 prestacao) public view 
    returns (uint256 valorAtualdaParcela)
    {
        juros=jurosMensais;
        valorEmprestado=valorEmprestimo;
        prestacao=numeroParcelas;
        if (juros > 10)
        {
            juros = 10;
        }
        valorAtualdaParcela=valorEmprestado/prestacao*((1+(juros/100)));
        return valorAtualdaParcela;
    }
    
    
    
    
    function aplicaMulta (uint256 mesesAtraso, uint256 valorAtualdaParcela, uint256 percentualMulta) 
    public view
    returns (uint256 valorMulta)
    {
        require (mesesAtraso<1, "Não há atraso nas parcelas");
        for (uint i=1; i<mesesAtraso; i++)
        {
            
            valorMulta = valorAtualdaParcela+((valorAtualdaParcela*percentualMulta)/100);
            return valorMulta;
        }

    }
}
