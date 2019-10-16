pragma solidity 0.5.12;

contract Mutuo
{

    string public mutuante;
    string public mutuario;
    uint256 private valor;
    uint256 public parcelas;
    uint256 juros;
    uint256 multa;
    
    constructor(
        string memory nomeMutuante,
        string memory nomeMutuario,
        uint256 valorEmprestimo,
        uint256 numeroParcelas,
        uint256 jurosMensais,
        uint256 multaMensal)
         public
    {
        mutuante = nomeMutuante;
        mutuario = nomeMutuario;
        valor = valorEmprestimo;
        parcelas = numeroParcelas;
        juros = jurosMensais;
        multa = multaMensal;
    }
    

    function jurosAcumulados () public view 
    returns (uint256 jurosTotais)
    {    
        for(uint256 i=0; i<parcelas; i++) {
            jurosTotais = (valor*(juros)/100);
        }
        return jurosTotais;
    }   
    
    function valorAtualdaParcela () public view
    returns (uint256 valorParcela)
    {
        valorParcela=(valor+juros)/parcelas;
        return valorParcela;
    }
        
    function saldoDevedor (uint256 parcelasPagas) public view
    returns (uint256 saldoDevedorAtualizado)
    {
        saldoDevedorAtualizado = (valor + jurosAcumulados()) - (parcelasPagas*valorAtualdaParcela());
        return saldoDevedorAtualizado;
    }
    
    
    function aplicaMulta (uint256 mesesAtraso, uint256 percentualMulta) 
    public view
    returns (uint256 valorcomMulta)
    {
        
        require(mesesAtraso>1, "Não há atraso");
        for(uint256 i=0; i<mesesAtraso; i++) 
        {
            valorcomMulta = (valor/parcelas)+((valor/parcelas*percentualMulta)/100);
            return valorcomMulta;
        }

    }
}
