-- Запустите скрипт после добавления ./configs/dictionaries/

-- Show all dictionaries in your Clickhouse
-- select * from system.dictionaries;



create table if not exists dic.accom
(
    model_name String,
    lot_name String
)
    engine = Dictionary(accom);

create table if not exists dic.dic_statuses
(
    id UInt64,
    category_id UInt64,
    name String
)
    engine = Dictionary(dic_statuses);

create table if not exists dic.tb
(
    id UInt64,
    name String
)
    engine = Dictionary(tb);

create table if not exists dic.tb_gosb
(
    id UInt64,
    name String,
    tb_id UInt64
)
    engine = Dictionary(tb_gosb);

create table if not exists dic.users
(
    id UInt64,
    name String,
    tb_id UInt64,
    gosb_id UInt64
)
    engine = Dictionary(users);

create table if not exists dic.users_email
(
    email String,
    user_id UInt64
)
    engine = Dictionary(users_email);