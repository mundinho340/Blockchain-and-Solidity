// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    // Variáveis de armazenamento público para as três partes envolvidas
    address public depositor;      // Depositante - quem envia os fundos e implanta o contrato
    address public beneficiary;    // Beneficiário - quem receberá os fundos
    address public arbiter;        // Árbitro - quem aprova a transferência de fundos

    // Construtor que recebe o endereço do árbitro e do beneficiário e permite receber Ether
    constructor(address _arbiter, address _beneficiary) payable {
        // O depositante é o endereço que implanta o contrato
        depositor = msg.sender;

        // Inicializando o beneficiário e o árbitro com os argumentos fornecidos
        beneficiary = _beneficiary;
        arbiter = _arbiter;
    }

    // Função para o árbitro aprovar a transferência de fundos para o beneficiário
    function approve() external {
        // Verifica se o chamador da função é o árbitro
        require(msg.sender == arbiter, "Apenas o arbitro pode aprovar");

        // Transfere o saldo do contrato para o beneficiário
        payable(beneficiary).transfer(address(this).balance);
    }
}
