SET client_encoding = 'UTF8';

CREATE TABLE client (
    id bigint NOT NULL,
    confirmation_code character varying(255),
    email character varying(255),
    first_name character varying(255),
    is_non_locked boolean DEFAULT true NOT NULL,
    last_name character varying(255),
    login character varying(255),
    password character varying(255),
    patronymic character varying(255)
);

CREATE TABLE client_roles (
    client_id bigint NOT NULL,
    roles character varying(255)
);

CREATE SEQUENCE hibernate_sequence
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);

ALTER TABLE client_roles
    ADD CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES client(id);

INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (79, NULL, 'goconnell@bernhard.com', 'Семён', true, 'Буков', 'CemenBukov', '$2a$08$2kTbaIVXieWDn.My.CQMhOslcXrPFPJLF9kvljX/hoVsOasebQLSu', NULL);

INSERT INTO client_roles (client_id, roles) VALUES (79, 'MANAGER');
INSERT INTO client_roles (client_id, roles) VALUES (79, 'USER');
INSERT INTO client_roles (client_id, roles) VALUES (79, 'ADMIN');

INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (47, NULL, 'condricka@hotmail.com', 'Яков', true, 'Маюров', 'YakovMaurov', '$2a$08$bBJHjTUMaA/bJhNgEOASqukg.kFs8/HwaMR2W7Q/sNdZ8cM1skCTC', NULL);
INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (48, NULL, 'hane.ayla@yahoo.com', 'Прокофий', true, 'Кравчук', 'ProkofiyKravchuk', '$2a$08$S/UI.eNQ3AR1UCjJgL6ZK.P0plyY2YaY3NAASTBJp/YtwwrMDhew2', NULL);
INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (49, NULL, 'norene04@yahoo.com', 'Тимофей', true, 'Барышев', 'TimofeyBarshev', '$2a$08$s/XttDVjEKhYj92G6wv3ReuhOzkdJtNeZhAJ.mRd2FhwCM2iyu/Ae', NULL);
INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (50, NULL, 'tianna94@gmail.com', 'Егор', true, 'Соломонов', 'EgorSolomonov', '$2a$08$c3flrxQwY2a.lDlfrJhFMO0CHFShreNynSjrrUdM1LxNP.wXDizsK', NULL);
INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (54, NULL, 'hassan66@yahoo.com', 'Владислав', true, 'Путилин', 'VladislavPutilin', '$2a$08$I22Bm.Q8pWeITPwqhoThzu1Yrx3BstYTDJPqiqPDiRdbhgzlct1L2', NULL);
INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (59, NULL, 'dylan80@yahoo.com', 'Борислав', true, 'Потёмкин', 'BorislavPotemkin', '$2a$08$IZ72sIoSb3MMqqyO5u.Qye70kPtrr7vgS8m1FENvuGImg3EUjX8.6', NULL);
INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (67, NULL, 'electa54@lowe.biz', 'Лиана', true, 'Краевская', 'LianaKraevska', '$2a$08$wGJanvpyHL6c4xKKH2pjpuGFMsKpmG8L0g9mImJMit3XCOMS.0oaG', NULL);
INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (74, NULL, 'nickolas49@ohara.org', 'Альбина', true, 'Буданова', 'AlbinaBudanova', '$2a$08$c/8Ct6ErAhWZyE000KME9em3fJn3MpkpBFaHg4/sZO03YmJuN5lUq', NULL);
INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (75, NULL, 'vladsmirn289@gmail.com', 'test', true, 'user', 'testUser', '$2a$08$EOy/VcQyDNa1fY2zURmI7.BU4yWD6B38uSDaZhP5NI0lmBk9GdjhK', NULL);
INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (76, NULL, 'bonnie99@grimes.com', 'Роман', true, 'Гусев', 'RomanGusev', '$2a$08$oP53BwvNCQ6HOLQ2lxf5POgUELYz0VwlDYFqU8B8F7kKHSxoc8qs2', NULL);
INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (77, NULL, 'kyle67@grady.com', 'Регина', true, 'Рудова', 'ReginaRudova', '$2a$08$UFoPyurxZ61He8H6.7zk2e7qB6KaypDJE5qR.Q85XglqCR3qILvTm', NULL);
INSERT INTO client (id, confirmation_code, email, first_name, is_non_locked, last_name, login, password, patronymic) VALUES (78, NULL, 'xwitting@powlowski.com', 'Вячеслав', true, 'Юнкин', 'VyacheslavYunkin', '$2a$08$L8fHcIiG0shL.DKdqxULI.7ES4GH0nQ7F5p.31Hvj5Owu/x1ykrp2', NULL);

INSERT INTO client_roles (client_id, roles) VALUES (47, 'USER');
INSERT INTO client_roles (client_id, roles) VALUES (48, 'USER');
INSERT INTO client_roles (client_id, roles) VALUES (49, 'USER');
INSERT INTO client_roles (client_id, roles) VALUES (50, 'USER');
INSERT INTO client_roles (client_id, roles) VALUES (54, 'USER');
INSERT INTO client_roles (client_id, roles) VALUES (59, 'USER');
INSERT INTO client_roles (client_id, roles) VALUES (67, 'USER');
INSERT INTO client_roles (client_id, roles) VALUES (74, 'USER');
INSERT INTO client_roles (client_id, roles) VALUES (75, 'USER');
INSERT INTO client_roles (client_id, roles) VALUES (76, 'MANAGER');
INSERT INTO client_roles (client_id, roles) VALUES (76, 'USER');
INSERT INTO client_roles (client_id, roles) VALUES (77, 'MANAGER');
INSERT INTO client_roles (client_id, roles) VALUES (77, 'USER');
INSERT INTO client_roles (client_id, roles) VALUES (78, 'MANAGER');
INSERT INTO client_roles (client_id, roles) VALUES (78, 'USER');