--postgresql CDM DDL Specification for OMOP Common Data Model 5.4

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE vocab.CONCEPT (
			concept_id integer NOT NULL,
			concept_name varchar(255) NOT NULL,
			domain_id varchar(20) NOT NULL,
			vocabulary_id varchar(20) NOT NULL,
			concept_class_id varchar(20) NOT NULL,
			standard_concept varchar(1) NULL,
			concept_code varchar(50) NOT NULL,
			valid_start_date date NOT NULL,
			valid_end_date date NOT NULL,
			invalid_reason varchar(1) NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE vocab.VOCABULARY (
			vocabulary_id varchar(20) NOT NULL,
			vocabulary_name varchar(255) NOT NULL,
			vocabulary_reference varchar(255) NULL,
			vocabulary_version varchar(255) NULL,
			vocabulary_concept_id integer NOT NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE vocab.DOMAIN (
			domain_id varchar(20) NOT NULL,
			domain_name varchar(255) NOT NULL,
			domain_concept_id integer NOT NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE vocab.CONCEPT_CLASS (
			concept_class_id varchar(20) NOT NULL,
			concept_class_name varchar(255) NOT NULL,
			concept_class_concept_id integer NOT NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE vocab.CONCEPT_RELATIONSHIP (
			concept_id_1 integer NOT NULL,
			concept_id_2 integer NOT NULL,
			relationship_id varchar(20) NOT NULL,
			valid_start_date date NOT NULL,
			valid_end_date date NOT NULL,
			invalid_reason varchar(1) NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE vocab.RELATIONSHIP (
			relationship_id varchar(20) NOT NULL,
			relationship_name varchar(255) NOT NULL,
			is_hierarchical varchar(1) NOT NULL,
			defines_ancestry varchar(1) NOT NULL,
			reverse_relationship_id varchar(20) NOT NULL,
			relationship_concept_id integer NOT NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE vocab.CONCEPT_SYNONYM (
			concept_id integer NOT NULL,
			concept_synonym_name varchar(1000) NOT NULL,
			language_concept_id integer NOT NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE vocab.CONCEPT_ANCESTOR (
			ancestor_concept_id integer NOT NULL,
			descendant_concept_id integer NOT NULL,
			min_levels_of_separation integer NOT NULL,
			max_levels_of_separation integer NOT NULL );

--HINT DISTRIBUTE ON RANDOM
CREATE TABLE vocab.DRUG_STRENGTH (
			drug_concept_id integer NOT NULL,
			ingredient_concept_id integer NOT NULL,
			amount_value NUMERIC NULL,
			amount_unit_concept_id integer NULL,
			numerator_value NUMERIC NULL,
			numerator_unit_concept_id integer NULL,
			denominator_value NUMERIC NULL,
			denominator_unit_concept_id integer NULL,
			box_size integer NULL,
			valid_start_date date NOT NULL,
			valid_end_date date NOT NULL,
			invalid_reason varchar(1) NULL );
