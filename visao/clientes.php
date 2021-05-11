<?php
    $clientes = pegaClientes();
?>

<main class="container">
    
    <table class="tabela">
        <thead class="tabela-cabecalho">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Sobrenome</th>
                <th>Telefone</th>
                <th>CEP</th>
                <th>Endereço</th>
                <th>Número</th>
                <th>Bairro</th>
                <th>Complemento</th>
                <th>-</th>
            </tr>
        </thead>
        <tbody class="tabela-principal">
        <?php
        for ($i = 0; $i < count($clientes); $i++) {
            echo "<tr>
                    <td>{$clientes[$i]['id']}</td>
                    <td>{$clientes[$i]['nome']}</td>
                    <td>{$clientes[$i]['sobrenome']}</td>
                    <td>{$clientes[$i]['telefone']}</td>
                    <td>{$clientes[$i]['cep']}</td>
                    <td>{$clientes[$i]['endereco']}</td>
                    <td>{$clientes[$i]['numero']}</td>
                    <td>{$clientes[$i]['bairro']}</td>
                    <td>{$clientes[$i]['complemento']}</td>
                    <td class='operacoes'>
                        <a href='/edicao-clientes?id={$clientes[$i]['id']}'>Editar</a>
                        <a href='/excluir-clientes?id={$clientes[$i]['id']}' onclick='return confirm(\"Deseja excluir?\")'>Excluir</a> 
                    </td>
                  </tr>";
        }
        ?>
        </tbody>
    </table>
</main>