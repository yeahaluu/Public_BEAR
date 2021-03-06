CREATE DATABASE `zootopia` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

CREATE TABLE `badge` (
  `badge_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `badge_explain` varchar(100) DEFAULT NULL,
  `badge_condition` varchar(100) DEFAULT NULL,
  `badge_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`badge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `beer` (
  `beer_id` int(10) NOT NULL,
  `beer_name` varchar(50) DEFAULT NULL,
  `beer_category` varchar(20) DEFAULT NULL,
  `country_name` varchar(20) DEFAULT NULL,
  `alcohol_proof` double DEFAULT NULL,
  `beer_image` varchar(200) DEFAULT NULL,
  `search_id` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`beer_id`),
  UNIQUE KEY `beer_name_UNIQUE` (`beer_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bookmark` (
  `user_id` bigint(20) NOT NULL,
  `beer_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`beer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `country` (
  `country_name` varchar(50) NOT NULL,
  `country_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `follow` (
  `user_id` bigint(20) NOT NULL,
  `follow_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`follow_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `hash_tag` (
  `hash_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `hash_tag_name` varchar(30) NOT NULL,
  PRIMARY KEY (`hash_tag_id`),
  UNIQUE KEY `hash_tag_name_UNIQUE` (`hash_tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `beer_id` int(11) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `unique_user_id_beer_id` (`user_id`,`beer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `review_hash_tag` (
  `review_id` int(11) NOT NULL,
  `hash_tag_id` int(11) NOT NULL,
  `beer_id` int(11) NOT NULL,
  PRIMARY KEY (`review_id`,`hash_tag_id`),
  CONSTRAINT `fk_review_hash_tag_review` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `review_like` (
  `user_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`review_id`),
  KEY `fk_review_like_review_idx` (`review_id`),
  CONSTRAINT `fk_review_like_review` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `snack_category` (
  `snack_category_name` varchar(20) NOT NULL,
  `beer_category` varchar(20) NOT NULL,
  PRIMARY KEY (`beer_category`,`snack_category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `snack_detail` (
  `snack_category_name` varchar(20) NOT NULL,
  `snack_detail_name` varchar(50) NOT NULL,
  `snack_image` varchar(100) DEFAULT 'N',
  PRIMARY KEY (`snack_category_name`,`snack_detail_name`),
  UNIQUE KEY `snack_detail_name_UNIQUE` (`snack_detail_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `custom_id` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `user_image` varchar(100) DEFAULT NULL,
  `share_count` int(11) DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `custom_id_UNIQUE` (`custom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_badge` (
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `acquisition_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into beer(beer_name, country_name, category,alcohol_proof) values("???????????? ?????? ?????????","?????????","????????????",4.5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????? ???????????? IPA","??????","??????",5.9);
insert into beer(beer_name, country_name, category,alcohol_proof) values("????????? ????????????","????????????","????????????",4.2);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????????????????? ????????????","??????","????????????",5.9);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????? ????????? ????????????","??????","??????",4.7);
insert into beer(beer_name, country_name, category,alcohol_proof) values("???????????????","??????","??????",5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????????","?????????","??????",5.4);
insert into beer(beer_name, country_name, category,alcohol_proof) values("??? ?????? ?????? ??????","??????","?????????",5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("????????? ????????????","??????","?????????",5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("???????????? ?????????","?????????/RTD","?????????",4.5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("????????? ???????????????","??????","??????",5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("???????????????","?????????","???????????????",5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????? ?????? ?????????","?????????/RTD","???????????????",2.2);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????? ????????? ?????????","?????????/RTD","???????????????",2.1);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????? ?????? ??????","??????","????????????",5.3);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????????","??????","??????",4.7);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????? ?????????","??????","????????????",4);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????? ?????????","??????","????????????",5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????????","??????","????????????",4.2);
insert into beer(beer_name, country_name, category,alcohol_proof) values("???????????? ????????? ?????????","??????","?????????",5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????? ??? ????????? ????????????","??????","??????",4.4);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????? ??????","????????????","??????",4.6);
insert into beer(beer_name, country_name, category,alcohol_proof) values("??????????????? 1664 ??????","?????????","?????????",5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("???????????? ???????????????","??????","????????????",5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????????","??????","????????????",5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("????????? ????????? ??????","?????????/RTD","????????????",2);
insert into beer(beer_name, country_name, category,alcohol_proof) values("????????? ????????? ??????","?????????/RTD","????????????",2);
insert into beer(beer_name, country_name, category,alcohol_proof) values("??????","??????","????????????",4.6);
insert into beer(beer_name, country_name, category,alcohol_proof) values("???????????? ?????? ??????","??????","??????",4.9);
insert into beer(beer_name, country_name, category,alcohol_proof) values("???????????? ??????????????? ??????","????????????","??????",5.3);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????? ???????????????","??????","????????????",4.5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("????????? ?????????","??????","??????",4.4);
insert into beer(beer_name, country_name, category,alcohol_proof) values("???????????? ??????","??????","????????????",5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("????????? ???????????? ??????","??????","????????????",4.5);
insert into beer(beer_name, country_name, category,alcohol_proof) values("??????","??????","????????????",4.6);
insert into beer(beer_name, country_name, category,alcohol_proof) values("?????????","?????????","?????????",4.9);
insert into beer(beer_name, country_name, category,alcohol_proof) values("????????? ??????","?????????/RTD","?????????",3);

insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????? ??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????? ??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????? ?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????? ?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '???????????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????? ??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '???????????? ?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '???????????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????? ?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????? ?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '????????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '????????? ??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '????????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '????????? ?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '????????? ??????????????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '????????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('????????????', '?????? ??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????/??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????? ?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????? ?????? ?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '???????????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '???????????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????? ??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????? ??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????? ?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '???????????? ????????? ??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????? ?????? ????????? ?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????? ??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????? ??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '???????????? ?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????? ?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????? ??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????? ??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '?????????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '??????');
insert into snack_detail(snack_category_name, snack_detail_name) values ('?????????', '????????????');


insert into snack_category(beer_category, snack_category_name) values('??????', '?????????');
insert into snack_category(beer_category, snack_category_name) values('??????', '?????????');
insert into snack_category(beer_category, snack_category_name) values('??????', '?????????');
insert into snack_category(beer_category, snack_category_name) values('?????????/RTD', '?????????');
insert into snack_category(beer_category, snack_category_name) values('?????????/RTD', '????????????');
insert into snack_category(beer_category, snack_category_name) values('?????????', '?????????');
insert into snack_category(beer_category, snack_category_name) values('?????????', '?????????');
insert into snack_category(beer_category, snack_category_name) values('?????????', '?????????');
insert into snack_category(beer_category, snack_category_name) values('????????????', '????????????');
insert into snack_category(beer_category, snack_category_name) values('????????????', '?????????');
insert into snack_category(beer_category, snack_category_name) values('??????', '?????????');
insert into snack_category(beer_category, snack_category_name) values('??????', '?????????');


update beer set beer_image = 'gooseisland_ipa' where beer_name='?????? ???????????? IPA';
update beer set beer_image = 'guinness_original' where beer_name='????????? ????????????';
update beer set beer_image = 'desperados_original' where beer_name='?????????????????? ????????????';
update beer set beer_image = 'miller_genuine_draft' where beer_name='?????? ????????? ????????????';
update beer set beer_image = 'budweiser' where beer_name='???????????????';
update beer set beer_image = 'bluemoon' where beer_name='?????????';
update beer set beer_image = 'sanmiguel_palepilsen	' where beer_name='??? ?????? ?????? ??????';
update beer set beer_image = 'gompyo_wheatbeer' where beer_name='?????? ?????????';
update beer set beer_image = 'stella_artois' where beer_name='????????? ????????????';
update beer set beer_image = 'somersby_cider' where beer_name='???????????? ?????????';
update beer set beer_image = 'asahi_superdry' where beer_name='????????? ???????????????';
update beer set beer_image = 'edelweiss' where beer_name='???????????????';
update beer set beer_image = 'egger_zitronen_radler' where beer_name='?????? ?????? ?????????';
update beer set beer_image = 'jeju_wit_ale' where beer_name='?????? ?????? ??????';
update beer set beer_image = 'tsingtao' where beer_name='?????????';
update beer set beer_image = 'cass_light' where beer_name='?????? ?????????';
update beer set beer_image = 'cass_fresh' where beer_name='?????? ?????????';
update beer set beer_image = 'cafri' where beer_name='?????????';
update beer set beer_image = 'carlsberg_danish_pilsner' where beer_name='???????????? ????????? ?????????';
update beer set beer_image = 'bigwave_golden_ale' where beer_name='?????? ??? ????????? ????????????';
update beer set beer_image = 'kozel_dark ' where beer_name='?????? ??????';
update beer set beer_image = 'kronenbourg_1664_blanc' where beer_name='??????????????? 1664 ??????';
update beer set beer_image = 'kloud_draft' where beer_name='???????????? ???????????????';
update beer set beer_image = 'tiger' where beer_name='?????????';
update beer set beer_image = 'tiger_radler_lemon' where beer_name='????????? ????????? ??????';
update beer set beer_image = 'tiger_radler_grapefruit' where beer_name='????????? ????????? ??????';
update beer set beer_image = 'terra' where beer_name='??????';
update beer set beer_image = 'paulaner_weissbier' where beer_name='???????????? ?????? ??????';
update beer set beer_image = 'paulaner_munchnerhell' where beer_name='???????????? ??????????????? ??????';
update beer set beer_image = 'fitz_superclear' where beer_name='?????? ???????????????';
update beer set beer_image = 'pilsner_urquell' where beer_name='????????? ?????????';
update beer set beer_image = 'heineken_lager' where beer_name='???????????? ??????';
update beer set beer_image = 'hite_extra_cold' where beer_name='????????? ???????????? ??????';
update beer set beer_image = 'hanmac' where beer_name='??????';
update beer set beer_image = 'hoegaarden' where beer_name='?????????';
update beer set beer_image = 'hoegaarden_rose' where beer_name='????????? ??????';
update beer set beer_image = 'egger_pfirsich_radler' where beer_name='?????? ????????? ?????????';

update snack_detail set snack_image= 'ppoca'where snack_detail_name='?????????';
update snack_detail set snack_image= 'noongamza'where snack_detail_name='?????? ??????';
update snack_detail set snack_image= 'dodohan'where snack_detail_name='????????? ??????';
update snack_detail set snack_image= 'maesae'where snack_detail_name='?????? ?????????';
update snack_detail set snack_image= 'squid_shortleg'where snack_detail_name='????????? ?????????';
update snack_detail set snack_image= 'string_cheese'where snack_detail_name='???????????????';
update snack_detail set snack_image= 'oging_ddangkong'where snack_detail_name='????????? ??????';
update snack_detail set snack_image= 'marrun_oging'where snack_detail_name='?????????';
update snack_detail set snack_image= 'cornchip'where snack_detail_name='??????';
update snack_detail set snack_image= 'pretzel'where snack_detail_name='?????????';
update snack_detail set snack_image= 'guipo'where snack_detail_name='??????';
update snack_detail set snack_image= 'postick'where snack_detail_name='?????????';
update snack_detail set snack_image= 'popcorn'where snack_detail_name='??????';
update snack_detail set snack_image= 'honey_butter_almond'where snack_detail_name='???????????? ?????????';
update snack_detail set snack_image= 'nut'where snack_detail_name='?????????';
update snack_detail set snack_image= 'ggubuk_corn_soup'where snack_detail_name='?????????';
update snack_detail set snack_image= 'nacho'where snack_detail_name='??????';
update snack_detail set snack_image= 'cracker'where snack_detail_name='?????????';
update snack_detail set snack_image= 'ziller_beef_jerky'where snack_detail_name='??????';
update snack_detail set snack_image= 'peanut'where snack_detail_name='??????';
update snack_detail set snack_image= 'tuna_cracker'where snack_detail_name='???????????????';
update snack_detail set snack_image= 'coffe_peanut'where snack_detail_name='????????????';
update snack_detail set snack_image= 'maekbansuk'where snack_detail_name='????????? ?????????';
update snack_detail set snack_image= 'chicken_gangjung'where snack_detail_name='?????????';
update snack_detail set snack_image= 'pizza'where snack_detail_name='??????';
update snack_detail set snack_image= 'jockbal'where snack_detail_name='??????';
update snack_detail set snack_image= 'hamburger'where snack_detail_name='?????????';
update snack_detail set snack_image= 'corn_cheese_gratin'where snack_detail_name='????????? ?????????';
update snack_detail set snack_image= 'tteokk_bokk'where snack_detail_name='?????????';
update snack_detail set snack_image= 'gangjeong'where snack_detail_name='????????????';
update snack_detail set snack_image= 'odeng'where snack_detail_name='????????? ??????';
update snack_detail set snack_image= 'udong_bokk'where snack_detail_name='????????????';
update snack_detail set snack_image= 'cub_ramen'where snack_detail_name='?????????';
update snack_detail set snack_image= 'chicken_feet'where snack_detail_name='??????';
update snack_detail set snack_image= 'chicken_kko'where snack_detail_name='?????????';
update snack_detail set snack_image= 'kielbasa'where snack_detail_name='????????? ?????????';
update snack_detail set snack_image= 'anzuya_duru'where snack_detail_name='????????? ??????????????????';
update snack_detail set snack_image= 'odol_bone'where snack_detail_name='?????????';
update snack_detail set snack_image= 'fire_mak'where snack_detail_name='?????????';
update snack_detail set snack_image= 'gob_bokk'where snack_detail_name='????????????';
update snack_detail set snack_image= 'bokk_soon'where snack_detail_name='?????? ??????';
update snack_detail set snack_image= 'apple'where snack_detail_name='??????';
update snack_detail set snack_image= 'pineapple'where snack_detail_name='????????????';
update snack_detail set snack_image= 'peach'where snack_detail_name='??????/??????';
update snack_detail set snack_image= 'fruit_cocktail'where snack_detail_name='????????? ?????????';
update snack_detail set snack_image= 'paldo'where snack_detail_name='?????????';
update snack_detail set snack_image= 'zzol_myeon'where snack_detail_name='??????';
update snack_detail set snack_image= 'cajun_salad'where snack_detail_name='????????? ?????? ?????????';
update snack_detail set snack_image= 'fruit_mix'where snack_detail_name='????????????';
update snack_detail set snack_image= 'homerun_ball'where snack_detail_name='?????????';
update snack_detail set snack_image= 'haribo_jelly'where snack_detail_name='???????????????';
update snack_detail set snack_image= 'honey_butter'where snack_detail_name='???????????????';
update snack_detail set snack_image= 'kkobuk_choco'where snack_detail_name='????????? ??????';
update snack_detail set snack_image= 'banana_kick'where snack_detail_name='????????????';
update snack_detail set snack_image= 'choco'where snack_detail_name='?????????';
update snack_detail set snack_image= 'corn_cho'where snack_detail_name='??????';
update snack_detail set snack_image= 'cara_popcorn'where snack_detail_name='????????? ??????';
update snack_detail set snack_image='sousage' where snack_detail_name='?????????';
update snack_detail set snack_image='garlic_hotbar' where snack_detail_name='?????? ?????? ????????? ?????????';
update snack_detail set snack_image='hotbar' where snack_detail_name='??????';
update snack_detail set snack_image='smoked_drumstick' where snack_detail_name='?????? ?????????';
update snack_detail set snack_image='smoked_salmon' where snack_detail_name='?????? ??????';
update snack_detail set snack_image='smoked_duck' where snack_detail_name='?????? ??????';
update snack_detail set snack_image='ccuiman' where snack_detail_name='?????????';
update snack_detail set snack_image='dubu_kimchi' where snack_detail_name='?????? ??????';
update snack_detail set snack_image='muktae' where snack_detail_name='??????';
update snack_detail set snack_image='bibigo' where snack_detail_name='????????? ??????';
update snack_detail set snack_image='soondae' where snack_detail_name='??????';
update snack_detail set snack_image='shrimpchip' where snack_detail_name='????????????';
update snack_detail set snack_image='jangsa' where snack_detail_name='???????????? ?????????';
update snack_detail set snack_image='kistick' where snack_detail_name='????????? ?????????';
update snack_detail set snack_image='jjolgit' where snack_detail_name='??????';
update snack_detail set snack_image='bulgogi_hatbar' where snack_detail_name='???????????? ????????? ??????';







