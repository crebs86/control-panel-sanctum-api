<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Authentication Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines are used during authentication for various
    | messages that we need to display to the user. You are free to modify
    | these language lines according to your application's requirements.
    |
    */

    'menu' => [
        'home' => 'Home',
        'dashboard' => 'Painel de Controle',
        'admin' => 'Administração',
        'user' => 'Usuário',
        'users' => 'Usuários',
        'user_register' => 'Novo Usuário',
        'user_list' => 'Listar Usuários',
        'user_group' => 'Grupos de Usuários',
        'edit_users_on_groups' => 'Editar Usuários no Grupo',
        'tickets' => 'Chamados',
        'my_tickets' => 'Meus Chamados',
        'new_tickets' => 'Novo Chamado',
        'access_control' => 'Controle de Acesso',
        'roles' => 'Papéis',
        'permissions' => 'Permissões',
        'permissions_roles' => 'Permissões de Papéis',
        'edit_permissions_role' => 'Editar Permissões de Papéis',
        'edit_role_user' => 'Editar Papéis de Usuários',
        'profile' => 'Perfil',
        'logout' => 'Sair',
    ],

    'hello' => 'Olá',

    'register' => [
        'register' => 'Registrar',
        'name' => 'Nome',
        'email' => 'E-mail',
        'password' => 'Senha',
        'password_confirmation' => 'Confirmar Senha',
        'new_user' => 'Register a New User',
        'user_created' => 'New User Created',
        'created_successfully' => 'The user created successfully.',
    ],

    'user' => [
        'list_user' => 'Lista de Usuários',
        'user_view' => 'Ver',
        'edit_user' => 'Editar Usuário',
        'profile' => 'Perfil',
        'edit_profile' => 'Editar Perfil',
        'password_change' => 'Mudar Senha',
        'new_password' => 'Nova Senha',
        'new_password_confirmation' => 'Confirmar Nova Senha',
        'actions' => 'Ações'
    ],

    'edit_users_on_groups' => [
        'inside' => 'Dentro do Grupo',
        'outside' => 'Fora do Grupo',
        'confirm_edit_group' => 'Confirme Edição do Grupo',
        'question' => 'Você confirma as alterações no grupo?'
    ],

    'tickets' => [
        'title' => 'Chamados',
        'my_title' => 'Meus Chamados',
        'open' => 'Aberto',
        'closed' => 'Fechado',
        'author' => 'Autor',
        'created' => 'Criação',
        'priority' => 'Prioridade',
        'status' => 'Status',
        'current_department' => 'Departamento Atual',
        'department' => 'Departamento',
        'subject' => 'Assunto',
        'description' => 'Descrição',
        'last_update' => 'Última Atualização',
        'assigned' => 'Atribuido a',
        'ticket_title' => 'Título',
        'processing_ticket' => 'Processando Chamado',
        'new_message' => 'Nova Mensagem',
        'progress' => 'Progresso',
        'details' => 'Detalhes',
    ],

    'roles' => [
        'title' => 'Papéis do Sistema',
        'title_new_role' => 'Novo Papel',
        'new_role' => 'Novo Papel',
        'new_role_name' => 'Nome (ex.: post-admin)',
        'new_role_label' => 'Descrição',
    ],

    'permissions' => [
        'title' => 'Permissões do Sistema',
        'title_new_permission' => 'Nova Permissão',
        'new_permission' => 'Nova Permissão',
        'new_permission_name' => 'Nome (ex.: user_view)',
        'new_permission_label' => 'Descrição',
    ],

    'edit_permissions_roles' => [
        'title' => 'Editar Permissões de Papéis',
        'select' => 'Selecione um papel',
        'question' => 'Você confirma as alterações de permissões para este papel?',
    ],

    'edit_role_user' => [
        'title' => 'Editar Papel de Usuário',
        'select' => 'Selecione um usuário',
        'question' => 'Você confirma as alterações de papéis para este usuário?',
    ],

    'profile' => [
        'alias' => 'Apelido',
        'branch' => 'Contato',
        'address' => 'Endereço',
        'sector' => 'Setor',
        'show_acl' => 'Ver Papéis e Permissões',
        'edit_profile' => 'Editar Perfil',
    ],

    'btn' => [
        'close' => 'Fechar',
        'send' => 'Enviar',
        'save' => 'Salvar',
        'register' => 'Registrar',
        'save_user' => 'Salvar Usuário',
        'chance_password' => 'Mudar Senha',
        'send_verification_email' => 'Enviar Email de Verificação',
        'send_welcome_email' => 'Enviar E-mail de Boas Vindas',
        'mark_as_confirmed' => 'Marcar Email Como Confirmado',
        'close_ticket' => 'Fechar Chamado',
    ],

    'tables' => [
        'id' => '#',
        'name' => 'Nome',
        'email' => 'Email',
        'email_verified_at' => 'Verificado em',
        'created_at' => 'Criado em',
        'updated_at' => 'Atualizado em',
        'slug' => 'Nome',
        'status' => 'Status',
        'actions' => 'Ações',
        'user' => 'Usuário',
        'subject' => 'Assunto',
        'description' => 'Descrição',
        'date' => 'Data',
        'last_update' => 'Última Atualização',
        'assigned' => 'Atribuído',
        'new_ticket' => 'Abrir Novo Chamado',
    ],

    'titles' => [
        'new_group' => 'Novo Grupo',
        'show_users' => 'Exibir Usuários',
        'edit_group' => 'Editar Grupo',
        'delete_group' => 'Apagar ou Restaurar Grupo',
        'reload_tickets' => 'Recarregar Chamados'
    ],

    'commons' => [
        'date' => 'Data',
        'adding' => 'Inserindo',
        'removing' => 'Removendo',
        'granted' => 'Permitido',
        'denied' => 'Negado',
        'created' => 'Criado',
        'show_read' => 'Exibir Lido',
        'show_all' => 'Exibir Tudo',
        'clear_all' => 'Limpar',
        'read' => 'Lido',
        'edit' => 'Editar',
        'role' => 'papel',
        'permission' => 'Permissão'
    ]
];
