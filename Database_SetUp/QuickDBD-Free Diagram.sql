-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UV6uHy
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "league" (
    "league_id" INT   NOT NULL,
    "league_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_league" PRIMARY KEY (
        "league_id"
     ),
    CONSTRAINT "uc_league_league_name" UNIQUE (
        "league_name"
    )
);

CREATE TABLE "team" (
    "team_id" INT   NOT NULL,
    "league_id" INT   NOT NULL,
    "team_name" VARCHAR   NOT NULL,
    "team_type" VARCHAR   NOT NULL,
    "team_strength_factor" DEC   NOT NULL,
    CONSTRAINT "pk_team" PRIMARY KEY (
        "team_id"
     ),
    CONSTRAINT "uc_team_team_name" UNIQUE (
        "team_name"
    )
);

CREATE TABLE "game" (
    "game_id" INT   NOT NULL,
    "home_team_id" INT   NOT NULL,
    "away_team_id" INT   NOT NULL,
    "wining_team_id" INT   NOT NULL,
    "date_played" DATE   NOT NULL,
    CONSTRAINT "pk_game" PRIMARY KEY (
        "game_id"
     )
);

CREATE TABLE "skater" (
    "skater_id" INT   NOT NULL,
    "skater_name" VARCHAR   NOT NULL,
    "skater_number" INT   NOT NULL,
    CONSTRAINT "pk_skater" PRIMARY KEY (
        "skater_id"
     ),
    CONSTRAINT "uc_skater_skater_name" UNIQUE (
        "skater_name"
    )
);

CREATE TABLE "jams" (
    "jam_id" INT   NOT NULL,
    "game_id" INT   NOT NULL,
    "jam_number" INT   NOT NULL,
    "home_jammer" INT   NOT NULL,
    "home_pivot" INT   NOT NULL,
    "home_blocker_1" INT   NOT NULL,
    "home_blocker_2" INT   NOT NULL,
    "home_blocker_3" INT   NOT NULL,
    "home_team_points_scored" INT   NOT NULL,
    "away_team_points_scored" INT   NOT NULL,
    "away_jammer" INT   NOT NULL,
    "away_pivot" INT   NOT NULL,
    "away_blocker_1" INT   NOT NULL,
    "away_blocker_2" INT   NOT NULL,
    "away_blocker_3" INT   NOT NULL,
    "away_lead" BOOLEAN   NOT NULL,
    "home_lead" BOOLEAN   NOT NULL,
    "lost_lead" BOOLEAN   NOT NULL,
    "called_jam_off" BOOLEAN   NOT NULL,
    "seconds_to_lead" INT   NOT NULL,
    "seconds_to_first_pass" INT   NOT NULL,
    CONSTRAINT "pk_jams" PRIMARY KEY (
        "jam_id"
     )
);

CREATE TABLE "penalties" (
    "penalty_id" INT   NOT NULL,
    "skater_id" INT   NOT NULL,
    "jam_id" INT   NOT NULL,
    "penalty_type" VARCHAR   NOT NULL,
    "occurences" INT   NOT NULL,
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

