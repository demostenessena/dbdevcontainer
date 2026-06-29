/* Observação: carga inicial da tabela Pessoa. */
INSERT INTO Pessoa (nome, cpf, data_nascimento, email, endereco, telefone)
VALUES 
('Pedro I', '002', '10-01-1479', 'pp@email.com', 'R. Vasco', NULL),
('Pedro II', '003', '10-02-1516', 'ps@email.com', 'R. Flamengo', '5501'),
('D João VI', '001', '01-12-1415', 'dj@email.com', 'R. Portugal', NULL),
('JJ Xavier', '004', '12-11-1746', 'jj@email.com', 'R. Minas', '5502');

/* Observação: cadastro dos pacientes. */
INSERT INTO Paciente (cpf_pessoa, senha, plano_saude)
VALUES 
('002', 'senha1', FALSE),
('003', 'senha2', TRUE);

/* Observação: cadastro dos médicos. */
INSERT INTO Medico (cpf_pessoa, crm)
VALUES 
('001', '111'),
('004', '112');

/* Observação: especialidades disponíveis. */
INSERT INTO Especialidade (descricao)
VALUES 
('Pediatra'),
('Cardiologista'),
('Ortopedista');

/* Observação: vínculo entre médicos e especialidades. */
INSERT INTO MedicoEspecialidade (cpf_medico, id_especialidade)
VALUES 
('001', 01),
('004', 02),
('004', 03);

/* Observação: consultas com data e hora usando to_timestamp. */
INSERT INTO Agendamento (cpf_paciente, cpf_medico, dh_consulta, dh_agendamento, valor_consulta)
VALUES 
('002', '001', to_timestamp('14-04-1782 16:00', 'DD-MM-YYYY HH24:MI'), to_timestamp('14-03-1782 10:04:45', 'DD-MM-YYYY HH24:MI:SS'), 80.0),
('002', '004', to_timestamp('15-04-1782 10:00:00', 'DD-MM-YYYY HH24:MI:SS'), to_timestamp('14-03-1782 10:04:45', 'DD-MM-YYYY HH24:MI:SS'), 100.0),
('002', '004', to_timestamp('17-05-1783 08:00:00', 'DD-MM-YYYY HH24:MI:SS'), to_timestamp('10-05-1783 16:32:00', 'DD-MM-YYYY HH24:MI:SS'), 100.0),
('003', '001', to_timestamp('17-05-1783 08:30:00', 'DD-MM-YYYY HH24:MI:SS'), to_timestamp('09-05-1783 09:05:56', 'DD-MM-YYYY HH24:MI:SS'), 0.0);

/* Observação: ajuste da data de nascimento de D João VI. */
UPDATE Pessoa
SET data_nascimento = DATE '1416-12-01'
WHERE nome = 'D João VI';

/* Observação: ajuste do contato de D Pedro I. */
UPDATE Pessoa
SET telefone = '5503',
    email = 'pf@email.com'
WHERE nome = 'Pedro I';

/* Observação: acréscimo do dígito 9 nos telefones cadastrados. */
UPDATE Pessoa
SET telefone = '9' || telefone
WHERE telefone IS NOT NULL;

/* Observação: reagendamento das consultas de 17-05-1783. */
UPDATE Agendamento
SET dh_consulta = dh_consulta + interval '2 days',
    valor_consulta = 150.0
WHERE dh_consulta::date = DATE '1783-05-17';

/* Observação: JJ Xavier passa a atender como Pediatra e Ortopedista. */
UPDATE MedicoEspecialidade
SET id_especialidade = '01'
WHERE cpf_medico = '004'
  AND id_especialidade = '02';