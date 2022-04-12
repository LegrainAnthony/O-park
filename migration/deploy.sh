export PGUSER=oparc
export PGDATABASE=oparc
export PGPASSWORD=oparc


# sqitch add 1.DML -n "Structure de base de la BDD"

sqitch deploy db:pg:oparc
