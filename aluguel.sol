pragma solidity 0.5.12;
// pode usar essas duas barras para incluir um comentário
/*
entre barra asterisco também pode colocar comentários que o compilador descarta
*/
contract Aluguel{

    string public locador;
    string public locatario;
    uint256 private valor;
    uint256 constant mesesmulta = 3;
    constructor(
        string memory nomeLocador,
        string memory nomeLocatario,
        uint256 valorDoAluguel)
    public {
        locador = nomeLocador;
        locatario = nomeLocatario;
        valor = valorDoAluguel;
    }    
    function valorAtualDoAluguel() public view returns (uint256){
        return valor;
    }
    function simulaMulta(uint256 mesesRestantes,
                        uint256 totalMesesContrato)
    public
    view
    returns(uint256 valorMulta) {
        valorMulta=valor*mesesmulta;
        valorMulta=valorMulta/totalMesesContrato;
        valorMulta=valorMulta*mesesRestantes;
    }
    

}
