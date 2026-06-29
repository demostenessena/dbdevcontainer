/* O comando de INSERT abaixo tem como objetivo inserir esses elementos na tabela Pessoa */
INSERT INTO Pessoa (nome, cpf, data_nascimento, email, endereco, telefone)
VALUES 
('Pedro I', '002', '10-01-1479', 'pp@email.com', 'R. Vasco', NULL),
('Pedro II', '003', '10-02-1516', 'ps@email.com', 'R. Flamengo', '5501'),
('D João VI', '001', '01-12-1415', 'dj@email.com', 'R. Portugal', NULL),
('JJ Xavier', '004', '12-11-1746', 'jj@email.com', 'R. Minas', '5502');

/* O comando de INSERT abaixo tem como objetivo inserir esses elementos na tabela Paciente */
INSERT INTO Paciente (cpf_pessoa, senha, plano_saude)
VALUES 
('002', 'senha1', FALSE),
('003', 'senha2', TRUE);

/* O comando de INSERT abaixo tem como objetivo inserir esses elementos na tabela Medico */
INSERT INTO Medico (cpf_pessoa, crm)
VALUES 
('001', '111'),
('004', '112');

/* O comando de INSERT abaixo tem como objetivo inserir esses elementos na tabela Especialidade */
INSERT INTO Especialidade (descricao)
VALUES 
('Pediatra'),
('Cardiologista'),
('Ortopedista');

/* O comando de INSERT abaixo tem como objetivo inserir esses elementos na tabela MedicoEspecialidade */
INSERT INTO MedicoEspecialidade (cpf_medico, id_especialidade)
VALUES 
('001', 01),
('004', 02),
('004', 03);

/* O comando de INSERT abaixo tem como objetivo inserir esses elementos na tabela Agendamento, com utilização do método 'to_timestamp' para ele reconhecer esse formato de data-hora, uma vez que no momento em que foi executado sem esse comando, acusou um erro */
INSERT INTO Agendamento (cpf_paciente, cpf_medico, dh_consulta, dh_agendamento, valor_consulta)
VALUES 
('002', '001', to_timestamp('14-04-1782 16:00', 'DD-MM-YYYY HH24:MI'), to_timestamp('14-03-1782 10:04:45', 'DD-MM-YYYY HH24:MI:SS'), 80.0),
('002', '004', to_timestamp('15-04-1782 10:00:00', 'DD-MM-YYYY HH24:MI:SS'), to_timestamp('14-03-1782 10:04:45', 'DD-MM-YYYY HH24:MI:SS'), 100.0),
('002', '004', to_timestamp('17-05-1783 08:00:00', 'DD-MM-YYYY HH24:MI:SS'), to_timestamp('10-05-1783 16:32:00', 'DD-MM-YYYY HH24:MI:SS'), 100.0),
('003', '001', to_timestamp('17-05-1783 08:30:00', 'DD-MM-YYYY HH24:MI:SS'), to_timestamp('09-05-1783 09:05:56', 'DD-MM-YYYY HH24:MI:SS'), 0.0);