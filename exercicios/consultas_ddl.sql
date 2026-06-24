CREATE TABLE Pessoa (
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) PRIMARY KEY,
    data_nascimento DATE NOT NULL,
    email VARCHAR(50) NOT NULL,
    endereco VARCHAR(300) NOT NULL,
    telefone VARCHAR(15),
    CONSTRAINT pessoa_un UNIQUE (email, nome)
);

CREATE TABLE Paciente (
    cpf_pessoa CHAR(11) PRIMARY KEY,
    senha VARCHAR(20) NOT NULL,
    plano_saude BOOLEAN NOT NULL DEFAULT 0,
    CONSTRAINT fk_paciente_pessoa FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf) ON DELETE CASCADE
);

CREATE TABLE Medico (
    cpf_pessoa CHAR(11) PRIMARY KEY NOT NULL,
    crm VARCHAR(10) UNIQUE NOT NULL,
    CONSTRAINT fk_medico_pessoa FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf) ON DELETE CASCADE
);

CREATE TABLE Agendamento (
    cpf_paciente CHAR(11) NOT NULL,
    cpf_medico CHAR(11) NOT NULL,
    dh_consulta TIMESTAMP NOT NULL,
    PRIMARY KEY (cpf_paciente, cpf_medico, dh_consulta),
    dh_agendamento TIMESTAMP DEFAULT current_timestamp,
    valor_consulta FLOAT NOT NULL DEFAULT 0.0,
    CONSTRAINT fk_agendamento_paciente FOREIGN KEY (cpf_paciente) REFERENCES Paciente(cpf_pessoa),
    CONSTRAINT fk_agendamento_medico FOREIGN KEY (cpf_medico) REFERENCES Medico(cpf_pessoa)
);

CREATE TABLE Especialidade (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(300) NOT NULL
);

CREATE TABLE MedicoEspecialidade (
    cpf_medico CHAR(11) NOT NULL,
    id_especialidade INT NOT NULL,
    PRIMARY KEY (cpf_medico, id_especialidade),
    CONSTRAINT fk_mesp_medico FOREIGN KEY (cpf_medico) REFERENCES Medico(cpf_pessoa) ON DELETE CASCADE,
    CONSTRAINT fk_mesp_especialidade FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id) ON DELETE CASCADE
);

