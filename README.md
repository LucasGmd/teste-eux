<h3>Versionamento</h3>

<span>Procurei utilizar as versões que estava mais familiarizado.</span>
<ul>
    <li>Ubuntu 20.04.2 LTS</li>
    <li>Ruby 2.6.7</li>
    <li>Rails 5.2.6</li>
    <li>Postgres 12.7</li>
</ul>

<h3>Gems</h3>
<span>Além das <i>gems</i> padrões do Rails 5, foram incuidas na aplicação as seguintes: </span>
<ul>
    <li>gem 'bootstrap' (<i>adicionando bootstrap</i>)</li>
    <li>gem 'jquery-rails' (<i>adicionando jquery</i>)</li>
    <li>gem 'pry' (<i>Para debugar código</i>)</li>
    <li>gem 'awesome_print' (<i>printa as saídas do console mais claramente</i>)</li>
</ul>

<h3>Iniciando a aplicação</h3>
<ul>
    <li>Dentro da pasta "teste-euax"</li>
    <ul>
        <li>Executar "bundle install" para buscar e instalar as <i>gems</i> necessárias.</li>
        <li>Executar "rake db:creat db:migrate" para criar e migrar o banco "teste-euax". Foi utilizado o usuário padrão "postgres" e port "5432".</li>
        <li>Executar "rails s" para subir a aplicação. Enviado para "http://localhost:3000/"</li>
    </ul>
</ul>

<h3>Instruções</h3>
<ul>
    <li><b>Listagem de projetos</b></li>
    <ul>
        <li>Ao acessar a tela inicial é exibido a lista de projetos. Onde é permitido criar, editar, visualizar e deletar projetos.</li>
        <li>A listagem de projeto pode ser acessada também clicando no botão "Projetos" no menu superior.</li>
    </ul>
    <li><b>Criar novo projeto</b></li>
    <ul>
        <li>Na listagem de projetos, clique no botão "+ Projeto", no canto superior direito, para cadastrar um novo projeto.</li>
    </ul>
    <li><b>Listagem de atividades</b></li>
    <ul>
        <li>A listagem de atividades pode ser acessada clicando no botão "Atividades" no menu superior. Onde é permitido criar, editar, visualizar e deletar atividades.</li>
    </ul>
    <li><b>Criar nova atividade</b></li>
    <ul>
        <li>Na listagem das atividades, clique no botão "+ Atividade", no canto superior direito, para cadastrar uma nova atividade.</li>
        <li>Uma atividade também pode ser criada na tela de edição de um projeto, clicando no botão "+ Atividade" dentro da seção "Atividades do projeto"</li>
    </ul>
    <li><b>Edição de atividades do projeto</b></li>
    <ul>
        <li>Dentro da seção "Atividades do projeto" na tela da edição de projeto, são listados as atividades relacionadas ao projeto em questão. Podendo estas atividades serem também editadas nessa tela.</li>
    </ul>
    <li><b>Projeto atrasado e % completo</b></li>
    <ul>
        <li>Ao atualizar as atividades de um projeto, é possível visualizar na listagem de produtos ou dentro de seu formulário se o mesmo está atrasdo e a porcentagem de conclusão.</li>
    </ul>
    <li><b>Exclusão de projetos</b></li>
    <ul>
        <li>Ao exlcuir um projeto, todas as atividades relacionadas ao projeto excluído também são deletadas.</li>
    </ul>
</ul>

<h3>Testes</h3>
<span>Para executar os testes "ruby -Itest test/<i>pasta</i>/<i>arquivo.rb</i>"</span>
<ul>
    <li>Teste de modelo:</li>
    <ul>
        <li>projeto.rb</li>
        <li>atividades.rb</li>
    </ul>
    <li>Teste de controller:</li>
    <ul>
        <li>projetos_controller.rb</li>
        <li>atividades_controller.rb</li>
    </ul>
</ul>