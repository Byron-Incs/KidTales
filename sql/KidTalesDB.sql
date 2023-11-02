create database KidTalesDB;
use KidTalesDB;

create table usuario(
id_up int auto_increment not null,
username nvarchar(100),
correo nvarchar(100),
pasword int(50),
primary key(id_up)
);

create table soporte(
id_sp int auto_increment not null,
nombre nvarchar(100),
correo_sp nvarchar(100),
psw_sp int(50),
primary key(id_sp)
);

create table metodos_pago(
id_mp int auto_increment not null,
primary key(id_mp)
);

create table sub_usuario(
id_su int auto_increment not null,
nickname nvarchar(100),
primary key(id_su)
);

create table favoritos(
id_fav int auto_increment not null,
titulo_f nvarchar(100),
contenido_f text,
primary key(id_fav)
);

create table cuentos(
id_cuento int auto_increment not null,
titulo_c nvarchar(100),
genero_c nvarchar(50),
contenido_c text,
edad int(2),
primary key(id_cuento)
);

create table preestablecidos(
id_pre int auto_increment not null,
titulo_p nvarchar(100),
contenido_p text,
primary key(id_pre)
);

create table test_data(
id_test int auto_increment not null,
titulo_t nvarchar(100),
genero_t nvarchar(50),
contenido_t text,
edad int(2),
primary key(id_test)
);

create table imagenes (
id_imagen int auto_increment not null,
RutaArchivo varchar(255),
primary key(id_imagen)
);

create table robot(
id_rt int auto_increment not null,
archivo_voz varchar(255),
primary key(id_rt)
);

create table ropa (
id_ropa int auto_increment not null,
nombre_r varchar(255),
primary key(id_ropa)
);

create table color(
id_c int auto_increment not null,
hexadecimal char(7),
primary key(id_c)
);

create table ia(
id_ia int auto_increment not null,
primary key(id_ia)
);

create table idioma(
id_lg int auto_increment not null,
nombre varchar(50),
codigo varchar(10),
primary key(id_lg)
);

create table mensajes (
id_msg int auto_increment primary key,
contenido text,
fecha_envio timestamp default current_timestamp
);

create table conversaciones (
    id_cnv int auto_increment primary key
);

create table u_msg_cnv(
id_cnv int,
id_msg int,
id_up int,
id_sp int,
foreign key (id_cnv) references conversaciones(id_cnv) on delete cascade on update
cascade,
foreign key (id_msg) references mensajes(id_msg) on delete cascade on update
cascade,
foreign key (id_up) references usuario(id_up) on delete cascade on update
cascade,
foreign key (id_sp) references soporte(id_sp) on delete cascade on update
cascade);

create table u_sub(
id_up int,
id_su int,
foreign key (id_up) references usuario (id_up) on delete cascade on update
cascade,
foreign key (id_su) references sub_usuario (id_su) on delete cascade on update cascade);

create table u_lg(
id_up int,
id_lg int,
foreign key (id_up) references usuario (id_up) on delete cascade on update
cascade,
foreign key (id_lg) references idioma (id_lg) on delete cascade on update cascade);

create table u_mp(
id_up int,
id_mp int,
foreign key (id_up) references usuario (id_up) on delete cascade on update
cascade,
foreign key (id_mp) references metodos_pago (id_mp) on delete cascade on update cascade);

create table sub_rt(
id_su int,
id_rt int,
foreign key (id_su) references sub_usuario (id_su) on delete cascade on update
cascade,
foreign key (id_rt) references robot (id_rt) on delete cascade on update cascade);

create table rt_c(
id_rt int,
id_cuento int,
foreign key (id_rt) references robot (id_rt) on delete cascade on update
cascade,
foreign key (id_cuento) references cuentos (id_cuento) on delete cascade on update cascade);

create table ia_c(
id_ia int,
id_cuento int,
foreign key (id_ia) references ia (id_ia) on delete cascade on update
cascade,
foreign key (id_cuento) references cuentos (id_cuento) on delete cascade on update cascade);

create table sub_pre(
id_su int,
id_pre int,
foreign key (id_su) references sub_usuario (id_su) on delete cascade on update
cascade,
foreign key (id_pre) references preestablecidos (id_pre) on delete cascade on update cascade);

create table rt_rp(
id_rt int,
id_ropa int,
foreign key (id_rt) references robot (id_rt) on delete cascade on update
cascade,
foreign key (id_ropa) references ropa (id_ropa) on delete cascade on update cascade);

create table rt_clr(
id_rt int,
id_c int,
foreign key (id_rt) references robot (id_rt) on delete cascade on update
cascade,
foreign key (id_c) references color (id_c) on delete cascade on update cascade);

create table fav_img(
id_fav int,
id_imagen int,
foreign key (id_fav) references favoritos (id_fav) on delete cascade on update
cascade,
foreign key (id_imagen) references imagenes (id_imagen) on delete cascade on update cascade);

create table cto_img(
id_cuento int,
id_imagen int,
foreign key (id_cuento) references cuentos (id_cuento) on delete cascade on update
cascade,
foreign key (id_imagen) references imagenes (id_imagen) on delete cascade on update cascade);

create table sc_img(
id_su int,
id_imagen int,
foreign key (id_su) references sub_usuario (id_su) on delete cascade on update
cascade,
foreign key (id_imagen) references imagenes (id_imagen) on delete cascade on update cascade);

create table fav_lg(
id_fav int,
id_lg int,
foreign key (id_fav) references favoritos (id_fav) on delete cascade on update
cascade,
foreign key (id_lg) references idioma (id_lg) on delete cascade on update cascade);

create table cto_lg(
id_cuento int,
id_lg int,
foreign key (id_cuento) references cuentos (id_cuento) on delete cascade on update
cascade,
foreign key (id_lg) references idioma (id_lg) on delete cascade on update cascade);

create table pre_lg(
id_pre int,
id_lg int,
foreign key (id_pre) references preestablecidos (id_pre) on delete cascade on update
cascade,
foreign key (id_lg) references idioma (id_lg) on delete cascade on update cascade);

create table td_lg(
id_test int,
id_lg int,
foreign key (id_test) references test_data (id_test) on delete cascade on update
cascade, foreign key (id_lg) references idioma (id_lg) on delete cascade on update cascade);