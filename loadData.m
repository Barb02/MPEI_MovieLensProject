function [Set,NumUsers,users] = loadData(ficheiro)
    udata = load(ficheiro); % Carrega o ficheiro dos dados dos filmes
    u = udata(1:end,1:3); clear udata;
    
    % Lista de utilizadores
    users = unique(u(:,1)); % Extrai os IDs dos utilizadores
    NumUsers = length(users); % Numero de utilizadores
    % Constroi a lista de filmes para cada utilizador
    
    Set = cell(NumUsers,1); % Usa células
    for n = 1:NumUsers % Para cada utilizador
        % Obtém os filmes de cada um
        ind = find(u(:,1) == users(n));
        % E guarda num array. Usa células porque utilizador tem um número
        % diferente de filmes. Se fossem iguais podia ser um array
        Set{n} = [Set{n} u(ind,2) u(ind,3)];
    end
end

