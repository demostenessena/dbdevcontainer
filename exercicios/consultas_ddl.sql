-- 1. Criação da tabela independente (Superclasse)
CREATE TABLE Pessoa (
    id_pessoa SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE,
    telefone VARCHAR(20)
);

-- 2. Criação da tabela Especialidade (Independente)
CREATE TABLE Especialidade (
    id_especialidade SERIAL PRIMARY KEY,
    nome_especialidade VARCHAR(50) NOT NULL,
    descricao TEXT
);

-- 3. Criação da tabela Paciente (Subclasse de Pessoa)
CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY,
    numero_carteirinha VARCHAR(50),
    CONSTRAINT fk_paciente_pessoa FOREIGN KEY (id_paciente) REFERENCES Pessoa(id_pessoa) ON DELETE CASCADE
);

-- 4. Criação da tabela Médico (Subclasse de Pessoa)
CREATE TABLE Medico (
    id_medico INT PRIMARY KEY,
    crm VARCHAR(20) UNIQUE NOT NULL,
    CONSTRAINT fk_medico_pessoa FOREIGN KEY (id_medico) REFERENCES Pessoa(id_pessoa) ON DELETE CASCADE
);

-- 5. Criação da tabela associativa entre Médico e Especialidade (N:M)
CREATE TABLE MedicoEspecialidade (
    id_medico INT NOT NULL,
    id_especialidade INT NOT NULL,
    PRIMARY KEY (id_medico, id_especialidade),
    CONSTRAINT fk_mesp_medico FOREIGN KEY (id_medico) REFERENCES Medico(id_medico) ON DELETE CASCADE,
    CONSTRAINT fk_mesp_especialidade FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id_especialidade) ON DELETE CASCADE
);

-- 6. Criação da tabela de Agendamento (Relaciona Paciente e Médico)
CREATE TABLE Agendamento (
    id_agendamento SERIAL PRIMARY KEY,
    data_hora_consulta TIMESTAMP NOT NULL,
    status_agendamento VARCHAR(20) DEFAULT 'Agendado',
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    CONSTRAINT fk_agendamento_paciente FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    CONSTRAINT fk_agendamento_medico FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);