INSERT INTO "users" ("id", "email", "first_name", "last_name", "password", "created", "version")
    VALUES (0, 'admin@example.com', 'Addy', 'Mon', '$2a$10$7b.9iLgXFVh.r1u9HEbMv.EDL3JcJgldsWHUg4etSUh4wCNGuExye', NOW(), 0)
    ON CONFLICT DO NOTHING;
INSERT INTO "user_roles" ("id", "role") VALUES (0, 'admin')
    ON CONFLICT DO NOTHING;
INSERT INTO "user_roles" ("id", "role") VALUES (0, 'user')
    ON CONFLICT DO NOTHING;
INSERT INTO "users" ("id", "email", "first_name", "last_name", "password", "created", "version", "profile_picture_ref", "links")
    VALUES (1, 'user@example.com', 'Yu', 'Ser', '$2a$10$7b.9iLgXFVh.r1u9HEbMv.EDL3JcJgldsWHUg4etSUh4wCNGuExye', NOW(), 0, 'S3 reference to be implemented', ARRAY ['gh:https://github.com/asdf','pw:http://www.asdf.com', 'li:https://www.linkedin.com/in/asdf'])
    ON CONFLICT DO NOTHING;
INSERT INTO "user_roles" ("id", "role") VALUES (1, 'user')
    ON CONFLICT DO NOTHING;




INSERT INTO platforms (id, platform_name, platform_code, pattern, icon_ref, version)
    VALUES (0, 'GitHub', 'gh', 'https://github.com/.+', 'material icon', 0)
    ON CONFLICT DO NOTHING;
INSERT INTO platforms (id, platform_name, platform_code, pattern, icon_ref, version)
    VALUES (1, 'Website', 'pw', 'https://.+\..+', 'material icon', 0)
    ON CONFLICT DO NOTHING;
INSERT INTO platforms (id, platform_name, platform_code, pattern, icon_ref, version)
    VALUES (2, 'LinkedIn', 'li', 'https://www.linkedin.com/in/.+', 'material icon', 0)
    ON CONFLICT DO NOTHING;

ALTER SEQUENCE IF EXISTS hibernate_sequence RESTART WITH 10;
ALTER SEQUENCE IF EXISTS projects_seq RESTART WITH 10;
ALTER SEQUENCE IF EXISTS tasks_seq RESTART WITH 10;
ALTER SEQUENCE IF EXISTS users_seq RESTART WITH 10;