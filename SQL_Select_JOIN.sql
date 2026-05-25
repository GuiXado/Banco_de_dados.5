USE empresa

INSERT INTO users (name, username, password, email) VALUES
('Joao', 'Ti_joao', '123mudar', 'joao@empresa.com')

INSERT INTO projects (name, description, data) VALUES
('Atualização de Sistemas', 'Modificação de Sistemas Operacionais nos PC´s', '2014-09-12')

-- Consulta do ID, nome e email dos usuários,
-- junto do ID, nome, descrição e data dos projetos,
-- dos usuários que participaram do projeto 'Re-Folha'

SELECT 
	usr.id,
	usr.name,
	usr.email,
	pr.id,
	pr.name,
	pr.description,
	pr.data
FROM users usr, projects pr, users_has_projects up
WHERE usr.id = up.users_id
	AND up.projects_id = pr.id
	AND pr.name = 'Re-Folha'


-- Consulta do nome dos projetos que não possuem usuários vinculados

SELECT 
	pr.name
FROM projects pr LEFT OUTER JOIN users_has_projects up
ON pr.id = up.projects_id
WHERE up.users_id IS NULL


-- Consulta do nome dos usuários que não possuem projetos vinculados

SELECT
	usr.name
FROM users usr LEFT OUTER JOIN users_has_projects up
ON usr.id = up.users_id
WHERE up.users_id IS NULL