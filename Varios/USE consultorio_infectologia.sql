USE consultorio_infectologia;

-- Inserir pacientes fictícios --

INSERT INTO pacientes (nome, data_nascimento, genero, alergias, historico_medico)
VALUES
    ('João Silva', '1990-05-15', 'Masculino', 'Nenhuma', 'Hipertensão controlada.'),
    ('Maria Oliveira', '1985-09-23', 'Feminino', 'Penicilina', 'Diabetes tipo 2.'),
    ('Carlos Santos', '1982-12-10', 'Masculino', 'Aspirina', 'Alergia a frutos do mar.'),
    ('Ana Souza', '1995-03-28', 'Feminino', 'Nenhuma', 'Histórico de cirurgia cardíaca.'),
    ('Rodrigo Costa', '1988-07-02', 'Masculino', 'Nenhuma', 'Asma crônica.'),
    ('Camila Lima', '1992-11-18', 'Feminino', 'Amoxicilina', 'Problemas gastrointestinais.'),
    ('Lucas Pereira', '1980-08-05', 'Masculino', 'Ibuprofeno', 'Hipotireoidismo.'),
    ('Juliana Santos', '1987-04-14', 'Feminino', 'Nenhuma', 'Histórico de depressão.'),
    ('Paulo Rocha', '1975-09-30', 'Masculino', 'Nenhuma', 'Diabetes tipo 1.'),
    ('Fernanda Oliveira', '1998-12-20', 'Feminino', 'Sulfametoxazol', 'Alergia a penicilina.'),
    ('Rafael Mendes', '1983-06-25', 'Masculino', 'Paracetamol', 'Nenhuma.'),
    ('Isabela Almeida', '1993-02-08', 'Feminino', 'Nenhuma', 'Hipertensão.'),
    ('Gabriel Lima', '1989-10-12', 'Masculino', 'Nenhuma', 'Histórico de colesterol elevado.'),
    ('Amanda Silva', '1996-07-17', 'Feminino', 'Dipirona', 'Nenhuma.'),
    ('Thiago Santos', '1986-01-22', 'Masculino', 'Nenhuma', 'Problemas renais.'),
    ('Laura Oliveira', '1991-04-03', 'Feminino', 'Nenhuma', 'Alergia a poeira.'),
    ('Diego Costa', '1981-11-07', 'Masculino', 'Claritromicina', 'Nenhuma.'),
    ('Carolina Souza', '1994-09-15', 'Feminino', 'Nenhuma', 'Enxaqueca crônica.'),
    ('Fábio Lima', '1978-03-12', 'Masculino', 'Nenhuma', 'Artrite reumatoide.'),
    ('Patrícia Mendes', '1984-06-08', 'Feminino', 'Nenhuma', 'Hipotensão.'),
    ('Alexandre Rocha', '1997-08-19', 'Masculino', 'Doxiciclina', 'Alergia a frutos do mar.');
