-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UV6uHy
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "league" (
    "league_id" SMALLSERIAL   ,
    "league_name" VARCHAR   ,
    CONSTRAINT "pk_league" PRIMARY KEY (
        "league_id"
     ),
    CONSTRAINT "uc_league_league_name" UNIQUE (
        "league_name"
    )
);

CREATE TABLE "team" (
    "team_id" SERIAL   ,
    "league_id" SMALLINT   ,
    "team_name" VARCHAR   ,
    CONSTRAINT "pk_team" PRIMARY KEY (
        "team_id"
     ),
    CONSTRAINT "uc_team_team_name" UNIQUE (
        "team_name"
    )
);

CREATE TABLE "game" (
    "game_id" BIGINT   ,
    "home_team_id" INT   ,
    "away_team_id" INT   ,
    "winning_team_id" INT   ,
    "timestamp" TIMESTAMP   ,
    CONSTRAINT "pk_game" PRIMARY KEY (
        "game_id"
     )
);

CREATE TABLE "skater" (
    "skater_id" BIGSERIAL  ,
    "skater_name" VARCHAR   ,
    "skater_number" SMALLINT,
    CONSTRAINT "pk_skater" PRIMARY KEY (
        "skater_id"
     ),
    CONSTRAINT "uc_skater_skater_name" UNIQUE (
        "skater_name"
    )
);

CREATE TABLE "jams" (
    "jam_id" BIGSERIAL   ,
    "game_id" BIGINT   ,
    "jam_number" SMALLINT   ,
    "period_number" SMALLINT,
    "home_jammer" SMALLINT  ,
    "home_pivot" SMALLINT   ,
    "home_blocker_1" SMALLINT   ,
    "home_blocker_2" SMALLINT  ,
    "home_blocker_3" SMALLINT   ,
    "home_team_points_scored" SMALLINT   ,
    "away_team_points_scored" SMALLINT   ,
    "away_jammer" SMALLINT   ,
    "away_pivot" SMALLINT   ,
    "away_blocker_1" SMALLINT   ,
    "away_blocker_2" SMALLINT   ,
    "away_blocker_3" SMALLINT   ,
    "away_lead" BOOLEAN   ,
    "home_lead" BOOLEAN   ,
    "lost_lead" BOOLEAN   ,
    "called_jam_off" BOOLEAN  ,
    "seconds_to_lead" SMALLINT  ,
    "seconds_to_first_pass" SMALLINT   ,
    CONSTRAINT "pk_jams" PRIMARY KEY (
        "jam_id"
     )
);

CREATE TABLE "penalties" (
    "penalty_id" BIGSERIAL   ,
    "skater_id" SMALLINT   ,
    "jam_id" BIGINT   ,
    "penalty_type" VARCHAR   ,
    "occurences" SMALLINT   ,
    CONSTRAINT "pk_penalties" PRIMARY KEY (
        "penalty_id"
     )
);

ALTER TABLE "team" ADD CONSTRAINT "fk_team_league_id" FOREIGN KEY("league_id")
REFERENCES "league" ("league_id");

ALTER TABLE "game" ADD CONSTRAINT "fk_game_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "team" ("team_id");

ALTER TABLE "game" ADD CONSTRAINT "fk_game_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "team" ("team_id");

ALTER TABLE "jams" ADD CONSTRAINT "fk_jams_game_id" FOREIGN KEY("game_id")
REFERENCES "game" ("game_id");

ALTER TABLE "jams" ADD CONSTRAINT "fk_jams_home_jammer" FOREIGN KEY("home_jammer")
REFERENCES "skater" ("skater_id");

ALTER TABLE "jams" ADD CONSTRAINT "fk_jams_home_pivot" FOREIGN KEY("home_pivot")
REFERENCES "skater" ("skater_id");

ALTER TABLE "jams" ADD CONSTRAINT "fk_jams_home_blocker_1" FOREIGN KEY("home_blocker_1")
REFERENCES "skater" ("skater_id");

ALTER TABLE "jams" ADD CONSTRAINT "fk_jams_home_blocker_2" FOREIGN KEY("home_blocker_2")
REFERENCES "skater" ("skater_id");

ALTER TABLE "jams" ADD CONSTRAINT "fk_jams_home_blocker_3" FOREIGN KEY("home_blocker_3")
REFERENCES "skater" ("skater_id");

ALTER TABLE "jams" ADD CONSTRAINT "fk_jams_away_jammer" FOREIGN KEY("away_jammer")
REFERENCES "skater" ("skater_id");

ALTER TABLE "jams" ADD CONSTRAINT "fk_jams_away_pivot" FOREIGN KEY("away_pivot")
REFERENCES "skater" ("skater_id");

ALTER TABLE "jams" ADD CONSTRAINT "fk_jams_away_blocker_1" FOREIGN KEY("away_blocker_1")
REFERENCES "skater" ("skater_id");

ALTER TABLE "jams" ADD CONSTRAINT "fk_jams_away_blocker_2" FOREIGN KEY("away_blocker_2")
REFERENCES "skater" ("skater_id");

ALTER TABLE "jams" ADD CONSTRAINT "fk_jams_away_blocker_3" FOREIGN KEY("away_blocker_3")
REFERENCES "skater" ("skater_id");

ALTER TABLE "penalties" ADD CONSTRAINT "fk_penalties_skater_id" FOREIGN KEY("skater_id")
REFERENCES "skater" ("skater_id");

ALTER TABLE "penalties" ADD CONSTRAINT "fk_penalties_jam_id" FOREIGN KEY("jam_id")
REFERENCES "jams" ("jam_id");

