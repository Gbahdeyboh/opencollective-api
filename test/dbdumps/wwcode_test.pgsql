toc.dat                                                                                             0000600 0004000 0002000 00000200734 13155532021 0014442 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                            u           wwcode_test    9.6.5    9.6.5 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         �           1262    18443558    wwcode_test    DATABASE     }   CREATE DATABASE wwcode_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE wwcode_test;
             opencollective    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    4                     3079    12655    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false         �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                     3079    18443559    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                  false    4         �           0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                       false    2         )           1247    18445457    enum_Groups_membership_type    TYPE     i   CREATE TYPE "enum_Groups_membership_type" AS ENUM (
    'donation',
    'monthlyfee',
    'yearlyfee'
);
 0   DROP TYPE public."enum_Groups_membership_type";
       public       xdamman    false    4         ,           1247    18445464    enum_UserGroups_role    TYPE     X   CREATE TYPE "enum_UserGroups_role" AS ENUM (
    'admin',
    'writer',
    'viewer'
);
 )   DROP TYPE public."enum_UserGroups_role";
       public       xdamman    false    4         �            1259    18445471 
   Activities    TABLE     �   CREATE TABLE "Activities" (
    id integer NOT NULL,
    type character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "CollectiveId" integer,
    "UserId" integer,
    "TransactionId" integer
);
     DROP TABLE public."Activities";
       public         opencollective    false    4         �            1259    18445477    Activities_id_seq    SEQUENCE     u   CREATE SEQUENCE "Activities_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Activities_id_seq";
       public       opencollective    false    4    201         �           0    0    Activities_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE "Activities_id_seq" OWNED BY "Activities".id;
            public       opencollective    false    202         �            1259    18445479    PaymentMethods    TABLE     �  CREATE TABLE "PaymentMethods" (
    id integer NOT NULL,
    name character varying(255),
    token character varying(255),
    "customerId" character varying(255),
    service character varying(255) DEFAULT 'stripe'::character varying,
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "confirmedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "expiryDate" timestamp with time zone,
    uuid uuid,
    "CollectiveId" integer,
    "archivedAt" timestamp with time zone,
    "monthlyLimitPerMember" integer,
    "primary" boolean DEFAULT false,
    currency character varying(3)
);
 $   DROP TABLE public."PaymentMethods";
       public         opencollective    false    4         �            1259    18445487    Cards_id_seq    SEQUENCE     p   CREATE SEQUENCE "Cards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Cards_id_seq";
       public       opencollective    false    203    4         �           0    0    Cards_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE "Cards_id_seq" OWNED BY "PaymentMethods".id;
            public       opencollective    false    204         �            1259    18445489    CollectiveHistories    TABLE       CREATE TABLE "CollectiveHistories" (
    id integer,
    name character varying(255),
    description character varying(255),
    currency character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(255),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean,
    "LastEditedByUserId" integer,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point)
);
 )   DROP TABLE public."CollectiveHistories";
       public         opencollective    false    4    2    2    4    2    4    2    4    2    4    4    2    4    2    4    2    4         �            1259    18445496    Collectives    TABLE     �  CREATE TABLE "Collectives" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean DEFAULT false,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(128),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean DEFAULT false,
    "LastEditedByUserId" integer,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point)
);
 !   DROP TABLE public."Collectives";
       public         opencollective    false    4    2    2    4    2    4    2    4    2    4    4    2    4    2    4    2    4         �            1259    18445506    ConnectedAccounts    TABLE     �  CREATE TABLE "ConnectedAccounts" (
    id integer NOT NULL,
    service character varying(255),
    username character varying(255),
    "clientId" character varying(255),
    token character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    "refreshToken" character varying(255)
);
 '   DROP TABLE public."ConnectedAccounts";
       public         opencollective    false    4         �            1259    18445512    ConnectedAccounts_id_seq    SEQUENCE     |   CREATE SEQUENCE "ConnectedAccounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ConnectedAccounts_id_seq";
       public       opencollective    false    207    4         �           0    0    ConnectedAccounts_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "ConnectedAccounts_id_seq" OWNED BY "ConnectedAccounts".id;
            public       opencollective    false    208         �            1259    18445514    Orders    TABLE     q  CREATE TABLE "Orders" (
    id integer NOT NULL,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "totalAmount" integer,
    description character varying(255),
    "SubscriptionId" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "PaymentMethodId" integer,
    "processedAt" timestamp with time zone,
    "privateMessage" text,
    "TierId" integer,
    "FromCollectiveId" integer,
    "publicMessage" character varying(255),
    quantity integer
);
    DROP TABLE public."Orders";
       public         opencollective    false    4         �            1259    18445521    Donations_id_seq    SEQUENCE     t   CREATE SEQUENCE "Donations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Donations_id_seq";
       public       opencollective    false    209    4         �           0    0    Donations_id_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE "Donations_id_seq" OWNED BY "Orders".id;
            public       opencollective    false    210         �            1259    18445523    ExpenseHistories    TABLE     �  CREATE TABLE "ExpenseHistories" (
    id integer,
    "UserId" integer,
    "CollectiveId" integer,
    currency character varying(255),
    amount integer,
    description character varying(255),
    "payoutMethod" character varying(255),
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer,
    status character varying(255),
    "incurredAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL
);
 &   DROP TABLE public."ExpenseHistories";
       public         opencollective    false    4         �            1259    18445529    ExpenseHistories_hid_seq    SEQUENCE     |   CREATE SEQUENCE "ExpenseHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ExpenseHistories_hid_seq";
       public       opencollective    false    211    4         �           0    0    ExpenseHistories_hid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "ExpenseHistories_hid_seq" OWNED BY "ExpenseHistories".hid;
            public       opencollective    false    212         �            1259    18445531    Expenses    TABLE     �  CREATE TABLE "Expenses" (
    id integer NOT NULL,
    "UserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    currency character varying(255) NOT NULL,
    amount integer NOT NULL,
    description character varying(255) NOT NULL,
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer NOT NULL,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL,
    "incurredAt" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    "payoutMethod" character varying(255) NOT NULL
);
    DROP TABLE public."Expenses";
       public         opencollective    false    4         �            1259    18445538    Expenses_id_seq    SEQUENCE     s   CREATE SEQUENCE "Expenses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Expenses_id_seq";
       public       opencollective    false    4    213         �           0    0    Expenses_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE "Expenses_id_seq" OWNED BY "Expenses".id;
            public       opencollective    false    214         �            1259    18445540    GroupHistories_hid_seq    SEQUENCE     z   CREATE SEQUENCE "GroupHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."GroupHistories_hid_seq";
       public       opencollective    false    205    4         �           0    0    GroupHistories_hid_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE "GroupHistories_hid_seq" OWNED BY "CollectiveHistories".hid;
            public       opencollective    false    215         �            1259    18445542    Groups_id_seq    SEQUENCE     q   CREATE SEQUENCE "Groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Groups_id_seq";
       public       opencollective    false    206    4         �           0    0    Groups_id_seq    SEQUENCE OWNED BY     :   ALTER SEQUENCE "Groups_id_seq" OWNED BY "Collectives".id;
            public       opencollective    false    216         �            1259    18445544    Members    TABLE     �  CREATE TABLE "Members" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    role character varying(255) DEFAULT 'MEMBER'::character varying NOT NULL,
    id integer NOT NULL,
    description character varying(255),
    "MemberCollectiveId" integer,
    "TierId" integer
);
    DROP TABLE public."Members";
       public         opencollective    false    4         �            1259    18445551    Notifications    TABLE     r  CREATE TABLE "Notifications" (
    id integer NOT NULL,
    channel character varying(255) DEFAULT 'email'::character varying,
    type character varying(255),
    active boolean DEFAULT true,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "UserId" integer,
    "CollectiveId" integer,
    "webhookUrl" character varying(255)
);
 #   DROP TABLE public."Notifications";
       public         opencollective    false    4         �            1259    18445559    Paykeys    TABLE     o  CREATE TABLE "Paykeys" (
    id integer NOT NULL,
    "trackingId" character varying(255),
    paykey character varying(255),
    status character varying(255),
    payload json,
    data json,
    error json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "TransactionId" integer
);
    DROP TABLE public."Paykeys";
       public         opencollective    false    4         �            1259    18445565    Paykeys_id_seq    SEQUENCE     r   CREATE SEQUENCE "Paykeys_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Paykeys_id_seq";
       public       opencollective    false    219    4         �           0    0    Paykeys_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE "Paykeys_id_seq" OWNED BY "Paykeys".id;
            public       opencollective    false    220         �            1259    18445567    SequelizeMeta    TABLE     K   CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         opencollective    false    4         �            1259    18445570    Sessions    TABLE     �   CREATE TABLE "Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Sessions";
       public         opencollective    false    4         �            1259    18445576    Subscriptions    TABLE       CREATE TABLE "Subscriptions" (
    id integer NOT NULL,
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "interval" character varying(8) DEFAULT NULL::character varying,
    "isActive" boolean DEFAULT false,
    data json,
    "stripeSubscriptionId" character varying(255),
    "activatedAt" timestamp with time zone,
    "deactivatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);
 #   DROP TABLE public."Subscriptions";
       public         opencollective    false    4         �            1259    18445585    Subscriptions_id_seq    SEQUENCE     x   CREATE SEQUENCE "Subscriptions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Subscriptions_id_seq";
       public       opencollective    false    218    4         �           0    0    Subscriptions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE "Subscriptions_id_seq" OWNED BY "Notifications".id;
            public       opencollective    false    224         �            1259    18445587    Subscriptions_id_seq1    SEQUENCE     y   CREATE SEQUENCE "Subscriptions_id_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Subscriptions_id_seq1";
       public       opencollective    false    4    223         �           0    0    Subscriptions_id_seq1    SEQUENCE OWNED BY     D   ALTER SEQUENCE "Subscriptions_id_seq1" OWNED BY "Subscriptions".id;
            public       opencollective    false    225         �            1259    18445589    Tiers    TABLE       CREATE TABLE "Tiers" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "maxQuantity" integer,
    password character varying(255),
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    slug character varying(255),
    "maxQuantityPerUser" integer,
    goal integer,
    type character varying(255) DEFAULT 'TICKET'::character varying,
    "CollectiveId" integer,
    "interval" character varying(8) DEFAULT NULL::character varying,
    button character varying(255),
    presets json
);
    DROP TABLE public."Tiers";
       public         opencollective    false    4         �            1259    18445598    Tiers_id_seq    SEQUENCE     p   CREATE SEQUENCE "Tiers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Tiers_id_seq";
       public       opencollective    false    4    226         �           0    0    Tiers_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE "Tiers_id_seq" OWNED BY "Tiers".id;
            public       opencollective    false    227         �            1259    18445600    Transactions    TABLE     k  CREATE TABLE "Transactions" (
    id integer NOT NULL,
    type character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    "CollectiveId" integer,
    "CreatedByUserId" integer,
    "PaymentMethodId" integer,
    "deletedAt" timestamp with time zone,
    data json,
    "OrderId" integer,
    "platformFeeInTxnCurrency" integer,
    "hostFeeInTxnCurrency" integer,
    "paymentProcessorFeeInTxnCurrency" integer,
    "txnCurrency" character varying(255),
    "txnCurrencyFxRate" double precision,
    "amountInTxnCurrency" integer,
    "netAmountInCollectiveCurrency" integer,
    "ExpenseId" integer,
    uuid uuid,
    "FromCollectiveId" integer,
    "HostCollectiveId" integer
);
 "   DROP TABLE public."Transactions";
       public         opencollective    false    4         �            1259    18445607    Transactions_id_seq    SEQUENCE     w   CREATE SEQUENCE "Transactions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Transactions_id_seq";
       public       opencollective    false    228    4         �           0    0    Transactions_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE "Transactions_id_seq" OWNED BY "Transactions".id;
            public       opencollective    false    229         �            1259    18445609    UserGroups_id_seq    SEQUENCE     u   CREATE SEQUENCE "UserGroups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."UserGroups_id_seq";
       public       opencollective    false    217    4         �           0    0    UserGroups_id_seq    SEQUENCE OWNED BY     :   ALTER SEQUENCE "UserGroups_id_seq" OWNED BY "Members".id;
            public       opencollective    false    230         �            1259    18445611    Users    TABLE     4  CREATE TABLE "Users" (
    id integer NOT NULL,
    email character varying(255),
    _salt character varying(255) DEFAULT '$2a$10$JqAcT6sBbBs5pO9FkwqLEu'::character varying,
    refresh_token character varying(255) DEFAULT '$2a$10$IHs8e8FdK1.bqjvZxr4Zvu'::character varying,
    password_hash character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "seenAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "paypalEmail" character varying(255),
    "resetPasswordTokenHash" character varying(255),
    "resetPasswordSentAt" timestamp with time zone,
    "firstName" character varying(128),
    "lastName" character varying(128),
    "billingAddress" character varying(255),
    "isHost" boolean DEFAULT false,
    "CollectiveId" integer
);
    DROP TABLE public."Users";
       public         opencollective    false    4         �            1259    18445620    Users_id_seq    SEQUENCE     p   CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public       opencollective    false    231    4         �           0    0    Users_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;
            public       opencollective    false    232         �           0    0    geography_columns    ACL     8   GRANT ALL ON TABLE geography_columns TO opencollective;
            public       xdamman    false    189         �           0    0    geometry_columns    ACL     7   GRANT ALL ON TABLE geometry_columns TO opencollective;
            public       xdamman    false    190         �           0    0    raster_columns    ACL     5   GRANT ALL ON TABLE raster_columns TO opencollective;
            public       xdamman    false    199         �           0    0    raster_overviews    ACL     7   GRANT ALL ON TABLE raster_overviews TO opencollective;
            public       xdamman    false    200         �           0    0    spatial_ref_sys    ACL     �   REVOKE SELECT ON TABLE spatial_ref_sys FROM PUBLIC;
REVOKE ALL ON TABLE spatial_ref_sys FROM xdamman;
GRANT SELECT ON TABLE spatial_ref_sys TO PUBLIC;
GRANT ALL ON TABLE spatial_ref_sys TO opencollective;
            public       opencollective    false    187         �           2604    18445622    Activities id    DEFAULT     d   ALTER TABLE ONLY "Activities" ALTER COLUMN id SET DEFAULT nextval('"Activities_id_seq"'::regclass);
 >   ALTER TABLE public."Activities" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    202    201         �           2604    18445623    CollectiveHistories hid    DEFAULT     s   ALTER TABLE ONLY "CollectiveHistories" ALTER COLUMN hid SET DEFAULT nextval('"GroupHistories_hid_seq"'::regclass);
 H   ALTER TABLE public."CollectiveHistories" ALTER COLUMN hid DROP DEFAULT;
       public       opencollective    false    215    205         �           2604    18445624    Collectives id    DEFAULT     a   ALTER TABLE ONLY "Collectives" ALTER COLUMN id SET DEFAULT nextval('"Groups_id_seq"'::regclass);
 ?   ALTER TABLE public."Collectives" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    216    206         �           2604    18445625    ConnectedAccounts id    DEFAULT     r   ALTER TABLE ONLY "ConnectedAccounts" ALTER COLUMN id SET DEFAULT nextval('"ConnectedAccounts_id_seq"'::regclass);
 E   ALTER TABLE public."ConnectedAccounts" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    208    207         �           2604    18445626    ExpenseHistories hid    DEFAULT     r   ALTER TABLE ONLY "ExpenseHistories" ALTER COLUMN hid SET DEFAULT nextval('"ExpenseHistories_hid_seq"'::regclass);
 E   ALTER TABLE public."ExpenseHistories" ALTER COLUMN hid DROP DEFAULT;
       public       opencollective    false    212    211         �           2604    18445627    Expenses id    DEFAULT     `   ALTER TABLE ONLY "Expenses" ALTER COLUMN id SET DEFAULT nextval('"Expenses_id_seq"'::regclass);
 <   ALTER TABLE public."Expenses" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    214    213         �           2604    18445628 
   Members id    DEFAULT     a   ALTER TABLE ONLY "Members" ALTER COLUMN id SET DEFAULT nextval('"UserGroups_id_seq"'::regclass);
 ;   ALTER TABLE public."Members" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    230    217         �           2604    18445629    Notifications id    DEFAULT     j   ALTER TABLE ONLY "Notifications" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq"'::regclass);
 A   ALTER TABLE public."Notifications" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    224    218         �           2604    18445630 	   Orders id    DEFAULT     _   ALTER TABLE ONLY "Orders" ALTER COLUMN id SET DEFAULT nextval('"Donations_id_seq"'::regclass);
 :   ALTER TABLE public."Orders" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    210    209         �           2604    18445631 
   Paykeys id    DEFAULT     ^   ALTER TABLE ONLY "Paykeys" ALTER COLUMN id SET DEFAULT nextval('"Paykeys_id_seq"'::regclass);
 ;   ALTER TABLE public."Paykeys" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    220    219         �           2604    18445632    PaymentMethods id    DEFAULT     c   ALTER TABLE ONLY "PaymentMethods" ALTER COLUMN id SET DEFAULT nextval('"Cards_id_seq"'::regclass);
 B   ALTER TABLE public."PaymentMethods" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    204    203         �           2604    18445633    Subscriptions id    DEFAULT     k   ALTER TABLE ONLY "Subscriptions" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq1"'::regclass);
 A   ALTER TABLE public."Subscriptions" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    225    223         �           2604    18445634    Tiers id    DEFAULT     Z   ALTER TABLE ONLY "Tiers" ALTER COLUMN id SET DEFAULT nextval('"Tiers_id_seq"'::regclass);
 9   ALTER TABLE public."Tiers" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    227    226         �           2604    18445635    Transactions id    DEFAULT     h   ALTER TABLE ONLY "Transactions" ALTER COLUMN id SET DEFAULT nextval('"Transactions_id_seq"'::regclass);
 @   ALTER TABLE public."Transactions" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    229    228         �           2604    18445636    Users id    DEFAULT     Z   ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    232    231         �          0    18445471 
   Activities 
   TABLE DATA               g   COPY "Activities" (id, type, data, "createdAt", "CollectiveId", "UserId", "TransactionId") FROM stdin;
    public       opencollective    false    201       4009.dat �           0    0    Activities_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"Activities_id_seq"', 27901, true);
            public       opencollective    false    202         �           0    0    Cards_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Cards_id_seq"', 3023, true);
            public       opencollective    false    204         �          0    18445489    CollectiveHistories 
   TABLE DATA               �  COPY "CollectiveHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", hid, "archivedAt", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM stdin;
    public       opencollective    false    205       4013.dat �          0    18445496    Collectives 
   TABLE DATA               �  COPY "Collectives" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM stdin;
    public       opencollective    false    206       4014.dat �          0    18445506    ConnectedAccounts 
   TABLE DATA               �   COPY "ConnectedAccounts" (id, service, username, "clientId", token, data, "createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", "refreshToken") FROM stdin;
    public       opencollective    false    207       4015.dat �           0    0    ConnectedAccounts_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"ConnectedAccounts_id_seq"', 1023, true);
            public       opencollective    false    208         �           0    0    Donations_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('"Donations_id_seq"', 2912, true);
            public       opencollective    false    210         �          0    18445523    ExpenseHistories 
   TABLE DATA                 COPY "ExpenseHistories" (id, "UserId", "CollectiveId", currency, amount, description, "payoutMethod", "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM stdin;
    public       opencollective    false    211       4019.dat �           0    0    ExpenseHistories_hid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"ExpenseHistories_hid_seq"', 1607, true);
            public       opencollective    false    212         �          0    18445531    Expenses 
   TABLE DATA               �   COPY "Expenses" (id, "UserId", "CollectiveId", currency, amount, description, "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM stdin;
    public       opencollective    false    213       4021.dat �           0    0    Expenses_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('"Expenses_id_seq"', 1159, true);
            public       opencollective    false    214         �           0    0    GroupHistories_hid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"GroupHistories_hid_seq"', 31393, true);
            public       opencollective    false    215         �           0    0    Groups_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Groups_id_seq"', 848, true);
            public       opencollective    false    216         �          0    18445544    Members 
   TABLE DATA               �   COPY "Members" ("createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", role, id, description, "MemberCollectiveId", "TierId") FROM stdin;
    public       opencollective    false    217       4025.dat �          0    18445551    Notifications 
   TABLE DATA                  COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "CollectiveId", "webhookUrl") FROM stdin;
    public       opencollective    false    218       4026.dat �          0    18445514    Orders 
   TABLE DATA                 COPY "Orders" (id, "CreatedByUserId", "CollectiveId", currency, "totalAmount", description, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "processedAt", "privateMessage", "TierId", "FromCollectiveId", "publicMessage", quantity) FROM stdin;
    public       opencollective    false    209       4017.dat �          0    18445559    Paykeys 
   TABLE DATA               �   COPY "Paykeys" (id, "trackingId", paykey, status, payload, data, error, "createdAt", "updatedAt", "deletedAt", "TransactionId") FROM stdin;
    public       opencollective    false    219       4027.dat �           0    0    Paykeys_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Paykeys_id_seq"', 1, false);
            public       opencollective    false    220         �          0    18445479    PaymentMethods 
   TABLE DATA               �   COPY "PaymentMethods" (id, name, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "CreatedByUserId", "expiryDate", uuid, "CollectiveId", "archivedAt", "monthlyLimitPerMember", "primary", currency) FROM stdin;
    public       opencollective    false    203       4011.dat �          0    18445567    SequelizeMeta 
   TABLE DATA               (   COPY "SequelizeMeta" (name) FROM stdin;
    public       opencollective    false    221       4029.dat �          0    18445570    Sessions 
   TABLE DATA               K   COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
    public       opencollective    false    222       4030.dat �          0    18445576    Subscriptions 
   TABLE DATA               �   COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public       opencollective    false    223       4031.dat �           0    0    Subscriptions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('"Subscriptions_id_seq"', 17102, true);
            public       opencollective    false    224         �           0    0    Subscriptions_id_seq1    SEQUENCE SET     A   SELECT pg_catalog.setval('"Subscriptions_id_seq1"', 2214, true);
            public       opencollective    false    225         �          0    18445589    Tiers 
   TABLE DATA               �   COPY "Tiers" (id, name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug, "maxQuantityPerUser", goal, type, "CollectiveId", "interval", button, presets) FROM stdin;
    public       opencollective    false    226       4034.dat �           0    0    Tiers_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('"Tiers_id_seq"', 200, true);
            public       opencollective    false    227         �          0    18445600    Transactions 
   TABLE DATA               �  COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "CollectiveId", "CreatedByUserId", "PaymentMethodId", "deletedAt", data, "OrderId", "platformFeeInTxnCurrency", "hostFeeInTxnCurrency", "paymentProcessorFeeInTxnCurrency", "txnCurrency", "txnCurrencyFxRate", "amountInTxnCurrency", "netAmountInCollectiveCurrency", "ExpenseId", uuid, "FromCollectiveId", "HostCollectiveId") FROM stdin;
    public       opencollective    false    228       4036.dat �           0    0    Transactions_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('"Transactions_id_seq"', 11071, true);
            public       opencollective    false    229         �           0    0    UserGroups_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('"UserGroups_id_seq"', 4719, true);
            public       opencollective    false    230         �          0    18445611    Users 
   TABLE DATA                  COPY "Users" (id, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "paypalEmail", "resetPasswordTokenHash", "resetPasswordSentAt", "firstName", "lastName", "billingAddress", "isHost", "CollectiveId") FROM stdin;
    public       opencollective    false    231       4039.dat �           0    0    Users_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Users_id_seq"', 4973, true);
            public       opencollective    false    232         �          0    18443856    spatial_ref_sys 
   TABLE DATA               Q   COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public       opencollective    false    187       3759.dat �           2606    18445638    Activities Activities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_pkey";
       public         opencollective    false    201    201         �           2606    18445640    PaymentMethods Cards_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id);
 G   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_pkey";
       public         opencollective    false    203    203         �           2606    18445642 (   ConnectedAccounts ConnectedAccounts_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_pkey";
       public         opencollective    false    207    207         �           2606    18445644    Orders Donations_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_pkey" PRIMARY KEY (id);
 C   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_pkey";
       public         opencollective    false    209    209         �           2606    18445646 &   ExpenseHistories ExpenseHistories_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "ExpenseHistories"
    ADD CONSTRAINT "ExpenseHistories_pkey" PRIMARY KEY (hid);
 T   ALTER TABLE ONLY public."ExpenseHistories" DROP CONSTRAINT "ExpenseHistories_pkey";
       public         opencollective    false    211    211         �           2606    18445648    Expenses Expenses_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_pkey";
       public         opencollective    false    213    213         �           2606    18445650 '   CollectiveHistories GroupHistories_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "GroupHistories_pkey" PRIMARY KEY (hid);
 U   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "GroupHistories_pkey";
       public         opencollective    false    205    205         �           2606    18445652    Collectives Groups_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_pkey";
       public         opencollective    false    206    206         �           2606    18445654    Paykeys Paykeys_paykey_key 
   CONSTRAINT     T   ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_paykey_key" UNIQUE (paykey);
 H   ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_paykey_key";
       public         opencollective    false    219    219         �           2606    18445656    Paykeys Paykeys_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_pkey";
       public         opencollective    false    219    219         �           2606    18445658     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public         opencollective    false    221    221         �           2606    18445660    Sessions Sessions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);
 D   ALTER TABLE ONLY public."Sessions" DROP CONSTRAINT "Sessions_pkey";
       public         opencollective    false    222    222         �           2606    18445662     Notifications Subscriptions_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_pkey";
       public         opencollective    false    218    218         �           2606    18445664 !   Subscriptions Subscriptions_pkey1 
   CONSTRAINT     \   ALTER TABLE ONLY "Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey1" PRIMARY KEY (id);
 O   ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_pkey1";
       public         opencollective    false    223    223         �           2606    18445666    Tiers Tiers_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_pkey";
       public         opencollective    false    226    226         �           2606    18445668    Transactions Transactions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_pkey";
       public         opencollective    false    228    228         �           2606    18445670    Members UserGroups_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_pkey";
       public         opencollective    false    217    217                    2606    18445672    Users Users_email_key 
   CONSTRAINT     N   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);
 C   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
       public         opencollective    false    231    231                    2606    18445674    Users Users_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public         opencollective    false    231    231                    2606    18445676    Users email_unique_idx 
   CONSTRAINT     M   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT email_unique_idx UNIQUE (email);
 B   ALTER TABLE ONLY public."Users" DROP CONSTRAINT email_unique_idx;
       public         opencollective    false    231    231         �           1259    18445677    CollectiveId-deletedAt    INDEX     \   CREATE INDEX "CollectiveId-deletedAt" ON "Tiers" USING btree ("CollectiveId", "deletedAt");
 ,   DROP INDEX public."CollectiveId-deletedAt";
       public         opencollective    false    226    226         �           1259    18445678 
   DonationId    INDEX     E   CREATE INDEX "DonationId" ON "Transactions" USING btree ("OrderId");
     DROP INDEX public."DonationId";
       public         opencollective    false    228         �           1259    18445679 $   MemberCollectiveId-CollectiveId-role    INDEX     {   CREATE INDEX "MemberCollectiveId-CollectiveId-role" ON "Members" USING btree ("MemberCollectiveId", "CollectiveId", role);
 :   DROP INDEX public."MemberCollectiveId-CollectiveId-role";
       public         opencollective    false    217    217    217         �           1259    18445680 $   ToCollectiveId-FromCollectiveId-type    INDEX     �   CREATE INDEX "ToCollectiveId-FromCollectiveId-type" ON "Transactions" USING btree ("CollectiveId", "FromCollectiveId", "deletedAt");
 :   DROP INDEX public."ToCollectiveId-FromCollectiveId-type";
       public         opencollective    false    228    228    228         �           1259    18445681    Transactions_GroupId    INDEX     a   CREATE INDEX "Transactions_GroupId" ON "Transactions" USING btree ("CollectiveId", "deletedAt");
 *   DROP INDEX public."Transactions_GroupId";
       public         opencollective    false    228    228         �           1259    18445682    UniqueSlugIndex    INDEX     K   CREATE UNIQUE INDEX "UniqueSlugIndex" ON "Collectives" USING btree (slug);
 %   DROP INDEX public."UniqueSlugIndex";
       public         opencollective    false    206         �           1259    18445683 %   subscriptions_type__group_id__user_id    INDEX     {   CREATE UNIQUE INDEX subscriptions_type__group_id__user_id ON "Notifications" USING btree (type, "CollectiveId", "UserId");
 9   DROP INDEX public.subscriptions_type__group_id__user_id;
       public         opencollective    false    218    218    218         �           1259    18445684    transactions_uuid    INDEX     L   CREATE UNIQUE INDEX transactions_uuid ON "Transactions" USING btree (uuid);
 %   DROP INDEX public.transactions_uuid;
       public         opencollective    false    228                    2606    18445685 "   Activities Activities_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_GroupId_fkey";
       public       opencollective    false    206    201    3805                    2606    18445690 (   Activities Activities_TransactionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_TransactionId_fkey";
       public       opencollective    false    228    201    3838                    2606    18445695 !   Activities Activities_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 O   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_UserId_fkey";
       public       opencollective    false    3843    231    201         	           2606    18445700     PaymentMethods Cards_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_UserId_fkey";
       public       opencollective    false    231    203    3843                    2606    18445705 <   CollectiveHistories CollectiveHistories_CreatedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 j   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey";
       public       opencollective    false    231    205    3843                    2606    18445710 =   CollectiveHistories CollectiveHistories_HostCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 k   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey";
       public       opencollective    false    3805    206    205                    2606    18445715 ?   CollectiveHistories CollectiveHistories_ParentCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 m   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey";
       public       opencollective    false    206    205    3805                    2606    18445720 ,   Collectives Collectives_CreatedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_CreatedByUserId_fkey";
       public       opencollective    false    3843    206    231                    2606    18445725 -   Collectives Collectives_HostCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 [   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_HostCollectiveId_fkey";
       public       opencollective    false    206    3805    206                    2606    18445730 /   Collectives Collectives_ParentCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_ParentCollectiveId_fkey";
       public       opencollective    false    206    206    3805                    2606    18445735 0   ConnectedAccounts ConnectedAccounts_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_GroupId_fkey";
       public       opencollective    false    206    207    3805                    2606    18445740 /   ConnectedAccounts ConnectedAccounts_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_UserId_fkey";
       public       opencollective    false    231    3843    207                    2606    18445745    Orders Donations_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_GroupId_fkey";
       public       opencollective    false    206    209    3805                    2606    18445750 %   Orders Donations_PaymentMethodId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_PaymentMethodId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_PaymentMethodId_fkey";
       public       opencollective    false    209    203    3801                    2606    18445755 $   Orders Donations_SubscriptionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_SubscriptionId_fkey" FOREIGN KEY ("SubscriptionId") REFERENCES "Subscriptions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 R   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_SubscriptionId_fkey";
       public       opencollective    false    223    209    3830                    2606    18445760    Orders Donations_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 J   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_UserId_fkey";
       public       opencollective    false    209    3843    231                    2606    18445765    Expenses Expenses_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_GroupId_fkey";
       public       opencollective    false    3805    213    206                    2606    18445770    Expenses Expenses_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_UserId_fkey";
       public       opencollective    false    213    3843    231                    2606    18445775 %   Expenses Expenses_lastEditedById_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_lastEditedById_fkey" FOREIGN KEY ("lastEditedById") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_lastEditedById_fkey";
       public       opencollective    false    3843    231    213                    2606    18445780 *   Collectives Groups_lastEditedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_lastEditedByUserId_fkey" FOREIGN KEY ("LastEditedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 X   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_lastEditedByUserId_fkey";
       public       opencollective    false    206    231    3843                    2606    18445785 '   Members Members_MemberCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_MemberCollectiveId_fkey" FOREIGN KEY ("MemberCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_MemberCollectiveId_fkey";
       public       opencollective    false    217    3805    206                    2606    18445790    Members Members_TierId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_TierId_fkey";
       public       opencollective    false    217    3833    226                    2606    18445795 #   Orders Orders_FromCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_FromCollectiveId_fkey";
       public       opencollective    false    3805    206    209                    2606    18445800    Orders Orders_TierId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_TierId_fkey";
       public       opencollective    false    226    3833    209         #           2606    18445805 "   Paykeys Paykeys_TransactionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_TransactionId_fkey";
       public       opencollective    false    228    3838    219         
           2606    18445810 /   PaymentMethods PaymentMethods_CollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "PaymentMethods_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "PaymentMethods_CollectiveId_fkey";
       public       opencollective    false    203    206    3805         !           2606    18445815 (   Notifications Subscriptions_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_GroupId_fkey";
       public       opencollective    false    218    206    3805         "           2606    18445820 '   Notifications Subscriptions_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_UserId_fkey";
       public       opencollective    false    231    3843    218         $           2606    18445825    Tiers Tiers_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_GroupId_fkey";
       public       opencollective    false    3805    206    226         %           2606    18445830 %   Transactions Transactions_CardId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_CardId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_CardId_fkey";
       public       opencollective    false    228    3801    203         &           2606    18445835 )   Transactions Transactions_DonationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_DonationId_fkey" FOREIGN KEY ("OrderId") REFERENCES "Orders"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_DonationId_fkey";
       public       opencollective    false    228    3810    209         '           2606    18445840 (   Transactions Transactions_ExpenseId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_ExpenseId_fkey" FOREIGN KEY ("ExpenseId") REFERENCES "Expenses"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_ExpenseId_fkey";
       public       opencollective    false    3814    213    228         (           2606    18445845 /   Transactions Transactions_FromCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_FromCollectiveId_fkey";
       public       opencollective    false    206    3805    228         )           2606    18445850 &   Transactions Transactions_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 T   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_GroupId_fkey";
       public       opencollective    false    3805    228    206         *           2606    18445855 /   Transactions Transactions_HostCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_HostCollectiveId_fkey";
       public       opencollective    false    3805    228    206         +           2606    18445860 %   Transactions Transactions_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_UserId_fkey";
       public       opencollective    false    3843    231    228                    2606    18445865    Members UserGroups_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id);
 M   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_GroupId_fkey";
       public       opencollective    false    217    3805    206                     2606    18445870    Members UserGroups_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_UserId_fkey";
       public       opencollective    false    3843    217    231         ,           2606    18445875    Users Users_CollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_CollectiveId_fkey";
       public       opencollective    false    3805    231    206                                            4009.dat                                                                                            0000600 0004000 0002000 00000000005 13155532021 0014236 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4013.dat                                                                                            0000600 0004000 0002000 00000000005 13155532021 0014231 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4014.dat                                                                                            0000600 0004000 0002000 00000464732 13155532021 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        510	Women Who Code Richmond	\N	USD	2017-02-21 08:25:28.328-08	2017-02-21 08:25:28.5-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!	\N	wwcoderichmond	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
522	Women Who Code Vancouver	\N	CAD	2017-02-21 11:45:19.101-08	2017-02-21 11:48:46.905-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/vancouver) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodevancouver#support) to support WWCode Vancouver \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodevancouver	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
280	WWCode Medellín 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:13:48.754-07	2016-12-27 09:47:24.671-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Medellin**](https://www.womenwhocode.com/medellin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Medellin \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/85a55000-cc5c-11e6-be07-3dfc36c6d12c.png	wwcodemedellin	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
286	WWCode Recife	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:19:11.423-07	2016-12-27 10:40:34.452-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Recife**](https://www.womenwhocode.com/recife). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderecife#support) to support WWCode Recife \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/cc234080-9d47-11e6-9116-db595ff259df.png	wwcoderecife	\N	WWCode_Recife	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
14	WWCode Seattle	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-27 11:51:31.023-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Seattle**](https://www.womenwhocode.com/seattle). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcode-seattle#support) to support WWCode Seattle \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/48297200-90a8-11e6-a134-f381d4cd2713.png	wwcodeseattle	https://www.womenwhocode.com/seattle	wwcode-seattle	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
714	Anouk Ruhaak	\N	USD	2016-09-29 11:43:49.04-07	\N	\N	t	\N	\N	anoukruhaak	\N	\N	\N	\N	\N	\N	{"UserId":1375}	{user}	f	\N	1375	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
715	Himi Sato	\N	USD	2016-09-29 11:33:37.087-07	\N	\N	t	\N	\N	himisato	\N	\N	\N	\N	\N	\N	{"UserId":1359}	{user}	f	\N	1359	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
716	Caterina Paun	Director, WWCode Portland	USD	2016-03-19 15:11:53.101-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7446276v3s466_4d6a9940-90b9-11e6-a134-f381d4cd2713.png	cpaun	\N	\N	\N	\N	\N	\N	{"UserId":171}	{user}	f	\N	171	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
516	Women Who Code Huntsville	\N	USD	2017-02-21 11:02:21.542-08	2017-02-21 11:05:00.852-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform)\n\n[**Attend**](https://www.womenwhocode.com/philadelphia) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephiladelphia#support) to support WWCode Philadelphia\n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodehuntsville	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
512	Women Who Code Cincinnati	\N	USD	2017-02-21 10:11:30.741-08	2017-02-21 10:14:42.695-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Attend**](https://www.womenwhocode.com/cincinnati) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScMYZSUklxgo7irAfTbcOrz06jjuibholjPNS-rBoSvWLHGow/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScMYZSUklxgo7irAfTbcOrz06jjuibholjPNS-rBoSvWLHGow/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecincinnati#support) to support WWCode Cincinnati \n\nQuestions? Email us at global@womenwhocode.com.\n\n\n	\N	wwcodecincinnati	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
513	Women Who Code Fort Collins	\N	USD	2017-02-21 10:35:34.492-08	2017-02-21 10:37:34.054-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/fortcollins) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodefortcollins#support) to support WWCode Fort Collins \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodefortcollins	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
517	Women Who Code Manila	\N	USD	2017-02-21 11:07:25.163-08	2017-02-21 11:09:27.391-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reWWCode is a non-profit organization that inspires women to excel in technology careers.\nach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a member\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/manila) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemanila#support) to support WWCode Manila \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodemanila	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
430	WWCode Kyiv	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2017-01-03 16:00:00-08	2017-01-04 11:36:29.052-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kyiv**](https://www.womenwhocode.com/kyiv). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodekyiv#support) to support WWCode Kyiv \n\nQuestions? Email us at global@womenwhocode.com.  \n	\N	wwcodekyiv	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
717	Dayra 	\N	USD	2016-01-11 11:01:43.411-08	\N	\N	t	\N	https://media.licdn.com/media/p/6/005/04f/283/2b9ae46.jpg	dchiu	\N	\N	\N	\N	\N	\N	{"UserId":36}	{user}	f	\N	36	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
718	Viv Del Rio	\N	USD	2016-09-29 11:38:54.951-07	\N	\N	t	\N	\N	vivdelrio	\N	\N	\N	\N	\N	\N	{"UserId":1370}	{user}	f	\N	1370	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
51	Women Who Code	WWCode is a global non-profit organization dedicated 	USD	2015-10-31 17:00:00-07	2017-05-22 12:33:15.968-07	\N	t	Women Who Code (WWCode) is a global 501(c)(3) non-profit dedicated to inspiring women to excel in technology careers. We connect amazing women with other like-minded women around the globe who unite under one simple notion – the world of technology is better with women in it. \n\nWe work hard every day to inspire engineers to advance their careers. We strongly believe in the value of diversity, and envision a world where women are representative as technical executives, founders, venture capitalists, board members, and software engineers. \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events**](https://www.womenwhocode.com/events). \n\n[**Get Involved:**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Support**](https://opencollective.com/wwcode#support) WWCode financially by making a donation below\n\nYour donations are critical in supporting this catalytic movement. Donations received here directly support our programs. A small amount also supports global development so that we can bring innovative program to cities around the world, ensuring that more women everywhere have the opportunity to excel in technology careers.\n\nQuestions? Email us at contact@womenwhocode.com. 	https://opencollective-production.s3-us-west-1.amazonaws.com/50bd4ad0-769b-11e6-90e1-0dd449fe12b2.png	wwcode	http://womenwhocode.com	wwcode	We are on a mission to inspire women to excel in tech careers.	\N	10	{"HostId": 3, "lang":"wwcode","superCollectiveTag":"wwcode","githubOrg":"wwcode","style":{"hero": {"cover":{"background":"black"}}}}	{"githubContributors":{},"repos":{}}	{wwcode,meetup,"diversity in tech"}	t	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
48	WWCode Twin Cities	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-03-06 16:00:00-08	2016-12-28 08:23:57.622-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in the Twin Cities**](https://www.womenwhocode.com/twin-cities). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetwincities#support) to support WWCode Twin Cities \n\nQuestions? Email us at global@womenwhocode.com.  \n\n[**Sponsors**](https://drive.google.com/file/d/0ByjnHHy83oCsS3hjMjRNZktkYmM/view?usp=sharing)\n      	https://opencollective-production.s3-us-west-1.amazonaws.com/079974c0-cd1a-11e6-a033-c553d2fe46df.png	wwcodetwincities	https://www.womenwhocode.com/twin-cities	wwcodetc	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
298	WWCode Dublin	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 11:37:07.255-07	2016-12-27 08:33:19.532-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Dublin**](https://www.womenwhocode.com/wwcode-dublin). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedublin#support) to support WWCode Dublin \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/70bbbe00-9ba5-11e6-84fe-5d5e57220970.png	wwcodedublin	\N	wwcodedublin	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
59	WWCode Portland	We are women who code: in any framework with any level of experience from any size of company for any reason (even just for fun)!	USD	2016-03-18 17:00:00-07	2017-05-22 12:33:20.319-07	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Portland**](https://www.womenwhocode.com/portland). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeportland#support) to support WWCode Portland \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/WoL-XXTWSH.png	wwcodeportland	https://www.womenwhocode.com/portland	WWCodePortland	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode","githubOrg":"wwcodeportland"}	{"githubContributors":{"caterinasworld":380,"rk101288":5,"jminnier":1,"sajoy":12,"cynful":12,"aliaward":8,"Tradcliffe":5,"thejensen":1,"morganpdx":8,"Ksan8":2},"repos":{"networking-nights":{"stars":1},"wwc-speaker-series":{"stars":1},"iot-hackathon-2016":{"stars":0},"study-nights":{"stars":32},"wwcodeportland.github.io":{"stars":7},"about-us":{"stars":1},"workshops":{"stars":0}}}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
719	Dev Bootcamp 	\N	USD	2016-04-28 08:01:14.69-07	\N	\N	t	\N	https://logo.clearbit.com/devbootcamp.com	devbootcamp	http://www.devbootcamp.com	devbootcamp 	\N	\N	\N	\N	{"UserId":283}	{user}	f	\N	283	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
720	Kelly 	\N	USD	2016-01-11 10:58:47.796-08	\N	\N	t	\N	https://pbs.twimg.com/profile_images/523157919999602688/00l1ZQIf.jpeg	kshuster	\N	\N	\N	\N	\N	\N	{"UserId":34}	{user}	f	\N	34	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
721	Fernanda 	\N	USD	2016-01-11 11:02:41.058-08	\N	\N	t	\N	https://media.licdn.com/media/AAEAAQAAAAAAAAJzAAAAJGZiYzM3MzEyLTVkYzgtNDg2Mi04Yzg3LWI1NDM0NDhhZjRhNQ.jpg	fsantander	\N	\N	\N	\N	\N	\N	{"UserId":37}	{user}	f	\N	37	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
722	Marcela Lango	\N	USD	2015-11-19 02:09:51.192-08	\N	\N	t	\N	https://pbs.twimg.com/profile_images/445400536569749504/8vJ-Prbe.png	maru	\N	\N	\N	\N	\N	\N	{"UserId":7}	{user}	f	\N	7	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
293	WWCode Waterloo	WWCode is a global non-profit organization that inspires women to excel in technology careers.	CAD	2016-09-29 11:30:54.225-07	2016-12-28 08:29:14.91-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Waterloo**](https://www.womenwhocode.com/waterloo). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodewaterloo#support) to support WWCode Waterloo\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/485e6710-a6d5-11e6-bdef-45bfa9f9c1b0.png	wwcodewaterloo	\N	womenwhocodekw	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
294	WWCode Wichita	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:32:00.962-07	2016-12-28 08:31:16.784-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Wichita**](https://www.womenwhocode.com/wichita). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodewichita#support) to support WWCode Wichita \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/6cae1920-a6d6-11e6-bdef-45bfa9f9c1b0.png	wwcodewichita	\N	wwcodewichita	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
276	WWCode Kingston	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:09:42.765-07	2016-12-27 08:58:14.247-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kingston**](https://www.womenwhocode.com/kingston). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Kingston \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/a7236520-cc55-11e6-be07-3dfc36c6d12c.png	wwcodekingston	\N	wwcodekingston	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
277	WWCode Kuala Lumpur	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:10:43.356-07	2016-12-27 09:02:13.485-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kuala Lumpur**](https://www.womenwhocode.com/kl). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodekualalumpur#support) to support WWCode Kuala Lumpur\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/35b70760-cc56-11e6-be07-3dfc36c6d12c.png	wwcodekualalumpur	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
727	Brenda 	\N	USD	2016-01-29 15:19:12.899-08	\N	\N	t	\N	\N	brenda	\N	\N	\N	\N	\N	\N	{"UserId":71}	{user}	f	\N	71	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
732	Laura Uzcátegui	\N	USD	2016-09-29 11:37:07.337-07	\N	\N	t	\N	\N	laurauzcátegui	\N	\N	\N	\N	\N	\N	{"UserId":1365}	{user}	f	\N	1365	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
737	Erica 	\N	USD	2016-01-11 10:59:41.948-08	\N	\N	t	\N	https://pbs.twimg.com/profile_images/672467424273395712/m0VtgmYQ.jpg	estanley	\N	\N	\N	\N	\N	\N	{"UserId":35}	{user}	f	\N	35	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
742	null null	\N	USD	2017-02-01 07:16:17.461-08	\N	\N	t	\N	\N	ericalucaterochapman	\N	\N	\N	\N	\N	\N	{"UserId":2898}	{user}	f	\N	2898	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
747	Guiti Nabavi	\N	USD	2016-09-29 11:41:11.052-07	\N	\N	t	\N	\N	guitinabavi	\N	\N	\N	\N	\N	\N	{"UserId":1371}	{user}	f	\N	1371	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
749	Radhika Rayadu	\N	USD	2016-09-29 11:41:11.058-07	\N	\N	t	\N	\N	radhikarayadu	\N	\N	\N	\N	\N	\N	{"UserId":1372}	{user}	f	\N	1372	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
755	Google Fiber	\N	USD	2016-09-12 21:15:01.959-07	\N	\N	t	\N	\N	googlefiber	http://fiber.google.com	googlefiber	\N	\N	\N	\N	{"UserId":1178}	{user}	f	\N	1178	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
761	Silvia Pina	\N	USD	2016-09-29 11:43:49.189-07	\N	\N	t	\N	\N	silviapina	\N	\N	\N	\N	\N	\N	{"UserId":1377}	{user}	f	\N	1377	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
301	WWCode Berlin	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 11:43:48.834-07	2016-12-23 09:11:29.559-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Berlin**](https://www.womenwhocode.com/berlin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeberlin#support) to support WWCode Berlin \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/81940c10-8fd8-11e6-b320-5125b901f984.png	wwcodeberlin	\N	wwcodeberlin	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
241	WWCode Taipei	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-07 15:13:23.305-07	2016-12-28 07:57:33.798-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Taipei**](https://www.womenwhocode.com/taipei). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetaipei#support) to support WWCode Taipei \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/lGiwq5JAPy.png	wwcodetaipei	\N	wwcodetaipei	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
266	WWCode Brisbane	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 10:59:15.405-07	2016-12-23 09:39:30.07-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Brisbane**](https://www.womenwhocode.com/brisbane). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebrisbane#support) to support WWCode Brisbane\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/abcc78e0-c936-11e6-9af0-47fca5e686db.png	wwcodebrisbane	\N	wwcodebrisbane	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
279	WWCode Los Angeles	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:12:58.808-07	2016-12-27 09:24:20.031-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Los Angeles**](https://www.womenwhocode.com/la). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodelosangeles#support) WWCode Los Angeles \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f55b4680-9097-11e6-a134-f381d4cd2713.png	wwcodelosangeles	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
766	Racha Bella	\N	USD	2016-09-29 10:49:43.061-07	\N	\N	t	\N	\N	rachabella	\N	\N	\N	\N	\N	\N	{"UserId":1308}	{user}	f	\N	1308	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
771	Shwetha Lakshman Rao	\N	USD	2016-09-29 10:51:29.333-07	\N	\N	t	\N	\N	shwethalakshmanrao	\N	\N	\N	\N	\N	\N	{"UserId":1309}	{user}	f	\N	1309	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
776	Xinhui Li	\N	USD	2016-09-29 10:53:00.503-07	\N	\N	t	\N	\N	xinhuili	\N	\N	\N	\N	\N	\N	{"UserId":1312}	{user}	f	\N	1312	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
783	Mia Zhu	\N	USD	2016-09-29 10:59:15.428-07	\N	\N	t	\N	\N	miazhu	\N	\N	\N	\N	\N	\N	{"UserId":1316}	{user}	f	\N	1316	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
788	Rylee 	\N	USD	2016-01-29 15:18:13.688-08	\N	\N	t	\N	\N	rylee	\N	\N	\N	\N	\N	\N	{"UserId":68}	{user}	f	\N	68	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
793	New York Code + Design Academy (Austin)	\N	USD	2016-08-01 08:55:23.132-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/rlc8ysokffcsnalr5jav_normalgif_7ff2c640-5800-11e6-a2a8-bb3ee7158535.gif	nycda	http://nycda.com/austin	atxcodedesign	\N	\N	\N	\N	{"UserId":884}	{user}	f	\N	884	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
798	Maira Bejamin	\N	USD	2016-09-29 11:05:19.073-07	\N	\N	t	\N	\N	mairabejamin	\N	\N	\N	\N	\N	\N	{"UserId":1323}	{user}	f	\N	1323	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
803	FJ Genus	\N	USD	2016-09-29 11:09:42.794-07	\N	\N	t	\N	\N	fjgenus	\N	\N	\N	\N	\N	\N	{"UserId":1330}	{user}	f	\N	1330	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
259	WWCode Birmingham	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:43:14.021-07	2016-12-23 09:19:36.878-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Birmingham**](https://www.womenwhocode.com/birmingham). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebirmingham#support) to WWCode Birmingham financially by making a donation below\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f9d834f0-c933-11e6-9af0-47fca5e686db.png	wwcodebirmingham	\N	wwcbirmingham	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
278	WWCode London	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 11:11:53.804-07	2016-12-27 09:29:43.796-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in London**](https://www.womenwhocode.com/london). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodelondon#support) WWCode London \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/8df462c0-9091-11e6-a134-f381d4cd2713.png	wwcodelondon	\N	wwclondon	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
270	WWCode Chicago	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:02:54.513-07	2016-12-23 11:48:12.132-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Chicago**](https://www.womenwhocode.com/chicago). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodechicago#support) to support WWCode Chicago \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/aef68840-9b9a-11e6-b592-e7f426067276.png	wwcodechicago	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
10	WWCode Mexico City	Nos dedicamos a inspirar inspirar a más mujeres a ser parte y destacar en carreras del mundo tecnológico.	MXN	2016-01-08 16:22:34.216-08	2016-12-27 09:59:26.298-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Mexico City**](https://www.womenwhocode.com/df). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedf#support) to support WWCode Mexico City \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/XMv1EFIxek.png	wwcodedf	http://www.meetup.com/Women-Who-Code-Mexico-City/	wwcodedf	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
807	Vinita Khandelwal Rathi	\N	USD	2016-09-29 11:11:53.843-07	\N	\N	t	\N	\N	vinitakhandelwalrathi	\N	\N	\N	\N	\N	\N	{"UserId":1334}	{user}	f	\N	1334	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
812	Emily Reese	\N	USD	2016-09-29 11:16:17.115-07	\N	\N	t	\N	\N	emilyreese	\N	\N	\N	\N	\N	\N	{"UserId":1340}	{user}	f	\N	1340	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
817	Shruti Sethi	\N	USD	2016-09-29 11:24:17.81-07	\N	\N	t	\N	\N	shrutisethi	\N	\N	\N	\N	\N	\N	{"UserId":1346}	{user}	f	\N	1346	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
822	Kathy Trammell	\N	USD	2016-09-29 11:28:08.47-07	\N	\N	t	\N	\N	kathytrammell	\N	\N	\N	\N	\N	\N	{"UserId":1351}	{user}	f	\N	1351	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
827	Sarrah Vesselov	\N	USD	2016-09-29 11:28:08.475-07	\N	\N	t	\N	\N	sarrahvesselov	\N	\N	\N	\N	\N	\N	{"UserId":1352}	{user}	f	\N	1352	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
832	Kristine Paas	\N	USD	2017-05-08 22:59:11.628-07	\N	\N	t	\N	\N	kjcpaas	\N	\N	\N	\N	\N	\N	{"UserId":4711}	{user}	f	\N	4711	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
838	Afia Owusu-Forfie	\N	USD	2016-09-29 10:44:40.419-07	\N	\N	t	\N	\N	afiaowusu-forfie	\N	\N	\N	\N	\N	\N	{"UserId":1304}	{user}	f	\N	1304	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
3	WWCode New York	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2015-12-12 16:14:54.028-08	2016-12-27 10:05:42.126-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in New York City**](https://www.womenwhocode.com/nyc). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodenyc#support) to support WWCode New York City \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/sjus3sm9uv.png	wwcodenyc	http://www.meetup.com/WomenWhoCodeNYC/	wwcodenyc	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
4	WWCode San Francisco	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2015-12-12 16:14:54.028-08	2016-12-27 11:54:09.597-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in San Francisco**](https://www.womenwhocode.com/sf). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesf#support) to support WWCode San Francisco\n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/6kFcX-6H5l.png	wwcodesf	http://www.meetup.com/Women-Who-Code-SF	wwcodesf	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
13	WWCode Washington DC	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-27 08:21:52.463-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Washington D.C.**](https://www.womenwhocode.com/dc). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedc#support) to support WWCode Washington D.C. \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/rhyrbLvkli.png	wwcodedc	https://www.womenwhocode.com/dc	wwcodedc	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
291	WWCode Toronto	WWCode is a global non-profit organization that inspires women to excel in technology careers.	CAD	2016-09-29 11:28:54.255-07	2016-12-28 08:20:52.347-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Toronto**](https://www.womenwhocode.com/toronto). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Global**](https://opencollective.com/wwcodetoronto#support) to support WWCode Toronto \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/6dbdcea0-a519-11e6-b4fe-6966ef500b6b.png	wwcodetoronto	\N	womenwhocodeto	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
686	Michelle Sun	\N	USD	2016-09-29 11:08:19.492-07	\N	\N	t	\N	\N	michellesun	\N	\N	\N	\N	\N	\N	{"UserId":1328}	{user}	f	\N	1328	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
687	Dana Dalling	\N	USD	2016-09-29 11:09:42.785-07	\N	\N	t	\N	\N	danadalling	\N	\N	\N	\N	\N	\N	{"UserId":1329}	{user}	f	\N	1329	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
843	Amanda Folson	\N	USD	2017-01-16 10:03:53.479-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/2150894e-87e2-4dab-8ffa-894342f0336b	ambassadorawsum	http://amandafolson.net/about/#twitter	AmbassadorAwsum	\N	\N	\N	\N	{"UserId":2561}	{user}	f	\N	2561	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
848	Women Who Code	\N	MXN	2015-11-19 02:07:53.479-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/wwcode_Final20Logojpg_abb42770-0335-11e7-9b56-cb401d104ebf.jpeg	adminwwc	https://www.womenwhocode.com/	\N	\N	\N	\N	\N	{"UserId":3}	{user}	f	\N	3	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
846	Tamouse Temple	\N	USD	2017-01-18 05:49:53.082-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8e79f1498f3e4a4ab53bec89d5dfc1e5_43f16060-dd85-11e6-bf52-5b99c6274a65.jpeg	tamouse1	http://www.tamouse.org	tamouse	\N	\N	\N	\N	{"UserId":2594}	{user}	f	\N	2594	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
2	WWCode Austin	WWCode is a global non-profit organization that inspires women to excel in technology careers. 	USD	2015-12-12 16:14:54.028-08	2016-12-23 07:30:21.805-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Austin**](https://www.womenwhocode.com/austin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeaustin#support) to support WWCode Austin \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/mX6wUEonFH.png	wwcodeaustin	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
688	Xavier Damman	Entrepreneur sharing ideas in copyleft	USD	2015-11-05 05:44:30.93-08	\N	\N	t	Tell us more about you, why you are on OpenCollective, what types of collectives you would love to contribute to, etc.\n\nProtip: you can use [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet);	https://opencollective-production.s3-us-west-1.amazonaws.com/5c825534ad62223ae6a539f6a5076d3cjpeg_1699f6e0-917c-11e6-a567-3f53b7b5f95c.jpeg	xdamman	http://xdamman.com	xdamman	\N	\N	\N	\N	{"UserId":2}	{user}	f	\N	2	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
689	MakerSquare 	\N	USD	2016-03-02 13:31:50.497-08	\N	\N	t	\N	https://course_report_production.s3.amazonaws.com/rich/rich_files/rich_files/268/s300/makersquare-logo.png	makersquare	http://www.makersquare.com	MakerSquareATX	\N	\N	\N	\N	{"UserId":129}	{user}	f	\N	129	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
690	WWCode 	\N	USD	2017-02-21 08:55:29.631-08	\N	\N	t	\N	\N	global	\N	\N	\N	\N	\N	\N	{"UserId":3206}	{user}	f	\N	3206	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
691	Pia Mancini	\N	USD	2016-01-09 13:31:01.954-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/9EflVQqM_400x400jpg_2aee92e0-858d-11e6-9fd7-73dd31eb7c0c.jpeg	piamancini	\N	piamancini	\N	\N	\N	\N	{"UserId":30}	{user}	f	\N	30	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
692	null null	\N	USD	2017-02-01 09:30:43.176-08	\N	\N	t	\N	\N	androidchick88	\N	\N	\N	\N	\N	\N	{"UserId":2906}	{user}	f	\N	2906	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
693	Anne Brown	\N	USD	2017-04-11 19:05:32.736-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/92dd7480-1f24-11e7-9a73-15e29bd9381e.png	abrown1411	\N	\N	\N	\N	\N	\N	{"UserId":4173}	{user}	f	\N	4173	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
694	Holly 	\N	USD	2015-12-21 08:34:26.053-08	\N	\N	t	\N	https://media.licdn.com/media/AAEAAQAAAAAAAAUUAAAAJDVjMTAxNGYxLWZhZmUtNDQ4Yi1hMzFjLWIzYmU3MTZjNGYxNA.jpg	ogibson	\N	\N	\N	\N	\N	\N	{"UserId":28}	{user}	f	\N	28	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
695	Georgia Andrews	\N	USD	\N	\N	\N	t	\N	\N	georgia	\N	\N	\N	\N	\N	\N	{"UserId":577}	{user}	f	\N	577	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
696	Chee Yim Goh	 I am generalist who are curious about a lot of things and often find myself dabble in both technical and management.	USD	2016-09-29 11:10:43.391-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/b06d105a90d849daae3cee823078ffbc_4c27ac00-0dcb-11e7-92a0-730911003b33.jpeg	cheeyimgoh	\N	\N	\N	\N	\N	\N	{"UserId":1331}	{user}	f	\N	1331	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
697	Nicole Giannone	\N	USD	2017-05-09 11:14:19.572-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/5bd8eb7d-65e2-482e-b9dd-ff7f33bf804b	nicole1	\N	\N	\N	\N	\N	\N	{"UserId":4720}	{user}	f	\N	4720	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
698	Chantal 	\N	USD	2016-01-29 15:19:36.407-08	\N	\N	t	\N	\N	chantal	\N	\N	\N	\N	\N	\N	{"UserId":74}	{user}	f	\N	74	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
699	Jigyasa Grover	\N	USD	2016-03-07 01:50:58.721-08	\N	\N	t	\N	https://res.cloudinary.com/opencollective/image/upload/v1483042743/ext_a8caeh.jpg	jigyasagrover	https://www.linkedin.com/in/jigyasagrover	\N	\N	\N	\N	\N	{"UserId":141}	{user}	f	\N	141	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
700	Pamela Wood Browne	\N	USD	2016-09-29 11:06:00.962-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/f08e3667929b4091bb398793543c458b_3c79dff0-89a8-11e6-b81f-a9802cdb670c.jpeg	pamelawoode-browne	\N	\N	\N	\N	\N	\N	{"UserId":1325}	{user}	f	\N	1325	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
701	Nikko Patten	\N	USD	2017-04-10 18:09:47.41-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/2e150bf7-d054-400f-8f23-35dab9acf9c9	nikko	https://twitter.com/NikkoPatten	NikkoPatten	\N	\N	\N	\N	{"UserId":4153}	{user}	f	\N	4153	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
702	Erin Spiceland	\N	USD	2017-03-07 11:01:52.704-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/4dedad77-5def-4d84-8e72-47bf0051649c	erin	\N	\N	\N	\N	\N	\N	{"UserId":3419}	{user}	f	\N	3419	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
703	Craft CMS	Content-first. Faceless like Jaqen.	USD	2017-04-20 02:34:08.219-07	\N	\N	t	Craft is a content-first CMS that aims to make life enjoyable for developers and content managers alike. It’s the tool of choice for thousands of [remarkably attractive](https://craftcms.com/community) web professionals around the world.	https://opencollective-production.s3-us-west-1.amazonaws.com/8e9cfe00-25ae-11e7-8c00-677620cd0201.png	craftcms	https://craftcms.com	craftcms	\N	\N	\N	\N	{"UserId":4348}	{user}	f	\N	4348	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
704	Rackspace 	\N	USD	2016-08-01 08:54:10.844-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/rackspacecom_a7d669f0-5800-11e6-a2a8-bb3ee7158535.png	rackspace	https://www.rackspace.com/	rackspace	\N	\N	\N	\N	{"UserId":883}	{user}	f	\N	883	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
705	Flock: Accelerating Women In Tech	\N	USD	2017-02-09 12:42:02.01-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/findmyflockcom_b7503b70-efb0-11e6-bcba-ed56440ee54a.png	kate	http://www.findmyflock.com	FindMyFlock	\N	\N	\N	\N	{"UserId":3053}	{user}	f	\N	3053	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
706	Sue Sinclair	\N	USD	2017-02-27 16:25:15.503-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/c50d2350-ae0b-4347-9e9b-3b51d55fd22d	sue	\N	\N	\N	\N	\N	\N	{"UserId":3301}	{user}	f	\N	3301	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
707	Allie Winkelman	\N	USD	2017-04-04 12:51:02.718-07	\N	\N	t	\N	\N	lwinkelman	\N	\N	\N	\N	\N	\N	{"UserId":3999}	{user}	f	\N	3999	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
708	Karen Farzam	\N	USD	2016-09-29 11:08:19.487-07	\N	\N	t	\N	\N	karenfarzam	\N	\N	\N	\N	\N	\N	{"UserId":1327}	{user}	f	\N	1327	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
709	Alicia 	\N	USD	2016-01-29 15:18:47.287-08	\N	\N	t	\N	\N	alicia	\N	\N	\N	\N	\N	\N	{"UserId":69}	{user}	f	\N	69	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
710	Laura Scholl	\N	USD	2016-09-29 11:32:00.983-07	\N	\N	t	\N	\N	laurascholl	\N	\N	\N	\N	\N	\N	{"UserId":1358}	{user}	f	\N	1358	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
711	Mami Enomoto	\N	USD	2016-09-29 11:33:37.095-07	\N	\N	t	\N	\N	mamienomoto	\N	\N	\N	\N	\N	\N	{"UserId":1361}	{user}	f	\N	1361	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
712	Jecelyn 	\N	USD	2016-09-29 11:10:43.392-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8146ec1d435a48c9a5f9d45600963c05_98566490-0ab0-11e7-85e3-cf8c26b6ca26.jpeg	jecelynyeen	\N	\N	\N	\N	\N	\N	{"UserId":1332}	{user}	f	\N	1332	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
713	Gen Ashley	Director, Women Who Code London	USD	2016-09-29 11:11:53.842-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/f739ff80-86fd-11e6-9561-f9be8e5da60b.jpeg	genashley	\N	\N	\N	\N	\N	\N	{"UserId":1333}	{user}	f	\N	1333	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
292	WWCode Vinnytsia	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:30:08.953-07	2016-12-28 08:27:20.161-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Vinnytsia**](https://www.womenwhocode.com/vinnytsia). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodevinnytsia#support) to support WWCode Vinnytsia \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/fcac9e50-a51b-11e6-b4fe-6966ef500b6b.png	wwcodevinnytsia	\N	WWCodeVinnytsia	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
520	Women Who Code San Diego	\N	USD	2017-02-21 11:34:46.927-08	2017-02-21 11:36:23.416-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform)\n\n[**Attend**](https://www.womenwhocode.com/sandiego) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesandiego#support) to support WWCode San Diego\n\nQuestions? Email us at global@womenwhocode.com.\n\n\n\n	\N	wwcodesandiego	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
723	Bonsai.io 	\N	USD	2016-04-13 09:46:07.217-07	\N	\N	t	\N	https://img.stackshare.io/service/228/c0daef6c2bf692d268e53a799111789c.png	bonsai	https://bonsai.io/	bonsaisearch	\N	\N	\N	\N	{"UserId":224}	{user}	f	\N	224	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
728	Daphne Chong	\N	USD	2016-09-29 11:34:59.499-07	\N	\N	t	\N	\N	daphnechong	\N	\N	\N	\N	\N	\N	{"UserId":1362}	{user}	f	\N	1362	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
733	Jamie Lu	\N	USD	2016-11-28 07:33:11.726-08	\N	\N	t	\N	https://logo.clearbit.com/narrativescience.com	jamielu	http://www.narrativescience.com	\N	\N	\N	\N	\N	{"UserId":1890}	{user}	f	\N	1890	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
738	RigUp 	\N	USD	2016-03-25 08:11:02.011-07	\N	\N	t	\N	https://a2.mzstatic.com/us/r30/Purple7/v4/23/90/cc/2390cca9-c82f-6700-4f13-f1cb4ca15991/icon350x350.jpeg	rigup	https://www.rigup.com	deepinsand	\N	\N	\N	\N	{"UserId":192}	{user}	f	\N	192	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
743	Aleksandra Gavriloska	\N	USD	2016-09-29 11:43:49.211-07	\N	\N	t	\N	\N	aleksandragavriloska	\N	\N	\N	\N	\N	\N	{"UserId":1379}	{user}	f	\N	1379	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
750	Glenna Buford	\N	USD	2016-09-29 11:43:49.205-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8a3d40b0-8fed-11e6-b320-5125b901f984.jpg	glennabuford	\N	\N	\N	\N	\N	\N	{"UserId":1378}	{user}	f	\N	1378	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
754	Lucy Shang	\N	USD	2016-09-29 10:53:00.502-07	\N	\N	t	\N	\N	lucyshang	\N	\N	\N	\N	\N	\N	{"UserId":1311}	{user}	f	\N	1311	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
759	Rose THERESA	\N	USD	2016-01-29 15:19:47.116-08	\N	\N	t	\N	\N	rosetheresa	\N	\N	\N	\N	\N	\N	{"UserId":76}	{user}	f	\N	76	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
764	Gabriela Adamova	\N	USD	2016-01-29 15:19:43.713-08	\N	\N	t	\N	\N	gabrielaadamova	\N	\N	\N	\N	\N	\N	{"UserId":75}	{user}	f	\N	75	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
769	Elizabeth Ferrao	\N	USD	2016-01-29 15:19:22.243-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/0addaf63-25c3-4f61-85bd-9ddec639dbaa	musingmurmurs	\N	MusingMurmurs	\N	\N	\N	\N	{"UserId":72}	{user}	f	\N	72	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
774	Oksana Denesiuk	\N	USD	2016-09-29 11:30:08.978-07	\N	\N	t	\N	\N	oksanadenesiuk	\N	\N	\N	\N	\N	\N	{"UserId":1355}	{user}	f	\N	1355	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
781	Eileen C	\N	USD	2017-01-14 09:11:39.224-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7be57fdf74ce40868c36ec561b515b9d_8a6a4900-da7c-11e6-af11-676b2b71a93b.jpeg	eileenc	\N	\N	\N	\N	\N	\N	{"UserId":2549}	{user}	f	\N	2549	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
787	Marisol Acuna	\N	USD	2016-09-29 11:25:21.95-07	\N	\N	t	\N	\N	marisolacuna	\N	\N	\N	\N	\N	\N	{"UserId":1347}	{user}	f	\N	1347	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
790	Neha Kaura	\N	USD	2016-09-29 11:01:49.703-07	\N	\N	t	\N	\N	nehakaura	\N	\N	\N	\N	\N	\N	{"UserId":1319}	{user}	f	\N	1319	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
795	Radhika Malik	\N	USD	2016-08-02 17:00:00-07	\N	\N	t	\N	\N	radhikam	\N	\N	\N	\N	\N	\N	{"UserId":897}	{user}	f	\N	897	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
800	KeSha Shah	\N	USD	2016-09-29 11:06:44.745-07	\N	\N	t	\N	\N	keshashah	\N	\N	\N	\N	\N	\N	{"UserId":1326}	{user}	f	\N	1326	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
805	thirteen23 	\N	USD	2016-09-01 07:41:33.243-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/thirteen23com_805f0980-7052-11e6-8e5a-492f532f3a40.png	thirteen23	http://www.thirteen23.com	thirteen23	\N	\N	\N	\N	{"UserId":1094}	{user}	f	\N	1094	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
811	Princy James	\N	USD	2016-09-29 11:14:46.606-07	\N	\N	t	\N	\N	princyjames	\N	\N	\N	\N	\N	\N	{"UserId":1338}	{user}	f	\N	1338	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
816	Ashma Sethi	\N	USD	2016-09-29 11:24:17.802-07	\N	\N	t	\N	\N	ashmasethi	\N	\N	\N	\N	\N	\N	{"UserId":1345}	{user}	f	\N	1345	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
821	Yoka Liu	\N	USD	2016-09-29 11:26:35.139-07	\N	\N	t	\N	\N	yokaliu	\N	\N	\N	\N	\N	\N	{"UserId":1350}	{user}	f	\N	1350	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
826	Grain 	\N	USD	2016-09-20 13:58:49.633-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/grainappio_20c2d740-7f75-11e6-998a-b5046561186d.png	grain_app	https://grainapp.io	grain_app	\N	\N	\N	\N	{"UserId":1244}	{user}	f	\N	1244	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
831	Wei-Juin Lin	\N	USD	2016-10-07 09:49:14.297-07	\N	\N	t	\N	\N	wei-juinlin	\N	\N	\N	\N	\N	\N	{"UserId":1446}	{user}	f	\N	1446	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
836	Wooga 	\N	USD	2016-11-29 02:03:21.301-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/24be6ad0-b61b-11e6-9f3b-115a2450f71e.jpg	maikesteinweller	http://www.wooga.com	wooga	\N	\N	\N	\N	{"UserId":1908}	{user}	f	\N	1908	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
841	Shirley Hicks	Network director, Women Who Code Birmingham	USD	2016-09-29 10:43:14.052-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7d7b2ba6c0a24e269f7853f4eb9fdced_72776110-b138-11e6-afe2-6129fbf4c498.png	shirleyhicks	\N	\N	\N	\N	\N	\N	{"UserId":1303}	{user}	f	\N	1303	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
47	WWCode Delhi	WWCode inspires women to excel in technology careers.	USD	2016-03-06 16:00:00-08	2016-12-27 08:24:21.89-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Delhi**](https://www.womenwhocode.com/delhi). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedelhi#support) to support WWCode Delhi \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/MFUk1nU_IQ.png	wwcodedelhi	https://www.womenwhocode.com/dc	wwcode_delhi	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
724	Aseem Sood	Cofounder, Open Collective.	USD	2015-11-30 12:20:11.257-08	\N	\N	t	Tell us more about you, why you are on OpenCollective, what types of collectives you would love to contribute to, etc.\n\nProtip: you can use [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)	https://opencollective-production.s3-us-west-1.amazonaws.com/jMoeGBOJjpg_d83f6890-a13d-11e6-a8af-411ab4a2c609.jpeg	aseem	\N	AseemSood_	\N	\N	\N	\N	{"UserId":8}	{user}	f	\N	8	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
729	Lucy Bain	\N	USD	2016-09-29 11:34:59.504-07	\N	\N	t	\N	\N	lucybain	\N	\N	\N	\N	\N	\N	{"UserId":1363}	{user}	f	\N	1363	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
734	Paige Hubbell	\N	USD	2016-03-19 15:11:44.881-07	\N	\N	t	\N	\N	phubbell	\N	\N	\N	\N	\N	\N	{"UserId":170}	{user}	f	\N	170	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
739	Ana Castro	\N	USD	2016-09-29 11:38:54.934-07	\N	\N	t	\N	\N	anacastro	\N	\N	\N	\N	\N	\N	{"UserId":1368}	{user}	f	\N	1368	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
745	Cisco 	\N	USD	2016-04-29 11:46:16.143-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/dAmHQYgjpg_6d4cc930-1130-11e6-9815-b7ee6884387f.jpg	cisco	http://cisco.com	cisco	\N	\N	\N	\N	{"UserId":308}	{user}	f	\N	308	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
751	Sonia Prabhu	\N	USD	2016-09-29 11:41:11.058-07	\N	\N	t	\N	\N	soniaprabhu	\N	\N	\N	\N	\N	\N	{"UserId":1373}	{user}	f	\N	1373	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
757	Carola Nitz	\N	USD	2016-09-29 11:43:49.157-07	\N	\N	t	\N	\N	carolanitz	\N	\N	\N	\N	\N	\N	{"UserId":1376}	{user}	f	\N	1376	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
762	Allison Canestaro	\N	USD	2016-06-06 12:04:33.418-07	\N	\N	t	\N	\N	allisoncanestaro	\N	\N	\N	\N	\N	\N	{"UserId":551}	{user}	f	\N	551	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
767	Christina Lynch	\N	USD	2016-09-29 11:37:07.344-07	\N	\N	t	\N	\N	christinalynch	\N	\N	\N	\N	\N	\N	{"UserId":1367}	{user}	f	\N	1367	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
772	Lindsey Barrett	\N	USD	2016-06-22 13:09:43.896-07	\N	\N	t	\N	\N	lindseybarrett	\N	\N	\N	\N	\N	\N	{"UserId":646}	{user}	f	\N	646	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
777	Sandra 	\N	USD	2016-01-11 10:53:43.73-08	\N	\N	t	\N	https://media.licdn.com/media/p/1/000/056/1e1/1c4c4e1.jpg	sandrawwc	\N	\N	\N	\N	\N	\N	{"UserId":31}	{user}	f	\N	31	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
779	Sheree Atcheson	\N	USD	2016-09-29 10:54:53.462-07	\N	\N	t	\N	\N	shereeatcheson	\N	\N	\N	\N	\N	\N	{"UserId":1314}	{user}	f	\N	1314	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
784	Geoff Domoracki	\N	USD	2016-08-03 10:47:13.173-07	\N	\N	t	\N	\N	geoffdomoracki	\N	\N	\N	\N	\N	\N	{"UserId":896}	{user}	f	\N	896	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
789	Polson & Polson, P.C.	\N	USD	2017-03-09 10:29:51.939-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/9R0XXM9_normalpng_75889240-04f6-11e7-8ab4-9b0a3890c09e.png	nalini	http://www.polsonlawfirm.com/	\N	\N	\N	\N	\N	{"UserId":3442}	{user}	f	\N	3442	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
794	Carole Bennett	\N	USD	2016-09-29 11:03:46.798-07	\N	\N	t	\N	\N	carolebennett	\N	\N	\N	\N	\N	\N	{"UserId":1322}	{user}	f	\N	1322	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
799	Candace Lazarou	\N	USD	2016-09-29 11:05:19.079-07	\N	\N	t	\N	\N	candacelazarou	\N	\N	\N	\N	\N	\N	{"UserId":1324}	{user}	f	\N	1324	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
804	Jane Shih	\N	USD	2016-09-07 15:13:23.624-07	\N	\N	t	\N	\N	janeshih	\N	\N	\N	\N	\N	\N	{"UserId":1145}	{user}	f	\N	1145	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
810	Grisel Ancona	\N	USD	2016-09-29 11:15:23.931-07	\N	\N	t	\N	\N	griselancona	\N	\N	\N	\N	\N	\N	{"UserId":1339}	{user}	f	\N	1339	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
815	Andreza Leite	\N	USD	2016-09-29 11:19:11.446-07	\N	\N	t	\N	\N	andrezaleite	\N	\N	\N	\N	\N	\N	{"UserId":1343}	{user}	f	\N	1343	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
820	Qianyi Zheng	\N	USD	2016-09-29 11:26:35.133-07	\N	\N	t	\N	\N	qianyizheng	\N	\N	\N	\N	\N	\N	{"UserId":1349}	{user}	f	\N	1349	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
824	Dinah Shi	\N	USD	2016-09-29 11:30:54.244-07	\N	\N	t	\N	\N	dinahshi	\N	\N	\N	\N	\N	\N	{"UserId":1356}	{user}	f	\N	1356	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
829	Britten Kuckelman	\N	USD	2016-09-29 11:32:00.979-07	\N	\N	t	\N	\N	brittenkuckelman	\N	\N	\N	\N	\N	\N	{"UserId":1357}	{user}	f	\N	1357	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
834	Kelly Erickson	\N	USD	2017-01-03 12:59:33.995-08	\N	\N	t	\N	\N	kellyerickson	\N	\N	\N	\N	\N	\N	{"UserId":2416}	{user}	f	\N	2416	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
839	Alaina Percival	\N	USD	2016-03-01 20:41:59.905-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/fb1f0fd9-4da7-4c66-847b-0eaaf5fe88e9	alaina	http://womenwhocode.com	alaina	\N	\N	\N	\N	{"UserId":126}	{user}	f	\N	126	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
844	Cameron 🐳✨	\N	USD	2016-12-18 17:41:26.473-08	\N	\N	t	\N	\N	cameron1	\N	\N	\N	\N	\N	\N	{"UserId":2220}	{user}	f	\N	2220	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
524	Women Who Code Barcelona	\N	EUR	2017-02-21 12:11:44.714-08	2017-02-21 12:13:31.987-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/barcelona) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebarcelona#support) to support WWCode Barcelona\n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodebarcelona	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
262	WWCode Bangalore	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:51:29.29-07	2016-12-23 08:55:34.516-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Bangalore**](https://www.womenwhocode.com/bangalore). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebangalore#support) to support WWCode Bangalore\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/fe02eee0-961a-11e6-a6e9-23ce753be86b.png	wwcodebangalore	\N	wwcodebangalore	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
725	Aya Nakagawa	\N	USD	2016-09-29 11:33:37.088-07	\N	\N	t	\N	\N	ayanakagawa	\N	\N	\N	\N	\N	\N	{"UserId":1360}	{user}	f	\N	1360	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
730	Emily Heist Moss	\N	USD	2016-02-18 11:54:08.5-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/18b8dbe9-bc4b-4e82-b6db-b41eff9ca2e5	emilyheistmoss	\N	EmilyHeistMoss	\N	\N	\N	\N	{"UserId":108}	{user}	f	\N	108	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
735	The Human Geo Group	\N	USD	2016-04-29 06:51:16.619-07	\N	\N	t	\N	https://logo.clearbit.com/thehumangeo.com	thehumangeo	\N	\N	\N	\N	\N	\N	{"UserId":303}	{user}	f	\N	303	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
740	null null	\N	USD	2016-07-01 15:31:42.541-07	\N	\N	t	\N	\N	pkmass	\N	\N	\N	\N	\N	\N	{"UserId":686}	{user}	f	\N	686	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
744	Brian Vinci	\N	USD	2017-05-15 05:07:56.682-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/4fc0a750-3967-11e7-955e-43d656f05f49.jpg	brian1	http://expeditionhacks.com/seattle	expeditionhacks	\N	\N	\N	\N	{"UserId":4834}	{user}	f	\N	4834	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
752	Isaac Potoczny-Jones	\N	USD	2016-09-22 18:07:06.058-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/466bd3a0-812a-11e6-8430-9f6ee94192cb.png	tozny	https://tozny.com	Tozny	\N	\N	\N	\N	{"UserId":1263}	{user}	f	\N	1263	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
756	Nupur Kapoor	\N	USD	2016-01-29 15:16:09.038-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/572a82f0-a28a-4e61-ba19-a0f09f1e812b	kapoornupur	\N	kapoornupur	\N	\N	\N	\N	{"UserId":67}	{user}	f	\N	67	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
760	Judith Agbotse	\N	USD	2016-09-29 10:44:40.429-07	\N	\N	t	\N	\N	judithagbotse	\N	\N	\N	\N	\N	\N	{"UserId":1305}	{user}	f	\N	1305	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
765	Fanya 	\N	USD	2016-01-29 15:20:00.061-08	\N	\N	t	\N	\N	fanya	\N	\N	\N	\N	\N	\N	{"UserId":78}	{user}	f	\N	78	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
770	Zoe Madden-Wood	\N	USD	2016-01-29 15:19:53.922-08	\N	\N	t	\N	\N	zoemadden-wood	\N	\N	\N	\N	\N	\N	{"UserId":77}	{user}	f	\N	77	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
775	Maru Lango	\N	USD	2016-02-02 08:52:02.222-08	\N	\N	t	\N	https://res.cloudinary.com/opencollective/image/upload/v1483038929/8vJ-Prbe_imotym.png	marulango	http://maruma.ru	Marulango	\N	\N	\N	\N	{"UserId":80}	{user}	f	\N	80	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
782	Isabella Oliveira	\N	USD	2016-09-29 10:58:16.63-07	\N	\N	t	\N	\N	isabellaoliveira	\N	\N	\N	\N	\N	\N	{"UserId":1315}	{user}	f	\N	1315	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
786	Sally Kingston	\N	USD	2016-09-29 11:01:04.636-07	\N	\N	t	\N	\N	sallykingston	\N	\N	\N	\N	\N	\N	{"UserId":1318}	{user}	f	\N	1318	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
792	Amber Houle	\N	USD	2016-09-29 11:02:54.546-07	\N	\N	t	\N	\N	amberhoule	\N	\N	\N	\N	\N	\N	{"UserId":1320}	{user}	f	\N	1320	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
797	Casey Gruppioni	\N	USD	2016-08-02 17:00:00-07	\N	\N	t	\N	\N	casey	\N	\N	\N	\N	\N	\N	{"UserId":898}	{user}	f	\N	898	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
802	Ellevest 	\N	USD	2016-05-23 13:27:26.092-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/ellevestcom_0882df80-2125-11e6-9a76-e98f5a4a50b6.png	ellevest	http://www.ellevest.com	Ellevest	\N	\N	\N	\N	{"UserId":426}	{user}	f	\N	426	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
808	Tiffany Andrews	\N	USD	2016-09-29 11:12:58.852-07	\N	\N	t	\N	\N	tiffanyandrews	\N	\N	\N	\N	\N	\N	{"UserId":1336}	{user}	f	\N	1336	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
813	Veronica Cannon	\N	USD	2016-09-29 11:17:47.289-07	\N	\N	t	\N	\N	veronicacannon	\N	\N	\N	\N	\N	\N	{"UserId":1342}	{user}	f	\N	1342	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
818	Barbara 	\N	USD	2016-01-29 15:19:28.648-08	\N	\N	t	\N	\N	barbara	\N	\N	\N	\N	\N	\N	{"UserId":73}	{user}	f	\N	73	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
823	Ria Riaz	\N	USD	2016-09-29 11:28:54.276-07	\N	\N	t	\N	\N	riariaz	\N	\N	\N	\N	\N	\N	{"UserId":1353}	{user}	f	\N	1353	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
828	Ksenia Barshchyk	\N	USD	2016-09-29 11:30:08.971-07	\N	\N	t	\N	\N	kseniabarshchyk	\N	\N	\N	\N	\N	\N	{"UserId":1354}	{user}	f	\N	1354	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
833	Maddy Lau	\N	USD	2016-11-30 08:11:38.749-08	\N	\N	t	\N	https://logo.clearbit.com/nycda.com	maddylau	http://nycda.com	nycodedesign	\N	\N	\N	\N	{"UserId":1957}	{user}	f	\N	1957	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
837	Snehal Patil	\N	USD	2016-09-29 11:41:11.059-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/eea1cd90-adc6-11e6-97ba-67ed1cda3697.png	snehalpatil	\N	\N	\N	\N	\N	\N	{"UserId":1374}	{user}	f	\N	1374	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
842	Portland Modern Manufacturing Collective	\N	USD	2016-11-22 07:22:35.912-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8cb68090-b0c7-11e6-8d75-191d15208aa9.png	mrlnmarce	http://www.uncorkedstudios.com	mrlnmarce	\N	\N	\N	\N	{"UserId":1846}	{user}	f	\N	1846	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
847	Sarah Olson	Director of Women Who Code Twin Cities	USD	2016-03-07 01:51:08.328-08	\N	\N	t	I'm a Senior Software Engineer, currently working on the iOS app at Trello. I'm the Director of Women Who Code Twin Cities.	https://opencollective-production.s3-us-west-1.amazonaws.com/306b9860-dd87-11e6-aabd-af731cff2f24.jpeg	saraholson	https://www.linkedin.com/in/saraheolson	\N	\N	\N	\N	\N	{"UserId":142}	{user}	f	\N	142	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
295	WWCode Tokyo	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:33:36.887-07	2016-12-28 08:00:36.071-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Tokyo**](https://www.womenwhocode.com/tokyo). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetokyo#support) to support WWCode Tokyo \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/bf15e4a0-a518-11e6-b4fe-6966ef500b6b.png	wwcodetokyo	\N	wwcode_tokyo	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
726	Kaylyn 	\N	USD	2016-01-11 10:57:18.467-08	\N	\N	t	\N	https://res.cloudinary.com/opencollective/image/upload/v1483039249/i8n9dw-4_vxdyyi.jpg	kgibilterra	\N	\N	\N	\N	\N	\N	{"UserId":33}	{user}	f	\N	33	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
731	Peggy Kuo	\N	USD	2016-09-29 11:34:59.505-07	\N	\N	t	\N	\N	peggykuo	\N	\N	\N	\N	\N	\N	{"UserId":1364}	{user}	f	\N	1364	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
736	Vicky Twomey-Lee	\N	USD	2016-09-29 11:37:07.344-07	\N	\N	t	\N	\N	vickytwomey-lee	\N	\N	\N	\N	\N	\N	{"UserId":1366}	{user}	f	\N	1366	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
741	Erika Aguayo	\N	USD	2016-09-29 11:38:54.935-07	\N	\N	t	\N	\N	erikaaguayo	\N	\N	\N	\N	\N	\N	{"UserId":1369}	{user}	f	\N	1369	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
746	Saranya Karuppusamy	\N	USD	2016-01-11 10:54:33.296-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/35f74ebjpg_d2d1c140-35a4-11e7-8caa-3b6f8e012814.jpeg	saranyawwc	\N	\N	\N	\N	\N	\N	{"UserId":32}	{user}	f	\N	32	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
748	data.world Swider	\N	USD	2016-09-28 14:47:14.881-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/dataworld_6f037d50-85c5-11e6-9fd7-73dd31eb7c0c.png	gabrielaswider	http://data.world	datadotworld	\N	\N	\N	\N	{"UserId":1299}	{user}	f	\N	1299	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
753	Irina Muchnik	\N	USD	2016-09-29 11:12:58.838-07	\N	\N	t	\N	\N	irinamuchnik	\N	\N	\N	\N	\N	\N	{"UserId":1335}	{user}	f	\N	1335	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
758	Lacey Reinoehl	\N	USD	2017-05-01 10:13:32.139-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/8207c9a5-55ed-41a7-a238-4ef4d22a6059	laceyreinoehl	\N	\N	\N	\N	\N	\N	{"UserId":4550}	{user}	f	\N	4550	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
763	Fatma Djoudjou	\N	USD	2016-09-29 10:49:43.051-07	\N	\N	t	\N	\N	fatmadjoudjou	\N	\N	\N	\N	\N	\N	{"UserId":1307}	{user}	f	\N	1307	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
768	Joey Rosenberg	\N	USD	2016-06-21 09:02:52.874-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/IndianVisa_RosenbergJPG_17d93090-37ca-11e6-90ee-0555971b7ddd.JPG	joeycrose	\N	joeycrose	\N	\N	\N	\N	{"UserId":642}	{user}	f	\N	642	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
773	Smitha Radhakrishnan	\N	USD	2016-09-29 10:51:29.334-07	\N	\N	t	\N	\N	smitharadhakrishnan	\N	\N	\N	\N	\N	\N	{"UserId":1310}	{user}	f	\N	1310	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
778	Gillian Colan-O'Leary	\N	USD	2016-09-29 10:54:53.45-07	\N	\N	t	\N	\N	gilliancolan-o'leary	\N	\N	\N	\N	\N	\N	{"UserId":1313}	{user}	f	\N	1313	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
780	beth laing	\N	USD	2016-01-29 15:18:53.83-08	\N	\N	t	\N	\N	beth	\N	\N	\N	\N	\N	\N	{"UserId":70}	{user}	f	\N	70	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
785	Amber Joyner	\N	USD	2016-09-29 11:01:04.636-07	\N	\N	t	\N	\N	amberjoyner	\N	\N	\N	\N	\N	\N	{"UserId":1317}	{user}	f	\N	1317	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
791	Candice Haddad	\N	USD	2016-09-29 11:02:54.555-07	\N	\N	t	\N	\N	candicehaddad	\N	\N	\N	\N	\N	\N	{"UserId":1321}	{user}	f	\N	1321	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
796	Elijah Van Der Giessen	\N	USD	2017-05-10 16:45:43.307-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/d7d17c0e-20b0-40ae-a128-eaf85a311f0c	eli	\N	\N	\N	\N	\N	\N	{"UserId":4749}	{user}	f	\N	4749	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
801	Shahnaz Kamberi	\N	USD	2016-06-06 17:53:44.829-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/dcacmorg_5f260cb0-2c4a-11e6-80e4-310475aa5f5c.png	dcacm	http://dcacm.org	dcacm	\N	\N	\N	\N	{"UserId":555}	{user}	f	\N	555	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
806	Pieceofr 	\N	USD	2016-09-09 20:42:48.933-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/2c8df290-7709-11e6-a96a-b97f0af14723.jpg	pieceofr	\N	\N	\N	\N	\N	\N	{"UserId":1158}	{user}	f	\N	1158	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
809	Isabel Yepes	\N	USD	2016-09-29 11:13:48.772-07	\N	\N	t	\N	\N	isabelyepes	\N	\N	\N	\N	\N	\N	{"UserId":1337}	{user}	f	\N	1337	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
814	Jennifer Hoover	\N	USD	2016-09-29 11:16:52.099-07	\N	\N	t	\N	\N	jenniferhoover	\N	\N	\N	\N	\N	\N	{"UserId":1341}	{user}	f	\N	1341	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
819	Roxane Castelein	\N	USD	2016-09-29 11:25:21.969-07	\N	\N	t	\N	\N	roxanecastelein	\N	\N	\N	\N	\N	\N	{"UserId":1348}	{user}	f	\N	1348	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
825	Travis Swicegood	\N	USD	2016-05-19 12:24:40.738-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/03134eb6a2764594808716e5c3f0dc6c_690fce70-1df7-11e6-b09a-bd4f4a904ffe.jpeg	tswicegood	http://www.travisswicegood.com	tswicegood	\N	\N	\N	\N	{"UserId":392}	{user}	f	\N	392	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
830	Hector Torres	\N	USD	2016-10-06 11:36:34.986-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7aOKGnA1_normaljpg_f6ea41c0-8bf3-11e6-8916-b3b1b8ac2e00.jpeg	hectortorres	http://summit.ulahealth.me	ulahealth	\N	\N	\N	\N	{"UserId":1438}	{user}	f	\N	1438	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
835	Rigado 	\N	USD	2016-11-17 09:43:26.15-08	\N	\N	t	\N	https://logo.clearbit.com/rigado.com	christinepechette	https://www.rigado.com/	RigadoLLC	\N	\N	\N	\N	{"UserId":1808}	{user}	f	\N	1808	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
840	Nataliia Ilchenko	WWCode Kyiv Director	USD	2017-01-03 16:00:00-08	\N	\N	t	\N	/public/images/users/avatar-04.svg	nataliia	\N	\N	\N	\N	\N	\N	{"UserId":2431}	{user}	f	\N	2431	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
845	Karina 	I am web developer, Director WWcode Recife - Brazil	USD	2016-09-29 11:19:11.45-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/a6711e2eef3c42dbaa7b9e658670e44e_65470050-13c0-11e7-8edd-59205a885cb5.jpeg	karinamachado	\N	\N	\N	\N	\N	\N	{"UserId":1344}	{user}	f	\N	1344	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
525	Women Who Code Pune	\N	USD	2017-02-21 12:16:59.055-08	2017-02-21 12:18:19.484-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/pune) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodepune#support) to support WWCode Pune \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodepune	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
275	WWCode Hong Kong 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:08:19.455-07	2016-12-27 08:53:38.119-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Hong Kong**](https://www.womenwhocode.com/hk). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodehongkong#support) to support WWCode Hong Kong \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/adea85b0-9c7a-11e6-a3da-b7d8fa4b13cd.png	wwcodehongkong	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
518	Women Who Code Singapore	\N	USD	2017-02-21 11:13:03.341-08	2017-02-21 11:19:36.571-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform)\n\n[**Attend**](https://www.womenwhocode.com/singapore) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesingapore#support) to support WWCode Singapore\n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodesingapore	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
584	WWCode Edinburgh	\N	GBP	2017-04-03 09:22:45.923-07	2017-04-03 09:22:46-07	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n\n# Contribute\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSczqJwa2qByhFFHXavunDYPzXRh1p0lOVa8nfyMSvCCySkd0Q/viewform)\n[**Attend**](https://www.womenwhocode.com/edinburgh) 	\N	wwcodeedinburgh	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n\n\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3206	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
268	WWCode Charleston	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:01:04.477-07	2016-12-23 11:37:13.42-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Charleston**](https://www.womenwhocode.com/charleston). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecharleston#support) to support WWCode Charleston\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/a185ed40-9b95-11e6-b592-e7f426067276.png	wwcodecharleston	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
521	Women Who Code Raleigh Durham	\N	USD	2017-02-21 11:39:46.205-08	2017-02-21 11:41:19.26-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/raleigh) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderaleigh#support) to support WWCode Raleigh Durham \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcoderaleigh	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
263	WWCode Beijing	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:53:00.452-07	2016-12-23 08:58:56.927-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Beijing**](https://www.womenwhocode.com/beijing). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebeijing#support) to support WWCode Beijing\n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f6793200-961b-11e6-a6e9-23ce753be86b.png	wwcodebeijing	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
284	WWCode Phoenix	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:16:52.055-07	2016-12-27 10:33:28.693-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Phoenix**](https://www.womenwhocode.com/phoenix). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephoenix#support) to support WWCode Phoenix \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/dd27b4d0-9d45-11e6-9116-db595ff259df.png	wwcodephoenix	\N	wwcodephoenix	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
289	WWCode Shanghai	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:26:35.114-07	2016-12-28 07:51:25.097-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Shanghai**](https://www.womenwhocode.com/shanghai). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeshanghai#support) to support WWCode Shanghai\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/7be08da0-cd15-11e6-a033-c553d2fe46df.png	wwcodeshanghai	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
283	WWCode Paris	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 11:16:17.095-07	2016-12-27 10:09:21.598-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Paris**](https://www.womenwhocode.com/paris). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeparis#support) to support WWCode Paris \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/17525ef0-9d44-11e6-9116-db595ff259df.png	wwcodeparis	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
519	Women Who Code Cleveland	\N	USD	2017-02-21 11:25:28.662-08	2017-02-21 11:28:23.116-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform)\n\n[**Attend**](https://www.womenwhocode.com/cleveland) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecleveland#support) to support WWCode Cleveland \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodecleveland	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
272	WWCode East Bay	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:05:19.056-07	2016-12-27 08:38:30.14-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Oakland/East Bay**](https://www.womenwhocode.com/east-bay). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeeastbay#support) to support WWCode Oakland/East Bay \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/d9a7fc70-9c5f-11e6-84fe-5d5e57220970.png	wwcodeeastbay	\N	wwcode_eastbay	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
265	WWCode Belo Horizonte	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:58:16.617-07	2016-12-23 09:07:51.328-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Belo Horizonte**](https://www.womenwhocode.com/belo-horizonte). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebelohorizonte#support) to support WWCode Belo Horizonte \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	\N	wwcodebelohorizonte	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
515	Women Who Code Philadelphia	\N	USD	2017-02-21 10:49:14.309-08	2017-02-21 10:55:30.087-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/philadelphia) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephiladelphia#support) to support WWCode Philadelphia \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodephiladelphia	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
523	Women Who Code Sofia	\N	EUR	2017-02-21 12:04:48.889-08	2017-02-21 12:06:29.574-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform)\n\n[**Attend**](https://www.womenwhocode.com/sofia) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesofia#support) to support WWCode Sofia \n\nQuestions? Email us at global@womenwhocode.com	\N	wwcodesofia	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
273	WWCode Greenville	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:06:00.939-07	2016-12-27 08:48:30.075-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Greenville**](https://www.womenwhocode.com/greenville). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodegreenville#support) to support WWCode Greenville \n\nQuestions? Email us at global@womenwhocode.com. 	https://opencollective-production.s3-us-west-1.amazonaws.com/d1719000-8fd7-11e6-b320-5125b901f984.png	wwcodegreenville	\N	wwcodegville	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
274	WWCode Gujarat	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:06:44.732-07	2016-12-27 08:50:50.189-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Gujarat**](https://www.womenwhocode.com/gujarat). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodegujarat#support) to support WWCode Gujarat\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/52506d70-9c78-11e6-a3da-b7d8fa4b13cd.png	wwcodegujarat	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
299	WWCode Colima	WWCode is a global non-profit organization that inspires women to excel in technology careers.	MXN	2016-09-29 11:38:52.23-07	2016-12-27 08:09:39.74-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Colima**](https://www.womenwhocode.com/colima). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecolima#support) to support WWCode Colima \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/a02c3dc0-9ba2-11e6-84fe-5d5e57220970.png	wwcodecolima	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
260	WWCode Accra	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:44:40.394-07	2016-12-23 07:39:43.815-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Accra**](https://www.womenwhocode.com/accra). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeaccra#support) to support WWCode Accra\n\nQuestions? Email us at global@womenwhocode.com.  	https://opencollective-production.s3-us-west-1.amazonaws.com/c4810040-8a89-11e6-9ae7-452ac38279da.png	wwcodeaccra	\N	wwcodeaccra	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
261	WWCode Al-Jazair	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:49:43.012-07	2016-12-23 08:44:45.61-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Al-Jaza'ir**](https://www.womenwhocode.com/al-jaza-ir-algeria). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodealjazair#support) to support WWCode Al-Jaza'ir\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/5cc6b9c0-9562-11e6-add0-93faa9a7296f.png	wwcodealjazair	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
297	WWCode Sydney	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 11:34:59.472-07	2016-12-28 07:55:06.005-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Sydney**](https://www.womenwhocode.com/sydney-australia). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesydney#support) to support WWCode Sydney \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/405f1180-a514-11e6-b4fe-6966ef500b6b.png	wwcodesydney	\N	wwcsyd	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
269	WWCode Chennai	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:01:49.683-07	2016-12-23 11:40:22.493-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Chennai**](https://www.womenwhocode.com/chennai). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodechennai#support) to WWCode Chennai \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/f50c62b0-9b99-11e6-b592-e7f426067276.png	wwcodechennai	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
287	WWCode Sacramento 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:24:17.771-07	2016-12-27 11:44:07.667-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Sacramento**](https://www.womenwhocode.com/sacramento). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesacramento#support) to support WWCode Sacramento \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/dca653c0-a2bf-11e6-b669-1f602f2f2eec.png	wwcodesacramento	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
288	WWCode Santiago	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:25:21.912-07	2016-12-27 11:48:06.766-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Santiago**](https://www.womenwhocode.com/santiago). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesantiago#support) to support WWCode Santiago \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/595593e0-a2c0-11e6-b669-1f602f2f2eec.png	wwcodesantiago	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
15	WWCode Boulder/Denver	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-27 08:29:26.21-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Boulder/Denver**](https://www.womenwhocode.com/boulder). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebd#support) to support WWCode Boulder/Denver \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/OSosQI7_aV.png	wwcodebd	\N	wwcodebd	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
281	WWCode Melbourne	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 11:14:46.59-07	2016-12-27 09:51:32.497-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Melbourne**](https://www.womenwhocode.com/melbourne). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemelbourne#support) to support WWCode Melbourne\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/19756e50-cc5d-11e6-be07-3dfc36c6d12c.png	wwcodemelbourne	\N	WWCodeMelbourne	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
264	WWCode Belfast	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 10:54:53.422-07	2016-12-23 09:01:33.569-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Belfast**](https://www.womenwhocode.com/belfast). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebelfast#support) to support WWCode Belfast\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/e1bb8200-96e8-11e6-baa3-69f47ab52eed.png	wwcodebelfast	\N	WWCBelfast	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
300	WWCode Silicon Valley	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:41:11.03-07	2016-12-28 07:46:08.715-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Silicon Valley**](https://www.womenwhocode.com/sv). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesv#support) to support WWCode Silicon Valley \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/cc80e4c0-90ad-11e6-a134-f381d4cd2713.png	wwcodesv	\N	wwcodesv	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
285	WWCode Reno/Tahoe	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:17:47.232-07	2016-12-27 11:29:59.63-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Reno/Tahoe**](https://www.womenwhocode.com/reno). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderenotahoe#support) to support WWCode Reno/Tahoe\n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/caae3800-a2be-11e6-b669-1f602f2f2eec.png	wwcoderenotahoe	\N	WWCodeRenoTahoe	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
290	WWCode Tampa	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:28:08.446-07	2016-11-07 10:27:01.762-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Tampa**](https://www.womenwhocode.com/tampa). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Support**](https://opencollective.com/wwcodetampa#support) WWCode Tampa financially by making a donation below\n\n\nYour donations are critical in supporting this catalytic movement. Donations received here directly support our programs. A small amount also supports global development so that we can bring innovative program to cities around the world, ensuring that more women everywhere have the opportunity to excel in technology careers.\n\n\nQuestions? Email us at contact@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/638dcdc0-a516-11e6-b4fe-6966ef500b6b.png	wwcodetampa	\N	wwcodetampa	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
195	WWCode Boston	WWCode is a global non-profit organization that inspires women to excel in technology careers. 	USD	2015-12-12 16:14:54.028-08	2016-12-23 09:29:46.034-08	\N	t	Women Who Code (WWCode) is a global 501(c)(3) non-profit dedicated to inspiring women to excel in technology careers. We connect amazing women with other like-minded women around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 50,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Boston**](https://www.womenwhocode.com/boston). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an upcoming event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Boston \n\nQuestions?  Email global@womenwhocode.com	https://cldup.com/E6Hx_qyE9A.png	wwcodeboston	https://www.womenwhocode.com/boston	wwcboston	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
12	Women Who Code Atlanta	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-23 08:56:56.09-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Atlanta**](https://www.womenwhocode.com/atl). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeatl#support) to support WWCode Atlanta\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/NzLkW4RcED.png	wwcodeatl	\N	wwcodeatl	We are on a mission to inspire women to excel in tech careers.	\N	25	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
267	WWCode Bristol 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 11:00:01.773-07	2016-12-23 09:54:17.915-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Bristol**](https://www.womenwhocode.com/bristol). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebristol#support) to support WWCode Bristol \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/bea58950-c938-11e6-9af0-47fca5e686db.png	wwcodebristol	\N	wwcbristol	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
282	WWCode Merida	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:15:23.91-07	2016-12-27 09:55:44.4-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Merida**](https://www.womenwhocode.com/merida). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemerida#support) to support WWCode Merida \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/af808880-cc5d-11e6-be07-3dfc36c6d12c.png	wwcodemerida	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
511	Women Who Code Monterrey	\N	MXN	2017-02-21 08:55:29.596-08	2017-02-21 09:26:29.52-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform)\n\n[**Attend**](https://www.womenwhocode.com/monterrey) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemonterrey#support) to support WWCode Boston \n\n\n\n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/d32e97d0-f85a-11e6-aebb-a9d659d01ec2.png	wwcodemonterrey	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3206	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
271	WWCode Dallas	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:03:46.779-07	2016-12-27 08:14:29.745-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Dallas/Fort Worth**](https://www.womenwhocode.com/dfw). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedallas#support) to support WWCode Dallas/Fort Worth\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f1679990-9a18-11e6-8650-f92e594d5de8.png	wwcodedallas	\N	wwcodedfw	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	848	848	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
\.


                                      4015.dat                                                                                            0000600 0004000 0002000 00000025507 13155532021 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        7	github	piamancini	*****	*****	\N	2016-05-23 10:23:51.553-07	2016-05-23 10:24:25.036-07	\N	30	\N	\N
3	github	asood123	*****	*****	\N	2016-05-23 10:14:54.648-07	2016-08-13 04:56:21.771-07	\N	8	\N	\N
4	github	xdamman	*****	*****	\N	2016-05-23 10:19:57.6-07	2017-05-03 07:31:33.249-07	\N	2	\N	\N
982	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-03-02 08:18:07.069-08	2017-09-11 09:04:32.074-07	\N	\N	\N	*****
984	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-03-18 10:17:15.567-07	2017-09-11 09:04:32.075-07	\N	\N	\N	*****
988	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-04-21 18:39:22.397-07	2017-09-11 09:04:32.075-07	\N	\N	\N	*****
990	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-06-08 10:39:24.034-07	2017-09-11 09:04:32.075-07	\N	\N	\N	*****
994	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-08-03 23:04:40.337-07	2017-09-11 09:04:32.076-07	\N	\N	\N	*****
995	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-08-04 14:37:07.487-07	2017-09-11 09:04:32.076-07	\N	\N	\N	*****
996	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-08-09 05:25:12.058-07	2017-09-11 09:04:32.076-07	\N	\N	\N	*****
997	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-08-09 09:47:14.143-07	2017-09-11 09:04:32.077-07	\N	\N	\N	*****
998	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-07 12:14:48.228-07	2017-09-11 09:04:32.077-07	\N	\N	\N	*****
999	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-08 00:47:48.445-07	2017-09-11 09:04:32.077-07	\N	\N	\N	*****
1000	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-13 14:08:10.496-07	2017-09-11 09:04:32.077-07	\N	\N	\N	*****
1002	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-01-14 23:46:48.547-08	2017-09-11 09:04:32.077-07	\N	\N	\N	*****
1003	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-01-31 11:23:27.546-08	2017-09-11 09:04:32.077-07	\N	\N	\N	*****
1004	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-01-24 23:20:25.482-08	2017-09-11 09:04:32.078-07	\N	\N	\N	*****
1005	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-02-24 16:19:15.877-08	2017-09-11 09:04:32.078-07	\N	\N	\N	*****
1006	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-02-10 11:25:55.396-08	2017-09-11 09:04:32.079-07	\N	\N	\N	*****
1007	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-04-14 11:09:30.772-07	2017-09-11 09:04:32.079-07	\N	\N	\N	*****
1008	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-03-13 12:40:15.721-07	2017-09-11 09:04:32.079-07	\N	\N	\N	*****
1009	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-03-13 11:01:02.003-07	2017-09-11 09:04:32.079-07	\N	\N	\N	*****
1010	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-03-23 14:31:32.501-07	2017-09-11 09:04:32.079-07	\N	\N	\N	*****
1012	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-04-17 08:38:10.658-07	2017-09-11 09:04:32.079-07	\N	\N	\N	*****
1014	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-04-20 08:11:46.398-07	2017-09-11 09:04:32.079-07	\N	\N	\N	*****
1015	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-21 15:36:45.86-07	2017-09-11 09:04:32.08-07	\N	\N	\N	*****
1016	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-21 16:39:05.33-07	2017-09-11 09:04:32.08-07	\N	\N	\N	*****
1017	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-28 16:39:38.673-07	2017-09-11 09:04:32.08-07	\N	\N	\N	*****
1021	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-04-24 08:41:16.175-07	2017-09-11 09:04:32.08-07	\N	\N	\N	*****
1020	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-03-01 22:36:23.209-08	2017-09-11 09:04:32.08-07	\N	\N	\N	*****
1022	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-05-22 12:47:56.886-07	2017-09-11 09:04:32.08-07	\N	\N	\N	*****
979	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-01-18 10:10:35.836-08	2017-09-11 09:04:32.08-07	\N	\N	\N	*****
989	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-05-17 09:40:52.217-07	2017-09-11 09:04:32.081-07	\N	\N	\N	*****
992	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-06-30 09:08:02.669-07	2017-09-11 09:04:32.082-07	\N	\N	\N	*****
981	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-02-10 12:36:22.327-08	2017-09-11 09:04:32.073-07	\N	\N	\N	*****
991	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-06-09 10:23:07.475-07	2017-09-11 09:04:32.075-07	\N	\N	\N	*****
993	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-07-12 12:16:04.867-07	2017-09-11 09:04:32.076-07	\N	\N	\N	*****
1023	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-06-09 10:16:47.754-07	2017-09-11 09:04:32.082-07	\N	\N	848	*****
1019	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-02-17 12:25:21.395-08	2017-09-11 09:04:32.083-07	\N	\N	\N	*****
978	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-01-18 10:36:29.151-08	2017-09-11 09:04:32.084-07	\N	\N	\N	*****
980	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-01-27 14:04:28.386-08	2017-09-11 09:04:32.085-07	\N	\N	\N	*****
987	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-03-30 00:26:00.613-07	2017-09-11 09:04:32.087-07	\N	\N	\N	*****
1001	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-13 13:07:04.929-07	2017-09-11 09:04:32.095-07	\N	\N	\N	*****
1011	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-03-24 12:03:42.687-07	2017-09-11 09:04:32.095-07	\N	\N	\N	*****
983	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-03-12 20:58:40.373-08	2017-09-11 09:04:32.095-07	\N	\N	\N	*****
985	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-03-18 18:34:13.819-07	2017-09-11 09:04:32.095-07	\N	\N	\N	*****
986	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-04-18 16:31:51.161-07	2017-09-11 09:04:32.096-07	\N	\N	\N	*****
1013	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-04-19 05:15:15.421-07	2017-09-11 09:04:32.096-07	\N	\N	\N	*****
1018	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-10-26 07:49:57.413-07	2017-09-11 09:04:32.096-07	\N	\N	\N	*****
\.


                                                                                                                                                                                         4019.dat                                                                                            0000600 0004000 0002000 00000000005 13155532021 0014237 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4021.dat                                                                                            0000600 0004000 0002000 00000131127 13155532021 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        737	171	59	USD	2439	Event supplies for Leads	\N	******	Leadership Supplies	\N	3	PAID	2017-01-20 12:05:09.337-08	2017-01-21 12:30:22.616-08	2017-02-07 10:38:15.924-08	\N	paypal
57	28	2	USD	15316	Mar 7 Lightning Talks	\N	******	Lightning Talks	\N	3	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2017-03-14 10:21:29.439-07	\N	paypal
887	3	282	MXN	50616	Leadership Development	\N	******	Conference	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 05:02:11.16-08	2017-03-14 11:17:52.017-07	\N	manual
907	70	12	USD	20000	payment to artists (spoken word) for performance at IWD event	\N	******	Other WWCode Event	\N	3	PAID	2017-03-11 16:06:03.02-08	2017-03-12 11:10:39.133-07	2017-03-27 05:47:26.687-07	\N	paypal
101	3	13	USD	100	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-26 20:56:08.086-07	2016-04-26 20:56:08.086-07	2016-06-14 11:14:21.062-07	\N	manual
653	3	284	USD	6000	Meetup Fee	\N	******	Fees	\N	3	PAID	2016-12-27 10:13:06.365-08	2016-12-27 10:34:55.519-08	2016-12-27 10:35:08.976-08	\N	manual
650	3	282	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:56:16.269-08	2016-12-27 09:57:29.639-08	2016-12-27 09:57:54.703-08	\N	manual
648	3	280	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:48:20.364-08	2016-12-27 09:49:26.92-08	2016-12-27 09:49:40.165-08	\N	manual
649	3	281	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:52:26.758-08	2016-12-27 09:53:15.394-08	2016-12-27 09:54:01.244-08	\N	manual
652	3	283	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 10:10:37.485-08	2016-12-27 10:11:36.927-08	2016-12-27 10:11:52.22-08	\N	manual
651	3	10	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:58:18.741-08	2016-12-27 10:00:31.933-08	2016-12-27 10:01:07.996-08	\N	manual
654	3	59	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 10:35:56.094-08	2016-12-27 10:38:25.72-08	2016-12-27 10:38:47.561-08	\N	manual
655	3	287	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:33:09.199-08	2016-12-27 11:46:38.03-08	2016-12-27 11:46:51.448-08	\N	manual
656	3	288	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:47:27.946-08	2016-12-27 11:49:57.05-08	2016-12-27 11:50:17.29-08	\N	manual
657	3	14	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:51:59.27-08	2016-12-27 11:52:56.386-08	2016-12-27 11:53:07.813-08	\N	manual
658	3	4	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:53:23.261-08	2016-12-27 11:55:42.961-08	2016-12-28 07:44:45.209-08	\N	manual
659	3	300	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:46:39.253-08	2016-12-28 07:49:03.856-08	2016-12-28 07:49:16.715-08	\N	manual
660	3	289	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:51:51.23-08	2016-12-28 07:52:34.697-08	2016-12-28 07:53:06.333-08	\N	manual
661	3	297	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:54:27.49-08	2016-12-28 07:56:08.504-08	2016-12-28 07:56:29.497-08	\N	manual
662	3	241	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:56:55.397-08	2016-12-28 07:58:20.587-08	2016-12-28 07:58:50.601-08	\N	manual
663	3	291	CAD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:20:10.433-08	2016-12-28 08:21:39.298-08	2016-12-28 08:21:52.881-08	\N	manual
664	3	48	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:24:24.058-08	2016-12-28 08:25:18.14-08	2016-12-28 08:25:49.763-08	\N	manual
665	3	292	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:26:41.188-08	2016-12-28 08:28:01.61-08	2016-12-28 08:28:16.458-08	\N	manual
736	171	59	USD	4431	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	\N	******	Other	\N	3	PAID	2017-01-20 12:05:09.337-08	2017-01-21 12:28:40.38-08	2017-02-07 10:40:28.327-08	\N	paypal
790	171	59	USD	9050	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	\N	******	Leadership Development	\N	3	PAID	2017-02-01 14:40:18.153-08	2017-02-01 15:46:50.968-08	2017-02-07 10:40:50.169-08	\N	paypal
80	3	59	USD	10000	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-12 11:52:16.188-07	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.052-07	\N	manual
86	3	13	USD	100	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-15 10:29:50.291-07	2016-04-15 10:29:50.291-07	2016-06-14 11:14:21.055-07	\N	manual
195	3	48	USD	3418	FedEx Office	\N	\N	Leadership Supplies	\N	3	PAID	2016-01-24 16:00:00-08	2016-01-24 16:00:00-08	2016-06-14 11:14:21.118-07	\N	manual
888	69	12	USD	54783	Plaques for IWD awards ceremony​ 	\N	******	Other WWCode Event	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 07:45:43.298-08	2017-03-15 06:57:14.51-07	\N	paypal
814	142	48	USD	25700	Movie screening for "She Started It"	\N	******	Other WWCode Event	\N	3	PAID	2017-02-09 18:26:00.889-08	2017-02-10 16:22:48.586-08	2017-03-14 10:59:53.192-07	\N	paypal
74	3	14	USD	11815	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	\N	\N	Conference	\N	3	PAID	2016-04-05 12:44:01.338-07	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.046-07	\N	manual
190	3	48	USD	20000	Conference Grant - Sarah Olson	\N	\N	Scholarship	\N	3	PAID	2016-05-25 09:39:09.882-07	2016-05-25 09:39:09.882-07	2016-06-14 11:14:21.116-07	\N	manual
75	3	59	USD	6500	Reimburse Caterina for travel expenses to CONNECT 2016	\N	\N	Scholarship	\N	3	PAID	2016-04-05 12:44:01.338-07	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.047-07	\N	manual
82	3	4	USD	163	Meetup Transaction Fee	\N	\N	Transaction Fees	\N	3	REJECTED	2016-04-12 11:52:16.188-07	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.052-07	\N	manual
97	3	13	USD	100	Global Developement	\N	\N	Global Development	\N	3	REJECTED	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.06-07	\N	manual
156	3	48	USD	110000	Conference Grant - Sarah Olson	Conference Grant - Airfare/Board	\N	Scholarship	\N	3	PAID	2016-05-10 12:19:21.785-07	2016-05-10 12:19:21.785-07	2016-06-14 11:14:21.099-07	\N	manual
95	3	13	USD	125	WePay fee	Jasna	\N	Transaction Fees	\N	3	PAID	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.06-07	\N	manual
189	3	3	USD	100000	Conference Grant	Google Event - Elizabeth	\N	Scholarship	\N	3	PAID	2016-05-24 12:42:50.307-07	2016-05-24 12:42:50.307-07	2016-06-14 11:14:21.116-07	\N	manual
175	3	12	USD	120000	Conference Grant	Alicia V Carr - Conference Grant	\N	Scholarship	\N	3	PAID	2016-05-19 12:07:13.723-07	2016-05-19 12:07:13.723-07	2016-06-14 11:14:21.109-07	\N	manual
136	68	15	USD	1115	Mile High Agile outreach- supplies	\N	\N	Leadership Supplies	\N	68	PAID	2016-04-02 17:00:00-07	2016-04-02 17:00:00-07	2016-06-14 11:14:21.091-07	\N	paypal
194	3	48	USD	12700	A Small Orange	\N	\N	Other WWCode Event	\N	3	PAID	2016-02-01 16:00:00-08	2016-02-01 16:00:00-08	2016-06-14 11:14:21.119-07	\N	manual
774	31	14	USD	6100	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	\N	******	Other	\N	3	PAID	2017-01-28 06:06:40.223-08	2017-01-28 15:49:43.515-08	2017-02-22 07:27:02.688-08	\N	paypal
889	3419	516	USD	14630	Stickers	\N	******	Leadership Supplies	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 11:01:52.82-08	2017-04-07 05:58:45.571-07	\N	paypal
815	142	48	USD	33412	Wearable Clothing Workshop	\N	******	Workshop	\N	3	PAID	2017-02-09 18:26:00.889-08	2017-02-10 16:23:45.137-08	2017-03-14 11:00:11.49-07	\N	paypal
198	3	13	USD	80000	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-31 10:47:01.276-07	2016-05-31 10:47:01.276-07	2016-06-14 11:14:21.121-07	\N	manual
218	31	14	USD	5161	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	\N	\N	Leadership Development	\N	3	PAID	2016-06-06 17:21:31.531-07	2016-06-06 17:21:31.531-07	2016-06-14 11:14:21.131-07	\N	paypal
79	3	4	USD	150	Global Developement	\N	\N	Global Development	\N	3	PAID	2016-04-12 11:46:49.263-07	2016-04-12 11:46:49.263-07	2016-06-14 11:14:21.05-07	\N	manual
99	3	14	USD	2452	CONNECT 2016	Reimbursement for Sara Adineh	\N	Conference	\N	3	PAID	2016-04-25 17:00:00-07	2016-04-25 17:00:00-07	2016-06-14 11:14:21.061-07	\N	manual
104	3	48	USD	400	WePay Fee	For Andrea and Leslie donation 	\N	Transaction Fees	\N	3	PAID	2016-04-10 17:00:00-07	2016-04-10 17:00:00-07	2016-06-14 11:14:21.064-07	\N	manual
92	3	15	USD	2322	Stacey Schipper Reimbursement	April 6, 2016 Expense	\N	Other WWCode Event	\N	3	REJECTED	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.058-07	\N	paypal
164	3	10	MXN	50000	Conference Grant	Conference Grant - Elsa Balderrama	\N	Scholarship	\N	3	PAID	2016-05-16 07:49:37.27-07	2016-05-16 07:49:37.27-07	2016-06-14 11:14:21.102-07	\N	manual
188	3	13	USD	15000	Conference Grant	Grant to Udisha 	\N	Scholarship	\N	3	PAID	2016-05-24 12:42:50.307-07	2016-05-24 12:42:50.307-07	2016-06-14 11:14:21.115-07	\N	manual
193	3	48	USD	65000	Photographer: Mike Ross	 	\N	Conference	\N	3	PAID	2016-01-05 16:00:00-08	2016-01-05 16:00:00-08	2016-06-14 11:14:21.118-07	\N	manual
224	3	59	USD	9995	Reimburse Caterina Paun for Program Expenses	Gift cards and thank you notes for workshop presenters	\N	Other WWCode Event	\N	3	PAID	2016-02-24 16:00:00-08	2016-02-24 16:00:00-08	2016-06-14 11:14:21.134-07	\N	manual
81	3	4	USD	163	Meetup Donation Transaction Fee	\N	\N	Transaction Fees	\N	3	PAID	2016-04-12 11:52:16.188-07	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.051-07	\N	manual
96	3	48	USD	250	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.06-07	\N	manual
225	3	59	USD	5504	Reimburse Caterina Paun for supplies and mailing expenses	\N	\N	Leadership Supplies	\N	3	PAID	2015-12-14 16:00:00-08	2015-12-14 16:00:00-08	2016-06-14 11:14:21.135-07	\N	manual
196	3	59	USD	50000	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-10 17:00:00-07	2016-05-10 17:00:00-07	2016-06-14 11:14:21.12-07	\N	manual
775	31	14	USD	5458	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	\N	******	Other	\N	3	PAID	2017-01-28 06:06:40.223-08	2017-01-28 15:56:09.32-08	2017-02-22 07:27:45.559-08	\N	paypal
103	3	48	USD	150	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-27 09:21:00.228-07	2016-04-27 09:21:00.228-07	2016-06-14 11:14:21.063-07	\N	manual
145	3	13	USD	50000	Conference Grant	Conference Grant: Udisha	\N	Scholarship	\N	3	PAID	2016-05-04 14:14:39.136-07	2016-05-04 14:14:39.136-07	2016-06-14 11:14:21.094-07	\N	manual
227	3	59	USD	5000	Global Development	Nike Donation	\N	Global Development	\N	3	PAID	2016-02-21 16:00:00-08	2016-02-21 16:00:00-08	2016-06-14 11:14:21.135-07	\N	manual
76	3	59	USD	3798	Reimburse Caterina for program materials	\N	\N	Other WWCode Event	\N	3	PAID	2016-04-05 12:44:01.338-07	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.048-07	\N	manual
93	3	4	USD	150	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-07-08 20:52:41.064-07	\N	manual
255	31	14	USD	10294	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	\N	******	Leadership Development	\N	31	PAID	2016-07-02 17:00:00-07	2016-07-04 13:23:49.309-07	2016-08-02 06:38:06.274-07	\N	paypal
374	171	59	USD	2077	Event Food	\N	******	Hack Night	\N	3	PAID	2016-09-27 19:15:48.098-07	2016-09-27 19:46:35.645-07	2016-10-05 09:43:29.036-07	\N	paypal
293	142	48	USD	10212	STEM Toys for Coding with Kids Event	\N	******	Other WWCode Event	\N	3	PAID	2016-07-16 17:00:00-07	2016-07-20 13:35:52.294-07	2016-08-16 07:58:32.981-07	\N	paypal
192	3	48	USD	2698	Leadership Tools (director tees)	Sarah Olson	\N	Leadership Supplies	\N	3	PAID	2015-12-14 16:00:00-08	2015-12-14 16:00:00-08	2016-06-14 11:14:21.117-07	\N	manual
294	142	48	USD	8496	STEM Toys for Coding with Kids Event	\N	******	Other WWCode Event	\N	3	PAID	2016-07-16 17:00:00-07	2016-07-20 13:41:41.183-07	2016-08-16 07:58:02.246-07	\N	paypal
318	142	48	USD	1500	Coding books for our study groups (Humble Bundle -- Joy of Coding)	\N	******	Technical Study Group	\N	3	PAID	2016-08-18 05:03:51.47-07	2016-08-18 05:07:07.685-07	2016-08-19 13:58:55.155-07	\N	paypal
346	171	59	USD	3224	Event food	\N	******	Food & Beverage	\N	3	PAID	2016-09-09 09:56:27.706-07	2016-09-09 09:56:59.265-07	2016-09-13 07:57:05.808-07	\N	paypal
345	171	59	USD	2911	Event food	\N	******	Supplies & materials	\N	3	PAID	2016-09-09 09:47:46.738-07	2016-09-09 09:56:23.297-07	2016-09-15 17:09:43.894-07	\N	paypal
366	142	48	USD	4898	Two VR headsets for our AR/VR event at Best Buy.	\N	******	Supplies & materials	\N	3	PAID	2016-09-21 13:21:09.898-07	2016-09-21 13:23:17.18-07	2016-09-27 12:31:43.772-07	\N	paypal
367	142	48	USD	2500	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	\N	******	Other	\N	3	PAID	2016-09-22 08:22:21.436-07	2016-09-22 08:24:30.617-07	2016-09-27 12:33:54.695-07	\N	paypal
256	31	14	USD	749	Transportation for Sandra and Cici to get to meeting location with core team members	\N	******	Leadership Development	\N	31	PAID	2016-07-02 17:00:00-07	2016-07-04 13:25:35.824-07	2016-08-02 06:39:16.46-07	\N	paypal
197	3	59	USD	34750	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-26 12:05:53.771-07	2016-05-26 12:05:53.771-07	2016-06-14 11:14:21.121-07	\N	manual
222	3	4	USD	150	Global Development 	\N	\N	Global Development	\N	3	PAID	2016-06-09 11:38:16.857-07	2016-06-09 11:38:16.857-07	2016-06-14 11:14:21.133-07	\N	manual
307	31	14	USD	11757	Leadership team dinner - Sondry interview	\N	******	Scholarship	\N	31	PAID	2016-08-02 06:42:02.991-07	2016-08-02 06:43:29.423-07	2016-08-02 06:44:04.899-07	\N	paypal
333	142	48	USD	53720	Conference Travel	\N	******	Conference	\N	3	PAID	2016-08-26 17:03:45.469-07	2016-08-26 17:13:37.309-07	2016-11-03 14:27:23.523-07	\N	paypal
319	142	48	USD	13526	Dinner for last night's HackNight	\N	******	Hack Night	\N	3	PAID	2016-08-18 06:17:48.926-07	2016-08-18 06:19:12.087-07	2016-08-19 13:58:34.842-07	\N	paypal
375	171	59	USD	2715	Event supplies	\N	******	Leadership Supplies	\N	3	PAID	2016-09-27 19:46:42.795-07	2016-09-27 19:53:14.232-07	2016-10-05 09:44:00.917-07	\N	paypal
500	171	59	USD	2374	We Code Hackathon 2016	\N	******	Sponsorship	\N	3	PAID	2016-11-20 12:26:33.118-08	2016-11-20 12:29:20.497-08	2016-12-06 08:50:36.397-08	\N	paypal
158	3	48	USD	8320	Conference Expense	Sarah Olson	\N	Conference	\N	3	REJECTED	2016-05-10 12:19:21.785-07	2016-05-10 12:19:21.785-07	2016-06-14 11:14:21.1-07	\N	manual
178	3	3	USD	70000	Conference Grant	Sara Morsi Conference Grant	\N	Scholarship	\N	3	PAID	2016-05-19 12:07:13.723-07	2016-05-19 12:07:13.723-07	2016-06-14 11:14:21.11-07	\N	manual
378	171	59	USD	7167	Event Food	\N	******	Hack Night	\N	3	PAID	2016-09-27 19:55:23.801-07	2016-09-27 19:58:27.408-07	2016-10-05 09:44:48.383-07	\N	paypal
376	171	59	USD	2475	Marketing Materials	\N	******	Other	\N	3	PAID	2016-09-27 19:53:17.638-07	2016-09-27 19:54:27.309-07	2016-10-05 09:45:15.524-07	\N	paypal
377	171	59	USD	6471	Event Food	\N	******	Other WWCode Event	\N	3	PAID	2016-09-27 19:54:30.186-07	2016-09-27 19:55:20.669-07	2016-11-03 12:43:51.901-07	\N	paypal
372	142	48	USD	2200	Website - Domain Name	\N	******	Other	\N	3	PAID	2016-09-26 15:46:40.46-07	2016-09-26 15:48:04.38-07	2016-12-22 14:19:53.18-08	\N	paypal
395	3	15	USD	32000	90/10 split: Hackathon donation	\N	******	Global Development	\N	3	PAID	2016-07-14 17:00:00-07	2016-10-04 15:04:41.846-07	2016-10-04 15:05:23.579-07	\N	manual
389	3	12	USD	100000	90/10 split: AT&T Sponsorship (April 2015)	 	******	Global Development	\N	3	PAID	2016-10-04 08:40:50.076-07	2016-10-04 08:44:06.971-07	2016-10-04 08:44:29.326-07	\N	manual
387	3	12	USD	10000	Google I/O: Alicia Carr	\N	******	Scholarship	\N	3	PAID	2016-05-25 17:00:00-07	2016-10-04 08:31:40.439-07	2016-10-04 08:44:36.611-07	\N	manual
393	3	12	USD	500	90/10 split: Turner matching donation	\N	******	Global Development	\N	3	PAID	2016-10-04 08:52:24.157-07	2016-10-04 08:53:03.718-07	2016-10-04 09:06:02.71-07	\N	manual
391	3	12	USD	500	90/10 split: Beth Laing	\N	******	Global Development	\N	3	PAID	2016-10-04 08:50:56.293-07	2016-10-04 08:51:48.623-07	2016-10-04 09:06:11.584-07	\N	manual
392	3	12	USD	500	90/10 split: Beth Laing	\N	******	Global Development	\N	3	PAID	2016-10-04 08:50:56.293-07	2016-10-04 08:51:59.211-07	2016-10-04 09:06:17.663-07	\N	manual
390	3	12	USD	250	90/10 split: Syema Ailia	\N	******	Global Development	\N	3	PAID	2016-10-04 08:49:30.068-07	2016-10-04 08:50:45.734-07	2016-10-04 09:06:24.611-07	\N	manual
394	3	2	USD	56266	Net budget balance pre-Open Collective	\N	******	Other WWCode Event	\N	3	PAID	2016-01-14 16:00:00-08	2016-10-04 14:41:43.853-07	2016-10-04 14:57:46.063-07	\N	manual
411	3	59	USD	31950	WWCode Portland Stickers	\N	******	Leadership Supplies	\N	3	PAID	2016-10-10 13:10:50.586-07	2016-10-10 13:11:36.293-07	2016-10-10 13:12:34.385-07	\N	manual
412	3	195	USD	1000	Test	\N	******	Fees	\N	3	REJECTED	2016-10-11 09:11:05.021-07	2016-10-11 09:13:18.686-07	2016-10-11 09:17:02.494-07	\N	paypal
413	3	195	USD	1000	Test	\N	******	Fees	\N	3	PAID	2016-10-11 09:17:09.527-07	2016-10-11 09:18:10.423-07	2016-10-11 09:18:39.64-07	\N	manual
401	31	14	USD	3080	Monthly core team meeting. Beverages with dinner for six members 	\N	******	Other WWCode Event	\N	3	PAID	2016-10-04 20:13:51.147-07	2016-10-04 20:14:45.394-07	2016-10-31 10:59:54.551-07	\N	paypal
409	70	12	USD	2838	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	\N	******	Workshop	\N	3	PAID	2016-10-08 08:03:22.819-07	2016-10-08 08:11:18.293-07	2016-11-03 14:13:32.781-07	\N	paypal
400	31	14	USD	3323	Monthly team meeting w core six members. Food/pizza	\N	******	Other WWCode Event	\N	3	PAID	2016-10-04 20:12:18.236-07	2016-10-04 20:13:43.629-07	2016-10-31 14:02:17.181-07	\N	paypal
402	31	14	USD	729	Transportation to get to GeekWire Summit social event 	\N	******	Conference	\N	3	PAID	2016-10-04 20:14:49.674-07	2016-10-04 20:17:22.898-07	2016-11-01 09:16:03.421-07	\N	paypal
396	3	272	USD	25000	DIANA A. SCHOLARSHIP GOOGLE I/O	\N	******	Conference	\N	3	PAID	2016-10-04 15:22:45.384-07	2016-10-04 15:23:45.863-07	2016-11-21 14:59:44.22-08	\N	manual
417	1371	300	USD	48435	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	\N	******	Hackathon	\N	3	PAID	2016-10-12 12:47:17.894-07	2016-10-12 12:50:24.464-07	2016-10-31 14:08:49.808-07	\N	paypal
416	1371	300	USD	51962	500 gift cards, 19.62 printed awards	\N	******	Hackathon	\N	3	PAID	2016-10-12 12:45:46.133-07	2016-10-12 12:47:13.682-07	2016-10-31 14:09:12.082-07	\N	paypal
415	1371	300	USD	70000	pre payment for dinner catering	\N	******	Hackathon	\N	3	APPROVED	2016-10-12 12:44:25.684-07	2016-10-12 12:45:38.031-07	2016-10-27 14:05:29.785-07	2016-11-02 17:00:00-07	paypal
418	1371	300	USD	64978	lunch ordered at Costco	\N	******	Hackathon	\N	3	PAID	2016-10-12 12:50:37.851-07	2016-10-12 12:52:06.282-07	2016-10-28 14:31:00.087-07	\N	paypal
427	31	14	USD	1305	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	\N	******	Workshop	\N	3	PAID	2016-10-15 15:59:26.409-07	2016-10-15 16:01:05.534-07	2016-10-31 10:52:13.785-07	\N	paypal
420	32	14	USD	2700	WWCode Seattle planning lunch with Sara	\N	******	Other	\N	3	PAID	2016-10-13 10:26:11.421-07	2016-10-13 10:30:27.473-07	2016-10-31 10:52:45.81-07	\N	paypal
419	171	59	USD	1446	Food for JavaScript Study Night - Oct. 11th	\N	******	Study Group	\N	3	PAID	2016-10-12 13:24:40.763-07	2016-10-12 13:48:15.148-07	2016-10-31 11:19:13.146-07	\N	paypal
453	28	2	USD	35000	DJ (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 21:34:19.335-07	2016-10-25 21:34:51.547-07	2016-10-27 14:08:49.13-07	\N	paypal
450	28	2	USD	6497	September Ruby Tuesday	\N	******	Study Group	\N	3	PAID	2016-10-25 20:53:42.508-07	2016-10-25 20:54:47.132-07	2016-10-31 14:11:37.246-07	\N	paypal
452	28	2	USD	26800	May AI Workshop	\N	******	Workshop	\N	3	PAID	2016-10-25 21:06:16.475-07	2016-10-25 21:07:27.314-07	2016-10-31 14:10:54.78-07	\N	paypal
447	28	2	USD	5518	Drinks for Happy Hour (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:40:29.898-07	2016-10-25 17:41:14.743-07	2016-10-31 14:13:40.764-07	\N	paypal
451	28	2	USD	20568	June South Hack Night	\N	******	Hack Night	\N	3	PAID	2016-10-25 20:57:37.783-07	2016-10-25 20:59:03.214-07	2016-10-31 14:11:21.759-07	\N	paypal
449	28	2	USD	75932	Drinks and snacks (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 20:43:46.209-07	2016-10-25 20:50:39.086-07	2016-10-31 14:13:06.494-07	\N	paypal
448	28	2	USD	2108	Markers, pens, sticky notes (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:41:19.411-07	2016-10-25 17:42:15.042-07	2016-10-31 14:13:20.6-07	\N	paypal
446	28	2	USD	1192	Almond milk for coffee (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:39:05.875-07	2016-10-25 17:40:23.911-07	2016-10-31 14:13:54.099-07	\N	paypal
445	28	2	USD	1136	Painters tape for signs  	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:18:03.746-07	2016-10-25 17:39:01.083-07	2016-10-31 14:14:52.301-07	\N	paypal
470	1379	301	EUR	1019	Leadership Event in Sofia	\N	******	Other WWCode Event	\N	3	PAID	2016-11-09 12:01:53.197-08	2016-11-09 12:15:40.819-08	2016-12-07 13:30:48.755-08	\N	paypal
414	1371	300	USD	76800	second half of dinner catering	\N	******	Hackathon	\N	3	APPROVED	2016-10-12 12:28:23.372-07	2016-10-12 12:44:15.333-07	2016-10-27 14:07:24.861-07	2016-11-02 17:00:00-07	paypal
467	28	2	USD	339421	Food (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-11-02 15:10:25.089-07	2016-11-02 15:11:15.724-07	2016-11-21 07:23:08.924-08	\N	manual
464	3	14	USD	60000	Matthews Group - Leadership Development for Seattle team	Paid via PayPal	******	Leadership Development	\N	3	PAID	2016-10-31 15:03:17.783-07	2016-10-31 15:05:08.929-07	2016-11-29 13:46:31.974-08	\N	manual
466	28	2	USD	119954	Food (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-11-02 15:08:55.076-07	2016-11-02 15:10:20.431-07	2016-11-18 13:01:44.79-08	\N	paypal
494	1378	301	EUR	4728	European Leadership Development Workshop -- Transportation, Flight	\N	******	Leadership Development	\N	3	PAID	2016-09-30 17:00:00-07	2016-11-19 05:21:57.651-08	2016-11-22 14:07:58.565-08	\N	manual
498	171	59	USD	4874	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:18:30.305-08	2016-11-20 12:20:36.467-08	2016-11-22 13:55:11.103-08	\N	paypal
493	1378	301	EUR	4400	European Leadership Development Workshop -- Transportation, Taxi	\N	******	Leadership Development	\N	3	PAID	2016-10-26 17:00:00-07	2016-11-19 05:13:48.078-08	2016-11-22 14:07:41.878-08	\N	manual
471	1379	301	EUR	6444	Leadership Event in Sofia	\N	******	Other WWCode Event	\N	3	PAID	2016-11-09 12:15:46.133-08	2016-11-09 12:16:50.117-08	2016-12-07 13:38:07.749-08	\N	paypal
483	1325	273	USD	4351	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	\N	******	Hack Night	\N	3	PAID	2016-08-31 17:00:00-07	2016-11-16 16:12:31.06-08	2016-12-06 09:58:42.358-08	\N	manual
484	1325	273	USD	7773	Food for October Hack Night.	\N	******	Hack Night	\N	3	PAID	2016-10-05 17:00:00-07	2016-11-16 16:29:48.238-08	2016-12-06 09:56:13.801-08	\N	manual
501	171	59	USD	1700	Thank you gift to an amazing sponsor!	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:29:28.692-08	2016-11-20 12:34:51.872-08	2016-11-22 04:31:01.064-08	\N	paypal
499	171	59	USD	8181	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:20:40.018-08	2016-11-20 12:26:02.323-08	2016-11-22 13:54:34.067-08	\N	paypal
506	1333	278	GBP	6000	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	\N	******	Leadership Development	\N	3	PAID	2016-09-10 17:00:00-07	2016-11-22 12:36:49.712-08	2016-11-29 13:17:33.829-08	\N	manual
502	171	59	USD	1082	Marketing for IoT Hackathon	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:36:16.598-08	2016-11-20 12:36:41.928-08	2016-12-06 08:50:57.444-08	\N	paypal
508	171	59	USD	3918	Supplies	\N	******	Hackathon	\N	3	PAID	2016-11-22 16:39:47.569-08	2016-11-22 17:16:59.692-08	2016-12-06 08:51:21.271-08	\N	paypal
509	171	59	USD	2698	T-shirt order - Design Lead	\N	******	Leadership Supplies	\N	3	PAID	2016-11-22 17:17:03.111-08	2016-11-22 17:18:21.842-08	2016-12-06 08:51:55.906-08	\N	paypal
507	1333	278	GBP	4000	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	\N	******	Leadership Development	\N	3	PAID	2016-10-01 17:00:00-07	2016-11-22 12:39:49.327-08	2016-11-29 13:17:22.193-08	\N	manual
474	31	14	USD	227646	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	\N	******	Leadership Development	\N	3	PAID	2016-11-15 07:52:03.936-08	2016-11-15 07:54:05.532-08	2016-11-29 13:46:42.977-08	\N	manual
639	3	273	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:49:03.664-08	2016-12-27 08:49:52.742-08	2016-12-27 08:50:06.731-08	\N	manual
573	171	59	USD	1058	Goodie Bags	\N	******	Hackathon	\N	3	PAID	2016-12-06 19:01:09.941-08	2016-12-06 19:01:33.246-08	2016-12-07 12:49:56.687-08	\N	paypal
485	1325	273	USD	1106	October Hack Night Drinks/Food.	\N	******	Hack Night	\N	3	PAID	2016-10-05 17:00:00-07	2016-11-16 16:45:56.588-08	2016-12-06 09:58:10.939-08	\N	manual
486	1325	273	USD	4444	Food/Drinks for Anniversary Reception with guest WWCode Directors!	\N	******	Other WWCode Event	\N	3	PAID	2016-10-27 17:00:00-07	2016-11-16 17:08:09.48-08	2016-11-22 14:21:43.596-08	\N	manual
492	1325	273	USD	713	Food for Anniversary Reception	\N	******	Other WWCode Event	\N	3	PAID	2016-10-27 17:00:00-07	2016-11-17 12:36:37.444-08	2016-12-06 09:55:40.485-08	\N	manual
591	142	48	USD	30496	3D Printer & Supplies	\N	******	Hack Night	\N	3	PAID	2016-12-13 10:22:16.435-08	2016-12-13 12:33:52.789-08	2016-12-14 05:03:22.881-08	\N	paypal
602	142	48	USD	9240	Leadership - Planning for 2017 - Dinner	\N	******	Leadership Development	\N	3	PAID	2016-12-18 13:03:11.586-08	2016-12-18 13:03:54.509-08	2016-12-19 10:45:09.955-08	\N	paypal
604	142	48	USD	20397	Robotics: Coding with Your Kids HackNight Supplies	\N	******	Hack Night	\N	3	PAID	2016-12-18 13:04:48.665-08	2016-12-18 13:05:52.891-08	2016-12-19 08:20:41.101-08	\N	paypal
601	142	48	USD	1175	Leadership - Planning for 2017 - Afternoon Coffee	\N	******	Leadership Development	\N	3	PAID	2016-12-18 12:54:41.356-08	2016-12-18 13:03:08.099-08	2016-12-19 10:42:59.885-08	\N	paypal
613	3	260	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:32:39.612-08	2016-12-23 08:35:32.89-08	2016-12-23 08:37:59.658-08	\N	manual
603	142	48	USD	875	Leadership - Planning for 2017 - Evening Coffee	\N	******	Leadership Development	\N	3	PAID	2016-12-18 13:03:57.719-08	2016-12-18 13:04:44.175-08	2016-12-19 10:43:54.758-08	\N	paypal
605	1374	300	USD	46419	Mugs for WWCode-SV	\N	******	Global Development	\N	3	PAID	2016-12-19 14:19:05.439-08	2016-12-19 14:20:00.599-08	2016-12-20 10:57:28.737-08	\N	paypal
607	3	2	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-21 10:50:58.117-08	2016-12-21 10:53:15.213-08	2016-12-21 10:53:47.768-08	\N	manual
608	3	3	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-21 10:51:15.967-08	2016-12-21 10:54:08.982-08	2016-12-21 10:54:31.514-08	\N	manual
619	3	265	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:06:10.893-08	2016-12-23 09:09:46.554-08	2016-12-23 09:10:35.083-08	\N	manual
614	3	261	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:45:31.739-08	2016-12-23 08:48:42.88-08	2016-12-23 08:49:17.798-08	\N	manual
617	3	263	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:58:06.292-08	2016-12-23 09:00:11.888-08	2016-12-23 09:00:26.307-08	\N	manual
615	3	12	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:51:12.278-08	2016-12-23 08:52:04.132-08	2016-12-23 08:52:23.784-08	\N	manual
616	3	262	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:52:52.588-08	2016-12-23 08:55:02.457-08	2016-12-23 08:56:04.914-08	\N	manual
618	3	264	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:03:12.871-08	2016-12-23 09:05:23.588-08	2016-12-23 09:05:42.262-08	\N	manual
621	3	259	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:20:24.371-08	2016-12-23 09:21:36.713-08	2016-12-23 09:21:53.364-08	\N	manual
620	3	301	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:13:56.172-08	2016-12-23 09:14:45.703-08	2016-12-23 09:15:16.44-08	\N	manual
622	3	195	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:26:09.212-08	2016-12-23 09:32:25.111-08	2016-12-23 09:32:56.293-08	\N	manual
623	3	266	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:41:23.136-08	2016-12-23 09:42:05.736-08	2016-12-23 09:42:19.013-08	\N	manual
624	3	267	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:43:55.758-08	2016-12-23 09:58:18.148-08	2016-12-23 10:04:06.163-08	\N	manual
626	3	268	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:36:30.003-08	2016-12-23 11:38:32.584-08	2016-12-23 11:38:47.127-08	\N	manual
644	3	279	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:25:07.236-08	2016-12-27 09:26:20.227-08	2016-12-27 09:27:10.046-08	\N	manual
627	3	269	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:39:34.326-08	2016-12-23 11:41:36.646-08	2016-12-23 11:41:48.635-08	\N	manual
628	3	270	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:47:22.609-08	2016-12-23 11:49:40.181-08	2016-12-23 11:50:08.905-08	\N	manual
632	3	299	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:10:47.262-08	2016-12-27 08:12:04.183-08	2016-12-27 08:12:26.594-08	\N	manual
633	3	271	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:13:47.179-08	2016-12-27 08:15:24.708-08	2016-12-27 08:16:27.404-08	\N	manual
640	3	274	USD	6000	Meetup Fee	\N	******	Fees	\N	3	PAID	2016-12-27 08:51:06.223-08	2016-12-27 08:52:25.022-08	2016-12-27 08:52:46.541-08	\N	manual
634	3	13	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:22:16.78-08	2016-12-27 08:23:20.484-08	2016-12-27 08:23:36.529-08	\N	manual
636	3	15	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:30:20.153-08	2016-12-27 08:31:33.602-08	2016-12-27 08:31:59.233-08	\N	manual
637	3	298	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:35:19.064-08	2016-12-27 08:35:50.321-08	2016-12-27 08:36:05.685-08	\N	manual
641	3	275	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:54:08.966-08	2016-12-27 08:54:50.244-08	2016-12-27 08:55:07.749-08	\N	manual
638	3	272	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:39:04.447-08	2016-12-27 08:41:02.05-08	2016-12-27 08:41:27.62-08	\N	manual
642	3	276	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:58:36.204-08	2016-12-27 08:59:15.911-08	2016-12-27 08:59:34.226-08	\N	manual
647	3	278	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:28:20.017-08	2016-12-27 09:33:16.816-08	2016-12-27 09:34:46.927-08	\N	manual
643	3	277	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:02:39.037-08	2016-12-27 09:03:12.312-08	2016-12-27 09:03:23.471-08	\N	manual
666	3	293	CAD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:28:38.36-08	2016-12-28 08:30:00.14-08	2016-12-28 08:30:16.798-08	\N	manual
667	3	294	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:30:41.349-08	2016-12-28 08:32:05.407-08	2016-12-28 08:32:19.79-08	\N	manual
62	31	14	USD	1000	Nike Dinner	Ride home after Nike dinner. Shared ride with Sara Adineh. 	******	Conference	\N	31	PAID	2016-03-17 17:00:00-07	2016-03-17 17:00:00-07	2016-06-14 11:14:21.031-07	\N	paypal
72	32	14	USD	6800	Connect 2016 event setup day dinner	\N	******	Conference	\N	32	PAID	2016-03-17 17:00:00-07	2016-03-17 17:00:00-07	2016-06-14 11:14:21.044-07	\N	paypal
635	3	47	INR	6000	Meetup Fees	\N	******	Fees	\N	141	APPROVED	2016-12-27 08:24:45.938-08	2016-12-27 08:25:59.379-08	2017-01-11 02:50:47.014-08	\N	manual
724	142	48	USD	2093	Drinks (La Croix water) for Jan HackNight	\N	******	Hack Night	\N	3	PAID	2017-01-15 16:34:19.312-08	2017-01-16 12:30:30.683-08	2017-01-25 10:41:34.763-08	\N	paypal
725	142	48	USD	22137	Amazon Echo Dot devices for HackNight and first book for our book club.	\N	******	Hack Night	\N	3	PAID	2017-01-15 16:34:19.312-08	2017-01-16 12:32:05.491-08	2017-01-25 10:44:34.015-08	\N	paypal
743	70	12	USD	30000	travel to NY for bell ringing at NYSE	\N	******	Other WWCode Event	\N	3	PAID	2017-01-23 13:57:02.837-08	2017-01-23 18:35:07.349-08	2017-01-25 10:20:55.157-08	\N	paypal
167	31	14	USD	2948	Connect Conference video footage review	Date is 4/28/2016	******	Conference	\N	31	PAID	2016-05-16 17:31:54.682-07	2016-05-16 17:31:54.682-07	2016-06-14 11:14:21.103-07	\N	paypal
768	3	278	GBP	40970	Travel Scholarship for WWCode Director	\N	******	Leadership Development	\N	3	PAID	2017-01-26 15:23:43.983-08	2017-01-27 07:34:47.447-08	2017-04-17 15:32:02.795-07	\N	manual
46	68	15	USD	14000	Food for March Boulder, CO event	\N	******	Other WWCode Event	\N	68	PAID	2016-03-17 11:48:54.413-07	2016-03-17 11:48:54.413-07	2016-06-14 11:14:21.021-07	\N	paypal
53	28	2	USD	10284	Feb 4 hack night	\N	******	Hack Night	\N	28	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.026-07	\N	paypal
55	28	2	USD	4951	Mar 3 hack night	\N	******	Hack Night	\N	28	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.026-07	\N	paypal
785	3	47	INR	6000	Meetup Fees	\N	******	Leadership Development	\N	3	REJECTED	2017-01-30 15:17:44.823-08	2017-01-31 08:46:45.519-08	2017-02-14 13:17:53.548-08	\N	manual
497	171	59	USD	1798	Domain name for hackathon and study night projects	\N	******	Fees	\N	3	PAID	2016-11-20 12:00:51.642-08	2016-11-20 12:06:26.088-08	2017-02-20 12:53:02.93-08	\N	paypal
56	28	2	USD	22568	Feb 1, Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.027-07	\N	paypal
137	68	15	USD	14100	WWC Boulder- April event's food	\N	******	Other WWCode Event	\N	3	PAID	2016-04-06 17:00:00-07	2016-04-06 17:00:00-07	2016-06-14 11:14:21.09-07	\N	paypal
138	68	15	USD	7000	WWC Stickers	\N	******	Network supplies	\N	68	REJECTED	2016-03-17 17:00:00-07	2016-03-17 17:00:00-07	2016-06-14 11:14:21.091-07	\N	paypal
184	28	2	USD	8979	May 2 Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.113-07	\N	paypal
183	28	2	USD	13315	April 4 Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.113-07	\N	paypal
180	28	2	USD	5037	April 7 South Hack Night	\N	******	Hack Night	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.112-07	\N	paypal
181	28	2	USD	5325	May 5 South Hack Night	\N	******	Hack Night	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.112-07	\N	paypal
147	32	14	USD	14000	Quarterly planning meeting	\N	******	Leadership Development	\N	32	PAID	2016-05-05 17:18:43.265-07	2016-05-05 17:18:43.265-07	2016-06-14 11:14:21.095-07	\N	paypal
211	28	2	USD	20000	6/2/16 Fireside Chat at Orange Coworking	\N	******	Fireside Chat	\N	3	PAID	2016-06-04 14:37:03.991-07	2016-06-04 14:37:03.991-07	2016-06-14 11:14:21.127-07	\N	paypal
186	28	2	USD	30000	05-21-16 AI workshop	\N	******	Workshop	\N	3	PAID	2016-05-22 17:26:36.061-07	2016-05-22 17:26:36.061-07	2016-10-31 14:16:10.268-07	\N	paypal
213	28	2	USD	2400	3/30/16 Python Gameathon prize - Udemy course	\N	******	Hackathon	\N	3	PAID	2016-06-04 14:37:03.991-07	2016-06-04 14:37:03.991-07	2016-06-14 11:14:21.128-07	\N	paypal
48	68	15	USD	7800	Order for stickers of our official WWC Boulder/Denver chapter logo	We'll include these at our booth at the Mile High Agile conference in two weeks.	******	Leadership Supplies	\N	3	PAID	2016-03-17 20:23:34.628-07	2016-03-17 20:23:34.628-07	2016-11-03 12:45:25.209-07	\N	paypal
59	31	14	USD	4656	WwConnect planning meeting	Seattle team ordered in an evening meal to continue planning meeting	******	Conference	\N	31	PAID	2016-03-10 16:00:00-08	2016-03-10 16:00:00-08	2016-06-14 11:14:21.029-07	\N	paypal
60	31	14	USD	2519	WwConnect Planning Meeting	Two bottles of beverage for the Seattle team to have dinner brought in while working	******	Conference	\N	31	PAID	2016-03-10 16:00:00-08	2016-03-10 16:00:00-08	2016-06-14 11:14:21.03-07	\N	paypal
61	31	14	USD	709	WwConnect Conference Set Up Day 1	Cab ride to get on location	******	Conference	\N	31	PAID	2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	2016-06-14 11:14:21.03-07	\N	paypal
64	31	14	USD	1025	WwConnect2016	Coffee for team. Day2	******	Conference	\N	31	PAID	2016-03-19 17:00:00-07	2016-03-19 17:00:00-07	2016-06-14 11:14:21.032-07	\N	paypal
34	7	10	MXN	166080	IVA Libretas Hackathon	Impuesto por la factura para las libretas	******	Hackathon	\N	3	REJECTED	2016-02-16 10:58:04.663-08	2016-02-16 10:58:04.663-08	2016-08-16 08:05:09.996-07	\N	paypal
63	31	14	USD	658	WwConnect Conference	Morning coffee day 2	******	Conference	\N	31	PAID	2016-03-19 17:00:00-07	2016-03-19 17:00:00-07	2016-06-14 11:14:21.032-07	\N	paypal
33	7	10	MXN	1038000	Libretas Hackathon	Pago entero para libretas de Hack for Equality	******	Hackathon	\N	3	REJECTED	2016-02-16 10:56:17.216-08	2016-02-16 10:56:17.216-08	2016-08-16 08:05:15.471-07	\N	paypal
776	31	14	USD	59040	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	\N	******	Other WWCode Event	\N	3	PAID	2017-01-28 06:06:40.223-08	2017-01-28 15:59:18.982-08	2017-02-07 10:32:49.378-08	\N	paypal
820	28	2	USD	10680	February Lightning Talks food	\N	******	Lightning Talks	\N	3	PAID	2017-02-11 19:22:39.341-08	2017-02-12 19:04:37.319-08	2017-03-14 10:17:54.1-07	\N	paypal
899	70	12	USD	20950	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	\N	******	Other WWCode Event	\N	3	PAID	2017-03-08 20:15:52.943-08	2017-03-08 21:17:56.148-08	2017-03-14 10:22:10.775-07	\N	paypal
900	70	12	USD	9732	IWD event -- wine for event	\N	******	Other WWCode Event	\N	3	PAID	2017-03-08 20:15:52.943-08	2017-03-08 21:20:17.878-08	2017-03-14 10:22:31.507-07	\N	paypal
858	171	59	USD	5798	Supplies for Agile workshop (2/26)	\N	******	Workshop	\N	3	PAID	2017-02-25 13:41:40.394-08	2017-02-26 13:29:05.754-08	2017-03-14 11:16:43.254-07	\N	paypal
886	3	511	MXN	14915	Leadership Development	\N	******	Conference	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 04:57:52.472-08	2017-03-14 11:18:46.39-07	\N	manual
924	1332	277	USD	100000	To redeem travel stipend to Google I/O	\N	******	Conference	\N	3	PAID	2017-03-16 13:16:54.952-07	2017-03-16 18:25:25.526-07	2017-03-20 08:39:23.558-07	\N	paypal
926	1333	278	GBP	85000	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	\N	******	Scholarship	\N	3	PAID	2017-03-16 13:16:54.952-07	2017-03-16 23:43:54.949-07	2017-03-27 09:01:27.361-07	\N	paypal
935	1331	277	USD	100000	To redeem travel stipend to Google I/O	\N	******	Conference	\N	3	PAID	2017-03-20 12:19:06.997-07	2017-03-20 17:17:43.895-07	2017-03-27 10:54:16.852-07	\N	paypal
952	69	12	USD	50000	Google I/O	\N	******	Conference	\N	3	PAID	2017-03-26 09:01:07.917-07	2017-03-27 06:44:34.926-07	2017-03-27 10:11:39.352-07	\N	paypal
949	69	12	USD	37500	Google I/O ticket	\N	******	Conference	\N	3	PAID	2017-03-25 06:46:14.921-07	2017-03-25 08:06:03.662-07	2017-03-27 10:12:00.205-07	\N	paypal
965	1344	286	USD	37500	Google I/O Ticket  2017	\N	******	Leadership Development	\N	1344	APPROVED	2017-03-29 10:01:30.368-07	2017-03-29 13:36:36.032-07	2017-03-31 06:27:39.284-07	\N	paypal
966	171	59	USD	3405	Snacks for Unity 101 workshop.	\N	******	Workshop	\N	171	APPROVED	2017-03-29 10:01:30.368-07	2017-03-29 19:17:35.707-07	2017-03-29 19:19:03.184-07	\N	manual
967	171	59	USD	2085	Small thank you gifts for workshop instructors,	\N	******	Workshop	\N	171	APPROVED	2017-03-29 10:01:30.368-07	2017-03-29 19:21:03.723-07	2017-03-29 19:21:29.532-07	\N	manual
962	1344	286	USD	100000	Travel stipend to attend the Google I/O 2017 Conference.	\N	******	Conference	\N	3	PAID	2017-03-28 09:31:20.932-07	2017-03-29 09:18:26.633-07	2017-03-31 15:33:59.762-07	\N	paypal
974	3	286	USD	20000	Leadership Development: Conference Support: Karina M. 	\N	******	Conference	\N	1344	APPROVED	2017-03-31 10:33:05.687-07	2017-03-31 15:54:08.585-07	2017-03-31 18:11:20.009-07	\N	manual
988	3	295	USD	6000	Meetup Fees	\N	******	Leadership Development	\N	3	PAID	2017-04-05 07:08:17.838-07	2017-04-05 07:18:18.821-07	2017-04-05 07:19:21.382-07	\N	manual
998	3	12	USD	235699	Atlanta IWD Event	\N	******	Other WWCode Event	\N	3	PAID	2017-04-07 07:53:35.266-07	2017-04-07 13:27:41.491-07	2017-04-17 12:17:23.077-07	\N	manual
1001	171	59	USD	2891	Hackathon 2017 planning meeting	\N	******	Hackathon	\N	3	PAID	2017-04-09 08:46:01.525-07	2017-04-09 15:04:51.227-07	2017-04-11 12:15:09.869-07	\N	paypal
1002	171	59	USD	1527	Event supplies	\N	******	Leadership Supplies	\N	3	PAID	2017-04-09 08:46:01.525-07	2017-04-09 15:37:03.724-07	2017-04-11 12:13:28.739-07	\N	paypal
1016	1333	278	GBP	85000	WWCode CONNECT Conference Travel Stipend	\N	******	Conference	\N	3	PAID	2017-04-11 14:35:01.731-07	2017-04-12 07:42:51.103-07	2017-04-17 14:18:35.71-07	\N	paypal
1003	171	59	USD	3306	Event supplies	\N	******	Leadership Supplies	\N	171	APPROVED	2017-04-09 08:33:04.72-07	2017-04-09 15:37:53.717-07	2017-04-09 15:38:34.586-07	\N	manual
1007	142	48	USD	11948	Business cards and stickers	\N	******	Leadership Supplies	\N	3	PAID	2017-04-10 09:14:55.686-07	2017-04-10 14:31:17.015-07	2017-05-16 15:00:30.445-07	\N	manual
1027	3	270	USD	100000	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	\N	******	Other WWCode Event	\N	3	PAID	2017-04-17 12:15:50.71-07	2017-04-17 15:11:05.461-07	2017-04-17 15:12:23.057-07	\N	manual
1028	3	430	USD	100000	Google I/O Travel Grant: Yelyzaveta\tL.	Reimbursed via Western Union	******	Conference	\N	3	APPROVED	2017-04-17 12:15:52.793-07	2017-04-17 15:41:52.852-07	2017-04-17 15:42:06.121-07	2017-05-04 17:00:00-07	manual
1054	171	59	USD	2390	Planning meetings - Unity + VR workshops	\N	******	Workshop	\N	171	APPROVED	2017-04-24 15:33:05.343-07	2017-04-24 19:53:38.096-07	2017-04-24 20:08:41.521-07	\N	manual
1056	171	59	USD	33534	Hotel - Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-04-24 15:31:39.131-07	2017-04-24 19:55:35.127-07	2017-04-24 20:08:38.705-07	\N	manual
1055	171	59	USD	13896	Flights for Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-04-24 15:31:39.131-07	2017-04-24 19:54:40.938-07	2017-04-24 20:08:40.259-07	\N	manual
1084	142	48	USD	1554	Snacks and batteries for our robots	\N	******	Hack Night	\N	3	PAID	2017-04-18 17:00:00-07	2017-05-02 11:26:59.045-07	2017-05-16 15:00:04.484-07	\N	manual
1070	171	59	USD	1785	Tech Summit Lunch	\N	******	Conference	\N	171	APPROVED	2017-04-28 16:37:09.548-07	2017-04-29 14:42:39.653-07	2017-04-29 14:42:52.753-07	\N	manual
1093	171	59	USD	6513	Transportation - Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-05-02 17:47:33.174-07	2017-05-03 13:05:13.476-07	2017-05-03 13:15:30.301-07	\N	manual
1099	3	430	USD	101200	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	\N	******	Scholarship	\N	3	PAID	2017-05-03 18:36:17.701-07	2017-05-04 12:05:15.03-07	2017-05-04 12:06:09.066-07	\N	manual
1085	142	48	USD	9777	Supplies for decorating our robots	\N	******	Hack Night	\N	3	PAID	2017-04-18 17:00:00-07	2017-05-02 11:28:49.091-07	2017-05-16 15:00:15.589-07	\N	manual
1086	142	48	USD	2989	Leadership meeting	\N	******	Leadership Development	\N	3	PAID	2017-04-21 17:00:00-07	2017-05-02 11:29:43.581-07	2017-05-16 14:59:48.244-07	\N	manual
1088	142	48	USD	100000	Google I/O Travel Stipend	\N	******	Conference	\N	3	PAID	2017-03-14 17:00:00-07	2017-05-02 11:34:08.158-07	2017-05-16 15:00:40.397-07	\N	manual
1092	171	59	USD	1950	Transportation - Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-05-02 18:02:09.827-07	2017-05-03 12:52:47.919-07	2017-05-03 13:15:31.455-07	\N	manual
1137	171	59	USD	2680	Nametags	\N	******	Leadership Supplies	\N	171	APPROVED	2017-05-16 12:37:26.124-07	2017-05-16 15:26:29.898-07	2017-05-16 15:30:08.546-07	\N	paypal
1120	1378	301	EUR	2700	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	1378	PENDING	2017-05-08 17:00:00-07	2017-05-10 13:08:43.707-07	2017-05-10 13:08:43.707-07	\N	paypal
1121	1378	301	EUR	2505	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	1378	PENDING	2017-05-08 17:00:00-07	2017-05-10 13:09:17.149-07	2017-05-10 13:09:17.149-07	\N	paypal
1119	32	14	USD	11500	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	\N	******	Other	\N	3	PAID	2017-05-10 03:03:37.039-07	2017-05-10 10:19:29.682-07	2017-05-16 14:55:26.77-07	\N	manual
1138	171	59	USD	3450	Color printing - flyers and signage for events. 	\N	******	Other	\N	171	APPROVED	2017-05-16 12:37:26.124-07	2017-05-16 15:41:15.044-07	2017-05-16 15:42:18.673-07	\N	paypal
1122	1378	301	EUR	19398	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	3	PAID	2017-05-09 22:18:16.903-07	2017-05-10 13:10:54.588-07	2017-05-16 14:49:07.922-07	\N	manual
1123	3206	12	USD	500000	Deposit- We Rise Conference Hosting Location	\N	******	Conference	\N	3	PAID	2017-05-09 22:18:16.903-07	2017-05-10 18:32:36.838-07	2017-05-16 14:51:10.633-07	\N	manual
1143	32	14	USD	19017	Intro to Docker workshop food for attendees	\N	******	Workshop	\N	32	PENDING	2017-05-18 13:25:06.712-07	2017-05-18 21:24:00.964-07	2017-05-18 21:24:00.964-07	\N	paypal
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                         4025.dat                                                                                            0000600 0004000 0002000 00000050545 13155532021 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2016-01-08 16:22:34.641-08	2016-01-08 16:22:34.64-08	\N	3	10	HOST	27	\N	848	\N
2016-09-09 20:42:51.435-07	2016-09-09 20:42:51.435-07	\N	1158	241	BACKER	1471	\N	806	142
2016-02-02 08:36:39.043-08	2016-02-02 08:36:39.043-08	\N	30	14	BACKER	101	\N	691	71
2016-09-22 18:07:10.698-07	2016-09-22 18:07:10.698-07	\N	1263	59	BACKER	1568	\N	752	115
2016-01-29 14:23:53.527-08	2016-01-29 14:23:53.527-08	\N	30	12	BACKER	87	\N	691	158
2016-06-21 09:02:55.799-07	2016-06-21 09:02:55.799-07	\N	642	12	BACKER	841	\N	768	158
2016-08-03 10:47:17.3-07	2016-08-03 10:47:17.3-07	\N	896	4	BACKER	1147	\N	784	179
2016-01-18 15:54:06.501-08	2016-01-18 15:54:06.501-08	\N	2	10	BACKER	61	\N	688	166
2016-05-03 06:07:28-07	2016-05-03 06:07:28-07	\N	308	2	BACKER	437	\N	745	199
2016-02-02 08:52:02.312-08	2016-02-02 08:52:02.312-08	\N	80	10	BACKER	102	\N	775	166
2016-04-28 08:01:17.535-07	2016-04-28 08:01:17.535-07	\N	283	13	BACKER	407	\N	719	185
2016-04-29 06:51:18.812-07	2016-04-29 06:51:18.812-07	\N	303	13	BACKER	425	\N	735	185
2016-06-06 17:53:47.104-07	2016-06-06 17:53:47.104-07	\N	555	13	BACKER	708	\N	801	185
2016-03-01 20:42:00.064-08	2016-03-01 20:42:00.064-08	\N	126	13	BACKER	169	\N	839	186
2016-08-01 08:54:14.068-07	2016-08-01 08:54:14.068-07	\N	883	2	BACKER	1130	\N	704	199
2016-02-18 11:54:08.738-08	2016-02-18 11:54:08.738-08	\N	108	2	BACKER	138	\N	730	199
2016-09-12 21:15:05.534-07	2016-09-12 21:15:05.534-07	\N	1178	2	BACKER	1494	\N	755	199
2016-06-06 12:04:36.955-07	2016-06-06 12:04:36.955-07	\N	551	2	BACKER	702	\N	762	199
2016-08-01 08:55:26.732-07	2016-08-01 08:55:26.732-07	\N	884	2	BACKER	1131	\N	793	199
2016-05-23 13:27:28.294-07	2016-05-23 13:27:28.294-07	\N	426	2	BACKER	573	\N	802	199
2016-06-22 13:09:46.034-07	2016-06-22 13:09:46.034-07	\N	646	2	BACKER	846	\N	772	199
2016-05-19 12:24:42.921-07	2016-05-19 12:24:42.921-07	\N	392	2	BACKER	533	\N	825	199
2015-05-02 17:00:00-07	\N	\N	28	2	ADMIN	5	\N	694	\N
2016-06-09 17:00:00-07	\N	\N	577	4	ADMIN	738	\N	695	\N
2016-09-29 11:10:43.419-07	2016-09-29 11:10:43.419-07	\N	1331	277	ADMIN	1666	\N	696	\N
2016-09-29 11:06:00.979-07	2016-09-29 11:06:00.979-07	\N	1325	273	ADMIN	1660	\N	700	\N
2016-01-31 16:00:00-08	\N	\N	74	4	ADMIN	95	\N	698	\N
2016-03-06 16:00:00-08	\N	\N	141	47	ADMIN	202	\N	699	\N
2016-09-29 11:08:19.514-07	2016-09-29 11:08:19.514-07	\N	1327	275	ADMIN	1662	\N	708	\N
2016-01-31 16:00:00-08	\N	\N	69	12	ADMIN	90	\N	709	\N
2016-09-29 11:10:43.445-07	2016-09-29 11:10:43.445-07	\N	1332	277	ADMIN	1667	\N	712	\N
2016-09-29 11:11:53.863-07	2016-09-29 11:11:53.863-07	\N	1333	278	ADMIN	1668	\N	713	\N
2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	\N	171	59	ADMIN	248	\N	716	\N
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	3	301	HOST	1715	\N	848	\N
2017-02-27 16:25:20.392-08	2017-02-27 16:25:20.392-08	\N	3301	522	BACKER	3424	\N	706	56
2017-01-16 10:03:56.965-08	2017-01-16 10:03:56.965-08	\N	2561	48	BACKER	2772	\N	843	109
2017-02-01 07:16:22.449-08	2017-02-01 07:16:22.449-08	\N	2898	48	BACKER	3042	\N	742	109
2017-01-18 05:54:51.032-08	2017-01-18 05:54:51.032-08	\N	2594	48	BACKER	2794	\N	846	109
2016-11-22 07:22:40.419-08	2016-11-22 07:22:40.419-08	\N	1846	59	BACKER	2246	\N	842	115
2016-11-29 02:03:23.974-08	2016-11-29 02:03:23.974-08	\N	1908	301	BACKER	2296	\N	836	137
2016-10-07 09:49:20.388-07	2016-10-07 09:49:20.388-07	\N	1446	241	BACKER	1822	\N	831	141
2016-12-18 17:41:29.216-08	2016-12-18 17:41:29.216-08	\N	2220	259	BACKER	2545	\N	844	147
2016-11-28 07:33:15.87-08	2016-11-28 07:33:15.87-08	\N	1890	2	BACKER	2289	\N	733	199
2016-10-06 11:36:39.082-07	2016-10-06 11:36:39.082-07	\N	1438	2	BACKER	1815	\N	830	199
2017-01-03 12:59:38.784-08	2017-01-03 12:59:38.784-08	\N	2416	2	BACKER	2665	\N	834	199
2016-11-30 08:11:42.605-08	2016-11-30 08:11:42.605-08	\N	1957	2	BACKER	2339	\N	833	199
2016-09-29 11:32:01.003-07	2016-09-29 11:32:01.003-07	\N	1358	294	ADMIN	1693	\N	710	\N
2016-09-29 11:33:37.221-07	2016-09-29 11:33:37.221-07	\N	1361	295	ADMIN	1695	\N	711	\N
2016-09-29 11:43:49.24-07	2016-09-29 11:43:49.24-07	\N	1375	301	ADMIN	1710	\N	714	\N
2016-09-29 11:33:37.213-07	2016-09-29 11:33:37.213-07	\N	1359	295	ADMIN	1694	\N	715	\N
2016-09-29 11:38:54.983-07	2016-09-29 11:38:54.983-07	\N	1370	299	ADMIN	1705	\N	718	\N
2016-09-29 11:34:59.522-07	2016-09-29 11:34:59.522-07	\N	1362	297	ADMIN	1697	\N	728	\N
2016-09-29 11:34:59.53-07	2016-09-29 11:34:59.53-07	\N	1363	297	ADMIN	1698	\N	729	\N
2016-09-29 11:34:59.53-07	2016-09-29 11:34:59.53-07	\N	1364	297	ADMIN	1699	\N	731	\N
2016-09-29 11:37:07.37-07	2016-09-29 11:37:07.37-07	\N	1365	298	ADMIN	1700	\N	732	\N
2016-09-29 11:38:54.974-07	2016-09-29 11:38:54.974-07	\N	1368	299	ADMIN	1703	\N	739	\N
2016-09-29 11:38:54.983-07	2016-09-29 11:38:54.983-07	\N	1369	299	ADMIN	1704	\N	741	\N
2016-09-29 11:41:11.077-07	2016-09-29 11:41:11.077-07	\N	1371	300	ADMIN	1706	\N	747	\N
2016-09-29 11:43:49.258-07	2016-09-29 11:43:49.258-07	\N	1379	301	ADMIN	1711	\N	743	\N
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	1378	301	ADMIN	1714	\N	750	\N
2016-09-29 11:41:11.089-07	2016-09-29 11:41:11.089-07	\N	1372	300	ADMIN	1707	\N	749	\N
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	1376	301	ADMIN	1712	\N	757	\N
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	1377	301	ADMIN	1713	\N	761	\N
2016-09-29 11:37:07.378-07	2016-09-29 11:37:07.378-07	\N	1367	298	ADMIN	1701	\N	767	\N
2016-09-29 11:30:08.999-07	2016-09-29 11:30:08.999-07	\N	1355	292	ADMIN	1690	\N	774	\N
2016-09-29 11:26:35.16-07	2016-09-29 11:26:35.16-07	\N	1350	289	ADMIN	1685	\N	821	\N
2016-09-29 11:28:08.489-07	2016-09-29 11:28:08.489-07	\N	1351	290	ADMIN	1686	\N	822	\N
2016-09-29 11:28:54.298-07	2016-09-29 11:28:54.298-07	\N	1353	291	ADMIN	1688	\N	823	\N
2016-09-29 11:30:54.26-07	2016-09-29 11:30:54.26-07	\N	1356	293	ADMIN	1691	\N	824	\N
2016-09-29 11:28:08.494-07	2016-09-29 11:28:08.494-07	\N	1352	290	ADMIN	1687	\N	827	\N
2016-09-29 11:32:00.998-07	2016-09-29 11:32:00.998-07	\N	1357	294	ADMIN	1692	\N	829	\N
2017-01-03 16:00:00-08	2017-01-03 16:00:00-08	\N	2431	430	ADMIN	2681	\N	840	\N
2016-01-12 16:00:00-08	\N	\N	3	12	HOST	29	\N	848	\N
2016-01-12 16:00:00-08	\N	\N	3	13	HOST	30	\N	848	\N
2016-01-12 16:00:00-08	\N	\N	3	14	HOST	31	\N	848	\N
2016-01-12 16:00:00-08	\N	\N	3	15	HOST	32	\N	848	\N
2016-03-06 16:00:00-08	\N	\N	3	47	HOST	203	\N	848	\N
2016-03-06 16:00:00-08	\N	\N	3	48	HOST	205	\N	848	\N
2015-10-31 17:00:00-07	2015-10-31 17:00:00-07	\N	3	51	HOST	213	\N	848	\N
2016-01-31 16:00:00-08	\N	\N	3	2	HOST	18	\N	848	\N
2016-01-31 16:00:00-08	\N	\N	3	3	HOST	19	\N	848	\N
2016-01-31 16:00:00-08	\N	\N	3	4	HOST	20	\N	848	\N
2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	\N	3	59	HOST	246	\N	848	\N
2016-08-01 17:00:00-07	2016-08-01 17:00:00-07	\N	3	195	HOST	1149	\N	848	\N
2016-09-07 15:13:23.811-07	2016-09-07 15:13:23.811-07	\N	3	241	HOST	1458	\N	848	\N
2016-09-29 11:41:11.097-07	2016-09-29 11:41:11.097-07	\N	3	300	HOST	1716	\N	848	\N
2016-09-29 11:38:54.983-07	2016-09-29 11:38:54.983-07	\N	3	299	HOST	1717	\N	848	\N
2016-09-29 11:37:07.378-07	2016-09-29 11:37:07.378-07	\N	3	298	HOST	1718	\N	848	\N
2016-09-29 11:34:59.53-07	2016-09-29 11:34:59.53-07	\N	3	297	HOST	1719	\N	848	\N
2016-09-29 11:33:37.221-07	2016-09-29 11:33:37.221-07	\N	3	295	HOST	1720	\N	848	\N
2016-09-29 11:32:01.003-07	2016-09-29 11:32:01.003-07	\N	3	294	HOST	1721	\N	848	\N
2016-09-29 11:30:54.26-07	2016-09-29 11:30:54.26-07	\N	3	293	HOST	1722	\N	848	\N
2016-09-29 11:30:08.999-07	2016-09-29 11:30:08.999-07	\N	3	292	HOST	1723	\N	848	\N
2016-09-29 11:28:54.298-07	2016-09-29 11:28:54.298-07	\N	3	291	HOST	1724	\N	848	\N
2016-09-29 11:28:08.494-07	2016-09-29 11:28:08.494-07	\N	3	290	HOST	1725	\N	848	\N
2016-09-29 11:26:35.16-07	2016-09-29 11:26:35.16-07	\N	3	289	HOST	1726	\N	848	\N
2016-09-29 11:25:22.012-07	2016-09-29 11:25:22.012-07	\N	3	288	HOST	1727	\N	848	\N
2016-09-29 11:24:17.83-07	2016-09-29 11:24:17.83-07	\N	3	287	HOST	1728	\N	848	\N
2016-09-29 11:19:11.467-07	2016-09-29 11:19:11.467-07	\N	3	286	HOST	1729	\N	848	\N
2016-09-29 11:17:47.337-07	2016-09-29 11:17:47.337-07	\N	3	285	HOST	1730	\N	848	\N
2016-09-29 11:16:52.145-07	2016-09-29 11:16:52.145-07	\N	3	284	HOST	1732	\N	848	\N
2016-09-29 11:16:17.13-07	2016-09-29 11:16:17.13-07	\N	3	283	HOST	1733	\N	848	\N
2016-09-29 11:15:23.948-07	2016-09-29 11:15:23.948-07	\N	3	282	HOST	1734	\N	848	\N
2016-09-29 11:14:46.62-07	2016-09-29 11:14:46.62-07	\N	3	281	HOST	1735	\N	848	\N
2016-09-29 11:13:48.784-07	2016-09-29 11:13:48.784-07	\N	3	280	HOST	1736	\N	848	\N
2016-09-29 11:12:58.888-07	2016-09-29 11:12:58.888-07	\N	3	279	HOST	1737	\N	848	\N
2016-09-29 11:11:53.87-07	2016-09-29 11:11:53.87-07	\N	3	278	HOST	1738	\N	848	\N
2016-09-29 11:10:43.445-07	2016-09-29 11:10:43.445-07	\N	3	277	HOST	1739	\N	848	\N
2016-09-29 11:09:42.812-07	2016-09-29 11:09:42.812-07	\N	3	276	HOST	1740	\N	848	\N
2016-09-29 11:08:19.528-07	2016-09-29 11:08:19.528-07	\N	3	275	HOST	1741	\N	848	\N
2016-09-29 11:06:44.758-07	2016-09-29 11:06:44.758-07	\N	3	274	HOST	1742	\N	848	\N
2016-09-29 11:06:00.979-07	2016-09-29 11:06:00.979-07	\N	3	273	HOST	1743	\N	848	\N
2016-09-29 11:05:19.101-07	2016-09-29 11:05:19.101-07	\N	3	272	HOST	1744	\N	848	\N
2016-09-29 11:03:46.814-07	2016-09-29 11:03:46.814-07	\N	3	271	HOST	1745	\N	848	\N
2016-09-29 11:02:54.581-07	2016-09-29 11:02:54.581-07	\N	3	270	HOST	1746	\N	848	\N
2016-09-29 11:01:49.724-07	2016-09-29 11:01:49.724-07	\N	3	269	HOST	1747	\N	848	\N
2016-09-29 11:01:04.753-07	2016-09-29 11:01:04.753-07	\N	3	268	HOST	1748	\N	848	\N
2016-09-29 11:00:01.891-07	2016-09-29 11:00:01.891-07	\N	3	267	HOST	1749	\N	848	\N
2016-09-29 10:59:15.446-07	2016-09-29 10:59:15.446-07	\N	3	266	HOST	1750	\N	848	\N
2016-09-29 10:58:16.643-07	2016-09-29 10:58:16.643-07	\N	3	265	HOST	1751	\N	848	\N
2016-09-29 10:54:53.501-07	2016-09-29 10:54:53.501-07	\N	3	264	HOST	1752	\N	848	\N
2016-09-29 10:53:00.559-07	2016-09-29 10:53:00.559-07	\N	3	263	HOST	1753	\N	848	\N
2016-09-29 10:51:29.396-07	2016-09-29 10:51:29.396-07	\N	3	262	HOST	1754	\N	848	\N
2016-09-29 10:49:43.088-07	2016-09-29 10:49:43.088-07	\N	3	261	HOST	1755	\N	848	\N
2016-09-29 10:44:40.461-07	2016-09-29 10:44:40.461-07	\N	3	260	HOST	1756	\N	848	\N
2016-09-29 10:43:14.112-07	2016-09-29 10:43:14.112-07	\N	3	259	HOST	1757	\N	848	\N
2017-01-03 16:00:00-08	2017-01-03 16:00:00-08	\N	3	430	HOST	2682	\N	848	\N
2017-04-03 09:22:46.049-07	2017-04-03 09:22:46.049-07	\N	3	584	HOST	3951	\N	848	\N
2017-05-10 16:45:46.804-07	2017-05-10 16:45:46.804-07	\N	4749	522	BACKER	4528	\N	796	56
2017-05-15 05:07:59.716-07	2017-05-15 05:07:59.716-07	\N	4834	14	BACKER	4597	\N	744	70
2016-02-02 13:46:44.979-08	2016-02-02 13:46:44.979-08	\N	8	14	BACKER	108	\N	724	71
2017-04-30 18:40:31.703-07	2017-04-30 18:40:31.703-07	\N	3419	516	BACKER	4353	\N	702	75
2017-05-01 10:13:36.311-07	2017-05-01 10:13:36.311-07	\N	4550	516	BACKER	4371	\N	758	75
2017-05-08 22:59:17.562-07	2017-05-08 22:59:17.562-07	\N	4711	517	BACKER	4493	\N	832	99
2016-06-21 09:06:05.21-07	2016-06-21 09:06:05.21-07	\N	642	48	BACKER	843	\N	768	111
2017-04-20 03:17:23.321-07	2017-04-20 03:17:23.321-07	\N	4348	59	BACKER	4200	\N	703	115
2016-11-17 09:43:31.221-08	2016-11-17 09:43:31.221-08	\N	1808	59	BACKER	2202	\N	835	115
2017-03-09 10:29:55.806-08	2017-03-09 10:29:55.806-08	\N	3442	259	BACKER	3521	\N	789	147
2017-01-14 09:11:43.287-08	2017-01-14 09:11:43.287-08	\N	2549	270	BACKER	2767	\N	781	162
2016-06-09 10:28:14.08-07	2016-06-09 10:28:14.08-07	\N	8	3	BACKER	717	\N	724	170
2016-06-21 09:05:00.99-07	2016-06-21 09:05:00.99-07	\N	642	4	BACKER	842	\N	768	180
2016-09-20 13:58:51.903-07	2016-09-20 13:58:51.903-07	\N	1244	4	BACKER	1544	\N	826	180
2017-04-11 19:05:36.09-07	2017-04-11 19:05:36.09-07	\N	4173	13	BACKER	4093	\N	693	185
2017-05-09 11:14:23.365-07	2017-05-09 11:14:23.365-07	\N	4720	2	BACKER	4500	\N	697	199
2016-02-02 15:09:06.035-08	2016-02-02 15:09:06.035-08	\N	2	13	BACKER	109	\N	688	186
2016-03-02 13:31:50.622-08	2016-03-02 13:31:50.622-08	\N	129	2	BACKER	178	\N	689	199
2016-09-01 07:41:37.755-07	2016-09-01 07:41:37.755-07	\N	1094	2	BACKER	1388	\N	805	199
2017-04-04 12:51:04.96-07	2017-04-04 12:51:04.96-07	\N	3999	2	BACKER	3972	\N	707	199
2016-09-28 14:47:19.401-07	2016-09-28 14:47:19.401-07	\N	1299	2	BACKER	1634	\N	748	199
2016-09-29 11:09:42.806-07	2016-09-29 11:09:42.806-07	\N	1329	276	ADMIN	1664	\N	687	\N
2016-09-29 11:08:19.528-07	2016-09-29 11:08:19.528-07	\N	1328	275	ADMIN	1663	\N	686	\N
2017-04-03 09:22:45.962-07	2017-04-03 09:22:45.962-07	\N	3206	584	ADMIN	3950	\N	690	\N
2016-09-29 11:33:37.221-07	2016-09-29 11:33:37.221-07	\N	1360	295	ADMIN	1696	\N	725	\N
2016-09-29 11:37:07.378-07	2016-09-29 11:37:07.378-07	\N	1366	298	ADMIN	1702	\N	736	\N
2016-09-29 11:41:11.097-07	2016-09-29 11:41:11.097-07	\N	1373	300	ADMIN	1709	\N	751	\N
2016-09-29 10:44:40.461-07	2016-09-29 10:44:40.461-07	\N	1305	260	ADMIN	1639	\N	760	\N
2016-09-29 10:53:00.559-07	2016-09-29 10:53:00.559-07	\N	1312	263	ADMIN	1646	\N	776	\N
2016-09-29 11:00:01.891-07	2016-09-29 11:00:01.891-07	\N	1314	267	ADMIN	1651	\N	779	\N
2016-01-31 16:00:00-08	\N	\N	68	15	ADMIN	89	\N	788	\N
2016-09-29 11:03:46.814-07	2016-09-29 11:03:46.814-07	\N	1322	271	ADMIN	1657	\N	794	\N
2017-02-21 08:25:28.555-08	2017-02-21 08:25:28.555-08	\N	3	510	HOST	3326	\N	848	\N
2017-02-21 08:55:29.765-08	2017-02-21 08:55:29.765-08	\N	3	511	HOST	3328	\N	848	\N
2017-02-21 10:11:30.855-08	2017-02-21 10:11:30.855-08	\N	3	512	HOST	3332	\N	848	\N
2017-02-21 10:35:34.613-08	2017-02-21 10:35:34.613-08	\N	3	513	HOST	3334	\N	848	\N
2017-02-21 10:49:14.435-08	2017-02-21 10:49:14.435-08	\N	3	515	HOST	3338	\N	848	\N
2017-02-21 11:02:21.646-08	2017-02-21 11:02:21.646-08	\N	3	516	HOST	3341	\N	848	\N
2017-02-21 11:07:25.321-08	2017-02-21 11:07:25.321-08	\N	3	517	HOST	3343	\N	848	\N
2017-02-21 11:13:03.538-08	2017-02-21 11:13:03.538-08	\N	3	518	HOST	3345	\N	848	\N
2017-02-21 11:25:28.822-08	2017-02-21 11:25:28.822-08	\N	3	519	HOST	3347	\N	848	\N
2017-02-21 11:34:47.427-08	2017-02-21 11:34:47.427-08	\N	3	520	HOST	3349	\N	848	\N
2017-02-21 11:39:46.29-08	2017-02-21 11:39:46.29-08	\N	3	521	HOST	3351	\N	848	\N
2017-02-21 11:45:19.309-08	2017-02-21 11:45:19.309-08	\N	3	522	HOST	3353	\N	848	\N
2017-02-21 12:04:49.156-08	2017-02-21 12:04:49.156-08	\N	3	523	HOST	3355	\N	848	\N
2017-02-21 12:11:44.893-08	2017-02-21 12:11:44.893-08	\N	3	524	HOST	3357	\N	848	\N
2017-02-21 12:16:59.184-08	2017-02-21 12:16:59.184-08	\N	3	525	HOST	3359	\N	848	\N
2017-02-21 10:11:30.773-08	2017-02-21 10:11:30.773-08	\N	3	512	ADMIN	3331	\N	848	\N
2017-02-21 08:55:29.655-08	2017-02-21 08:55:29.655-08	\N	3	511	ADMIN	3327	\N	848	\N
2017-02-21 10:35:34.524-08	2017-02-21 10:35:34.524-08	\N	3	513	ADMIN	3333	\N	848	\N
2017-02-21 10:49:14.345-08	2017-02-21 10:49:14.345-08	\N	3	515	ADMIN	3337	\N	848	\N
2017-02-21 11:02:21.568-08	2017-02-21 11:02:21.568-08	\N	3	516	ADMIN	3340	\N	848	\N
2017-02-21 11:07:25.188-08	2017-02-21 11:07:25.188-08	\N	3	517	ADMIN	3342	\N	848	\N
2017-02-21 11:13:03.394-08	2017-02-21 11:13:03.394-08	\N	3	518	ADMIN	3344	\N	848	\N
2017-02-21 11:25:28.725-08	2017-02-21 11:25:28.725-08	\N	3	519	ADMIN	3346	\N	848	\N
2017-02-21 11:34:47.02-08	2017-02-21 11:34:47.02-08	\N	3	520	ADMIN	3348	\N	848	\N
2017-02-21 11:39:46.239-08	2017-02-21 11:39:46.239-08	\N	3	521	ADMIN	3350	\N	848	\N
2017-02-21 11:45:19.169-08	2017-02-21 11:45:19.169-08	\N	3	522	ADMIN	3352	\N	848	\N
2017-02-21 12:04:48.979-08	2017-02-21 12:04:48.979-08	\N	3	523	ADMIN	3354	\N	848	\N
2017-02-21 12:11:44.767-08	2017-02-21 12:11:44.767-08	\N	3	524	ADMIN	3356	\N	848	\N
2017-02-21 12:16:59.092-08	2017-02-21 12:16:59.092-08	\N	3	525	ADMIN	3358	\N	848	\N
2015-11-19 02:07:53.479-08	2017-08-28 15:47:15.767-07	\N	3	848	HOST	4719	\N	848	\N
2016-02-02 09:04:56.333-08	2016-02-02 09:04:56.333-08	\N	30	13	BACKER	103	\N	691	186
2017-02-10 08:47:34.941-08	2017-02-10 08:47:34.941-08	\N	3053	15	BACKER	3214	\N	705	197
2016-07-01 15:31:46.068-07	2016-07-01 15:31:46.068-07	\N	686	2	BACKER	894	\N	740	200
2017-04-10 18:09:50.695-07	2017-04-10 18:09:50.695-07	\N	4153	13	BACKER	4088	\N	701	185
2017-02-01 09:30:50.44-08	2017-02-01 09:30:50.44-08	\N	2906	271	BACKER	3045	\N	692	195
2016-04-13 09:46:10.223-07	2016-04-13 09:46:10.223-07	\N	224	2	BACKER	330	\N	723	199
2016-03-25 08:11:05.1-07	2016-03-25 08:11:05.1-07	\N	192	2	BACKER	268	\N	738	199
2016-01-10 16:00:00-08	\N	\N	36	10	ADMIN	9	\N	717	\N
2016-01-10 16:00:00-08	\N	\N	34	15	ADMIN	15	\N	720	\N
2016-01-10 16:00:00-08	\N	\N	37	10	ADMIN	10	\N	721	\N
2016-01-10 16:00:00-08	\N	\N	7	10	ADMIN	8	\N	722	\N
2016-01-10 16:00:00-08	\N	\N	33	13	ADMIN	12	\N	726	\N
2016-01-31 16:00:00-08	\N	\N	71	3	ADMIN	92	\N	727	\N
2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	\N	170	59	ADMIN	247	\N	734	\N
2016-01-10 16:00:00-08	\N	\N	35	12	ADMIN	11	\N	737	\N
2016-01-10 16:00:00-08	\N	\N	32	14	ADMIN	14	\N	746	\N
2016-09-29 11:12:58.877-07	2016-09-29 11:12:58.877-07	\N	1335	279	ADMIN	1670	\N	753	\N
2016-09-29 10:53:00.559-07	2016-09-29 10:53:00.559-07	\N	1311	263	ADMIN	1645	\N	754	\N
2016-01-31 16:00:00-08	\N	\N	67	13	ADMIN	88	\N	756	\N
2016-01-31 16:00:00-08	\N	\N	76	4	ADMIN	97	\N	759	\N
2016-09-29 10:49:43.081-07	2016-09-29 10:49:43.081-07	\N	1307	261	ADMIN	1641	\N	763	\N
2016-01-31 16:00:00-08	\N	\N	75	4	ADMIN	96	\N	764	\N
2016-01-31 16:00:00-08	\N	\N	78	4	ADMIN	99	\N	765	\N
2016-01-31 16:00:00-08	\N	\N	72	3	ADMIN	93	\N	769	\N
2016-09-29 10:49:43.088-07	2016-09-29 10:49:43.088-07	\N	1308	261	ADMIN	1642	\N	766	\N
2016-09-29 10:51:29.377-07	2016-09-29 10:51:29.377-07	\N	1309	262	ADMIN	1643	\N	771	\N
2016-09-29 10:51:29.396-07	2016-09-29 10:51:29.396-07	\N	1310	262	ADMIN	1644	\N	773	\N
2016-01-31 16:00:00-08	\N	\N	77	4	ADMIN	98	\N	770	\N
2016-09-29 10:54:53.485-07	2016-09-29 10:54:53.485-07	\N	1313	264	ADMIN	1647	\N	778	\N
2016-01-10 16:00:00-08	\N	\N	31	14	ADMIN	13	\N	777	\N
2016-01-31 16:00:00-08	\N	\N	70	12	ADMIN	91	\N	780	\N
2016-09-29 10:54:53.501-07	2016-09-29 10:54:53.501-07	\N	1314	264	ADMIN	1648	\N	779	\N
2016-09-29 10:58:16.643-07	2016-09-29 10:58:16.643-07	\N	1315	265	ADMIN	1649	\N	782	\N
2016-09-29 10:59:15.446-07	2016-09-29 10:59:15.446-07	\N	1316	266	ADMIN	1650	\N	783	\N
2016-09-29 11:25:22-07	2016-09-29 11:25:22-07	\N	1347	288	ADMIN	1682	\N	787	\N
2016-09-29 11:01:04.72-07	2016-09-29 11:01:04.72-07	\N	1317	268	ADMIN	1652	\N	785	\N
2016-09-29 11:01:04.753-07	2016-09-29 11:01:04.753-07	\N	1318	268	ADMIN	1653	\N	786	\N
2016-09-29 11:01:49.724-07	2016-09-29 11:01:49.724-07	\N	1319	269	ADMIN	1654	\N	790	\N
2016-09-29 11:02:54.581-07	2016-09-29 11:02:54.581-07	\N	1321	270	ADMIN	1656	\N	791	\N
2016-09-29 11:02:54.576-07	2016-09-29 11:02:54.576-07	\N	1320	270	ADMIN	1655	\N	792	\N
2016-08-01 17:00:00-07	2016-08-01 17:00:00-07	\N	897	195	ADMIN	1150	\N	795	\N
2016-08-01 17:00:00-07	2016-08-01 17:00:00-07	\N	898	195	ADMIN	1151	\N	797	\N
2016-09-29 11:05:19.093-07	2016-09-29 11:05:19.093-07	\N	1323	272	ADMIN	1658	\N	798	\N
2016-09-29 11:05:19.101-07	2016-09-29 11:05:19.101-07	\N	1324	272	ADMIN	1659	\N	799	\N
2016-09-29 11:06:44.758-07	2016-09-29 11:06:44.758-07	\N	1326	274	ADMIN	1661	\N	800	\N
2016-09-29 11:09:42.812-07	2016-09-29 11:09:42.812-07	\N	1330	276	ADMIN	1665	\N	803	\N
2016-09-07 15:13:23.641-07	2016-09-07 15:13:23.641-07	\N	1145	241	ADMIN	1457	\N	804	\N
2016-09-29 11:13:48.784-07	2016-09-29 11:13:48.784-07	\N	1337	280	ADMIN	1672	\N	809	\N
2016-09-29 11:11:53.87-07	2016-09-29 11:11:53.87-07	\N	1334	278	ADMIN	1669	\N	807	\N
2016-09-29 11:12:58.888-07	2016-09-29 11:12:58.888-07	\N	1336	279	ADMIN	1671	\N	808	\N
2016-09-29 11:15:23.948-07	2016-09-29 11:15:23.948-07	\N	1339	282	ADMIN	1674	\N	810	\N
2016-09-29 11:14:46.62-07	2016-09-29 11:14:46.62-07	\N	1338	281	ADMIN	1673	\N	811	\N
2016-09-29 11:16:17.13-07	2016-09-29 11:16:17.13-07	\N	1340	283	ADMIN	1675	\N	812	\N
2016-09-29 11:16:52.145-07	2016-09-29 11:16:52.145-07	\N	1341	284	ADMIN	1676	\N	814	\N
2016-09-29 11:24:17.83-07	2016-09-29 11:24:17.83-07	\N	1346	287	ADMIN	1681	\N	817	\N
2016-01-31 16:00:00-08	\N	\N	73	3	ADMIN	94	\N	818	\N
2016-09-29 11:26:35.151-07	2016-09-29 11:26:35.151-07	\N	1349	289	ADMIN	1684	\N	820	\N
2016-09-29 11:19:11.462-07	2016-09-29 11:19:11.462-07	\N	1343	286	ADMIN	1678	\N	815	\N
2016-09-29 11:25:22.012-07	2016-09-29 11:25:22.012-07	\N	1348	288	ADMIN	1683	\N	819	\N
2016-09-29 10:44:40.454-07	2016-09-29 10:44:40.454-07	\N	1304	260	ADMIN	1638	\N	838	\N
2016-09-29 10:43:14.112-07	2016-09-29 10:43:14.112-07	\N	1303	259	ADMIN	1637	\N	841	\N
2016-09-29 11:19:11.467-07	2016-09-29 11:19:11.467-07	\N	1344	286	ADMIN	1679	\N	845	\N
2016-03-06 16:00:00-08	\N	\N	142	48	ADMIN	204	\N	847	\N
2016-09-29 11:17:47.337-07	2016-09-29 11:17:47.337-07	\N	1342	285	ADMIN	1677	\N	813	\N
2016-09-29 11:24:17.825-07	2016-09-29 11:24:17.825-07	\N	1345	287	ADMIN	1680	\N	816	\N
2016-09-29 11:30:08.992-07	2016-09-29 11:30:08.992-07	\N	1354	292	ADMIN	1689	\N	828	\N
2016-09-29 11:41:11.097-07	2016-09-29 11:41:11.097-07	\N	1374	300	ADMIN	1708	\N	837	\N
2017-02-21 08:25:28.457-08	2017-02-21 08:25:28.457-08	\N	3	510	ADMIN	3325	\N	848	\N
\.


                                                                                                                                                           4026.dat                                                                                            0000600 0004000 0002000 00000162062 13155532021 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        8141	email	mailinglist.host	t	2017-02-21 12:04:49.157-08	2017-02-21 12:04:49.157-08	3	523	http://****
8147	email	mailinglist.host	t	2017-02-21 12:11:44.894-08	2017-02-21 12:11:44.894-08	3	524	http://****
8153	email	mailinglist.host	t	2017-02-21 12:16:59.184-08	2017-02-21 12:16:59.184-08	3	525	http://****
595	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	286	http://****
596	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	287	http://****
597	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	195	http://****
598	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	288	http://****
599	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	289	http://****
735	email	mailinglist.backers	t	2016-10-10 13:37:16.762-07	2016-10-10 13:37:16.762-07	108	2	http://****
16243	email	mailinglist.backers	t	2017-05-09 11:14:23.366-07	2017-05-09 11:14:23.366-07	4720	2	http://****
1360	email	mailinglist.backers	t	2016-10-10 13:37:16.984-07	2016-10-10 13:37:16.984-07	686	2	http://****
1911	email	mailinglist.backers	t	2016-10-10 13:37:17.146-07	2016-10-10 13:37:17.146-07	1178	2	http://****
2645	email	mailinglist.backers	t	2016-11-22 07:22:40.421-08	2016-11-22 07:22:40.421-08	1846	59	http://****
6351	email	mailinglist.backers	t	2017-01-14 09:11:43.288-08	2017-01-14 09:11:43.288-08	2549	270	http://****
6368	email	mailinglist.backers	t	2017-01-16 10:03:56.966-08	2017-01-16 10:03:56.966-08	2561	48	http://****
6433	email	mailinglist.backers	t	2017-01-18 05:54:51.032-08	2017-01-18 05:54:51.032-08	2594	48	http://****
16640	email	mailinglist.backers	t	2017-05-15 05:07:59.717-07	2017-05-15 05:07:59.717-07	4834	14	http://****
7122	email	mailinglist.backers	t	2017-02-01 09:30:50.441-08	2017-02-01 09:30:50.441-08	2906	271	http://****
7610	email	mailinglist.backers	t	2017-02-10 08:47:34.942-08	2017-02-10 08:47:34.942-08	3053	15	http://****
8040	email	mailinglist.host	t	2017-02-21 08:25:28.556-08	2017-02-21 08:25:28.556-08	3	510	http://****
8048	email	mailinglist.host	t	2017-02-21 08:55:29.765-08	2017-02-21 08:55:29.765-08	3	511	http://****
8064	email	mailinglist.host	t	2017-02-21 10:11:30.856-08	2017-02-21 10:11:30.856-08	3	512	http://****
8074	email	mailinglist.host	t	2017-02-21 10:35:34.614-08	2017-02-21 10:35:34.614-08	3	513	http://****
8140	email	collective.monthlyreport	t	2017-02-21 12:04:48.984-08	2017-02-21 12:04:48.984-08	3	523	http://****
8146	email	collective.monthlyreport	t	2017-02-21 12:11:44.769-08	2017-02-21 12:11:44.769-08	3	524	http://****
8152	email	collective.monthlyreport	t	2017-02-21 12:16:59.094-08	2017-02-21 12:16:59.094-08	3	525	http://****
8039	email	collective.monthlyreport	t	2017-02-21 08:25:28.459-08	2017-02-21 08:25:28.459-08	3	510	http://****
8047	email	collective.monthlyreport	t	2017-02-21 08:55:29.66-08	2017-02-21 08:55:29.66-08	3206	511	http://****
8063	email	collective.monthlyreport	t	2017-02-21 10:11:30.775-08	2017-02-21 10:11:30.775-08	3	512	http://****
8073	email	collective.monthlyreport	t	2017-02-21 10:35:34.526-08	2017-02-21 10:35:34.526-08	3	513	http://****
8142	email	collective.transaction.created	t	2017-02-21 12:04:49.157-08	2017-02-21 12:04:49.157-08	3	523	http://****
8148	email	collective.transaction.created	t	2017-02-21 12:11:44.895-08	2017-02-21 12:11:44.895-08	3	524	http://****
8154	email	collective.transaction.created	t	2017-02-21 12:16:59.185-08	2017-02-21 12:16:59.185-08	3	525	http://****
8041	email	collective.transaction.created	t	2017-02-21 08:25:28.556-08	2017-02-21 08:25:28.556-08	3	510	http://****
8049	email	collective.transaction.created	t	2017-02-21 08:55:29.765-08	2017-02-21 08:55:29.765-08	3	511	http://****
8065	email	collective.transaction.created	t	2017-02-21 10:11:30.856-08	2017-02-21 10:11:30.856-08	3	512	http://****
8145	email	collective.expense.created	t	2017-02-21 12:11:44.769-08	2017-02-21 12:11:44.769-08	3	524	http://****
8151	email	collective.expense.created	t	2017-02-21 12:16:59.094-08	2017-02-21 12:16:59.094-08	3	525	http://****
2919	email	collective.expense.created	t	2016-11-28 14:28:52.444-08	2017-01-10 16:00:00-08	3	295	http://****
2926	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	288	http://****
2931	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	283	http://****
2936	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	278	http://****
5772	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1339	282	http://****
5558	email	collective.expense.created	f	2016-12-28 16:13:56.268-08	2017-01-17 16:00:00-08	34	15	http://****
5789	email	collective.expense.created	f	2016-12-28 16:13:56.345-08	2017-01-17 16:00:00-08	1371	300	http://****
16437	email	collective.donation.created	f	2017-05-11 09:41:40.872-07	2017-05-11 09:41:40.872-07	171	59	http://****
8088	email	mailinglist.host	t	2017-02-21 10:49:14.435-08	2017-02-21 10:49:14.435-08	3	515	http://****
8095	email	mailinglist.host	t	2017-02-21 11:02:21.647-08	2017-02-21 11:02:21.647-08	3	516	http://****
16332	email	mailinglist.backers	t	2017-05-10 16:45:46.805-07	2017-05-10 16:45:46.805-07	4749	522	http://****
8426	email	mailinglist.backers	f	2017-02-27 16:25:20.393-08	2017-02-27 16:25:20.393-08	3301	522	http://****
12034	email	mailinglist.backers	t	2017-03-09 10:29:55.807-08	2017-03-09 10:29:55.807-08	3442	259	http://****
16214	email	mailinglist.backers	t	2017-05-08 22:59:17.564-07	2017-05-08 22:59:17.564-07	4711	517	http://****
13800	email	mailinglist.host	t	2017-04-03 09:22:46.049-07	2017-04-03 09:22:46.049-07	3	584	http://****
13887	email	mailinglist.backers	t	2017-04-04 12:51:04.96-07	2017-04-04 12:51:04.96-07	3999	2	http://****
14398	email	mailinglist.backers	t	2017-04-10 18:09:50.696-07	2017-04-10 18:09:50.696-07	4153	13	http://****
14447	email	mailinglist.backers	t	2017-04-11 19:05:36.091-07	2017-04-11 19:05:36.091-07	4173	13	http://****
15002	email	mailinglist.backers	t	2017-04-20 03:17:23.322-07	2017-04-20 03:17:23.322-07	4348	59	http://****
15657	email	mailinglist.backers	t	2017-04-30 18:40:31.704-07	2017-04-30 18:40:31.704-07	3419	516	http://****
15717	email	mailinglist.backers	t	2017-05-01 10:13:36.324-07	2017-05-01 10:13:36.324-07	4550	516	http://****
79	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	2	http://****
80	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	3	http://****
81	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	4	http://****
82	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	10	http://****
83	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	12	http://****
84	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	13	http://****
85	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	14	http://****
86	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	15	http://****
87	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	47	http://****
88	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	48	http://****
89	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	59	http://****
566	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	261	http://****
567	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	10	http://****
568	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	268	http://****
569	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	262	http://****
570	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	269	http://****
8087	email	collective.monthlyreport	t	2017-02-21 10:49:14.347-08	2017-02-21 10:49:14.347-08	3	515	http://****
8094	email	collective.monthlyreport	t	2017-02-21 11:02:21.57-08	2017-02-21 11:02:21.57-08	3	516	http://****
13799	email	collective.monthlyreport	t	2017-04-03 09:22:45.964-07	2017-04-03 09:22:45.964-07	3206	584	http://****
8089	email	collective.transaction.created	t	2017-02-21 10:49:14.436-08	2017-02-21 10:49:14.436-08	3	515	http://****
13801	email	collective.transaction.created	t	2017-04-03 09:22:46.049-07	2017-04-03 09:22:46.049-07	3	584	http://****
70	email	collective.transaction.created	t	2016-07-06 17:00:00-07	2016-07-06 17:00:00-07	577	4	http://****
39	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	142	48	http://****
40	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	28	2	http://****
41	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	33	13	http://****
42	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	67	13	http://****
43	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	71	3	http://****
44	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	72	3	http://****
45	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	73	3	http://****
46	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	170	59	http://****
47	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	171	59	http://****
48	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	35	12	http://****
49	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	69	12	http://****
50	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	70	12	http://****
8093	email	collective.expense.created	t	2017-02-21 11:02:21.57-08	2017-02-21 11:02:21.57-08	3	516	http://****
13798	email	collective.expense.created	t	2017-04-03 09:22:45.964-07	2017-04-03 09:22:45.964-07	3206	584	http://****
13802	email	collective.expense.created	t	2017-04-03 09:22:46.05-07	2017-04-03 09:22:46.05-07	3	584	http://****
571	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	263	http://****
572	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	270	http://****
573	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	264	http://****
574	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	265	http://****
575	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	15	http://****
576	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	259	http://****
577	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	266	http://****
578	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	271	http://****
579	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	260	http://****
580	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	267	http://****
581	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	272	http://****
582	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	273	http://****
583	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	14	http://****
584	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	274	http://****
585	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	275	http://****
586	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	276	http://****
587	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	277	http://****
588	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	279	http://****
589	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	280	http://****
590	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	281	http://****
591	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	282	http://****
592	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	283	http://****
593	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	284	http://****
594	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	285	http://****
600	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	290	http://****
601	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	291	http://****
602	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	292	http://****
603	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	293	http://****
604	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	294	http://****
605	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	295	http://****
606	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	297	http://****
607	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	298	http://****
608	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	299	http://****
609	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	13	http://****
610	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	278	http://****
611	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	59	http://****
612	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	2	http://****
613	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	51	http://****
614	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	241	http://****
615	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	3	http://****
616	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	48	http://****
617	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	47	http://****
618	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	4	http://****
619	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	300	http://****
620	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	301	http://****
621	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	12	http://****
655	email	mailinglist.backers	t	2016-10-10 13:37:16.676-07	2016-10-10 13:37:16.676-07	126	13	http://****
658	email	mailinglist.backers	t	2016-10-10 13:37:16.677-07	2016-10-10 13:37:16.677-07	2	10	http://****
698	email	mailinglist.backers	t	2016-10-10 13:37:16.722-07	2016-10-10 13:37:16.722-07	2	13	http://****
865	email	mailinglist.backers	t	2016-10-10 13:37:16.826-07	2016-10-10 13:37:16.826-07	192	2	http://****
1003	email	mailinglist.backers	t	2016-10-10 13:37:16.887-07	2016-10-10 13:37:16.887-07	308	2	http://****
680	email	mailinglist.backers	t	2016-10-10 13:37:16.704-07	2016-10-10 13:37:16.704-07	30	12	http://****
690	email	mailinglist.backers	t	2016-10-10 13:37:16.719-07	2016-10-10 13:37:16.719-07	30	14	http://****
691	email	mailinglist.backers	t	2016-10-10 13:37:16.72-07	2016-10-10 13:37:16.72-07	80	10	http://****
697	email	mailinglist.backers	t	2016-10-10 13:37:16.722-07	2016-10-10 13:37:16.722-07	8	14	http://****
912	email	mailinglist.backers	t	2016-10-10 13:37:16.84-07	2016-10-10 13:37:16.84-07	224	2	http://****
990	email	mailinglist.backers	t	2016-10-10 13:37:16.883-07	2016-10-10 13:37:16.883-07	303	13	http://****
1089	email	mailinglist.backers	t	2016-10-10 13:37:16.922-07	2016-10-10 13:37:16.922-07	392	2	http://****
692	email	mailinglist.backers	t	2016-10-10 13:37:16.72-07	2016-10-10 13:37:16.72-07	30	13	http://****
799	email	mailinglist.backers	t	2016-10-10 13:37:16.803-07	2016-10-10 13:37:16.803-07	129	2	http://****
987	email	mailinglist.backers	t	2016-10-10 13:37:16.883-07	2016-10-10 13:37:16.883-07	283	13	http://****
1244	email	mailinglist.backers	t	2016-10-10 13:37:16.958-07	2016-10-10 13:37:16.958-07	8	3	http://****
1322	email	mailinglist.backers	t	2016-10-10 13:37:16.976-07	2016-10-10 13:37:16.976-07	642	48	http://****
1232	email	mailinglist.backers	t	2016-10-10 13:37:16.955-07	2016-10-10 13:37:16.955-07	551	2	http://****
1237	email	mailinglist.backers	t	2016-10-10 13:37:16.956-07	2016-10-10 13:37:16.956-07	555	13	http://****
1321	email	mailinglist.backers	t	2016-10-10 13:37:16.975-07	2016-10-10 13:37:16.975-07	642	4	http://****
1128	email	mailinglist.backers	t	2016-10-10 13:37:16.931-07	2016-10-10 13:37:16.931-07	426	2	http://****
1320	email	mailinglist.backers	t	2016-10-10 13:37:16.975-07	2016-10-10 13:37:16.975-07	642	12	http://****
1325	email	mailinglist.backers	t	2016-10-10 13:37:16.976-07	2016-10-10 13:37:16.976-07	646	2	http://****
1595	email	mailinglist.backers	t	2016-10-10 13:37:17.04-07	2016-10-10 13:37:17.04-07	884	2	http://****
1609	email	mailinglist.backers	t	2016-10-10 13:37:17.062-07	2016-10-10 13:37:17.062-07	896	4	http://****
1594	email	mailinglist.backers	t	2016-10-10 13:37:17.04-07	2016-10-10 13:37:17.04-07	883	2	http://****
1805	email	mailinglist.backers	t	2016-10-10 13:37:17.119-07	2016-10-10 13:37:17.119-07	1094	2	http://****
1888	email	mailinglist.backers	t	2016-10-10 13:37:17.141-07	2016-10-10 13:37:17.141-07	1158	241	http://****
1961	email	mailinglist.backers	t	2016-10-10 13:37:17.158-07	2016-10-10 13:37:17.158-07	1244	4	http://****
1985	email	mailinglist.backers	t	2016-10-10 13:37:17.168-07	2016-10-10 13:37:17.168-07	1263	59	http://****
2045	email	mailinglist.backers	t	2016-10-10 13:37:17.194-07	2016-10-10 13:37:17.194-07	1299	2	http://****
2233	email	mailinglist.backers	t	2016-10-10 13:37:17.237-07	2016-10-10 13:37:17.237-07	1446	241	http://****
2226	email	mailinglist.backers	t	2016-10-10 13:37:17.235-07	2016-10-10 13:37:17.235-07	1438	2	http://****
2392	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1303	259	http://****
2397	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1309	262	http://****
2401	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1313	264	http://****
2406	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1317	268	http://****
2411	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1322	271	http://****
2416	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1327	275	http://****
2421	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1332	277	http://****
2426	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1337	280	http://****
2431	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1342	285	http://****
2436	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1347	288	http://****
2441	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1352	290	http://****
2446	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1357	294	http://****
2451	email	collective.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1362	297	http://****
2456	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1366	298	http://****
2461	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1372	300	http://****
2466	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1376	301	http://****
2597	email	mailinglist.backers	t	2016-11-17 09:43:31.222-08	2016-11-17 09:43:31.222-08	1808	59	http://****
2697	email	mailinglist.backers	t	2016-11-28 07:33:15.871-08	2016-11-28 07:33:15.871-08	1890	2	http://****
3000	email	mailinglist.backers	t	2016-11-29 02:03:23.975-08	2016-11-29 02:03:23.975-08	1908	301	http://****
3047	email	mailinglist.backers	t	2016-11-30 08:11:42.607-08	2016-11-30 08:11:42.607-08	1957	2	http://****
3286	email	mailinglist.backers	t	2016-12-18 17:41:29.217-08	2016-12-18 17:41:29.217-08	2220	259	http://****
6045	email	mailinglist.backers	t	2017-01-03 12:59:38.785-08	2017-01-03 12:59:38.785-08	2416	2	http://****
2917	email	collective.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	298	http://****
2922	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	292	http://****
2927	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	287	http://****
2932	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	282	http://****
2937	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	277	http://****
2942	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	272	http://****
2947	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	267	http://****
2953	email	collective.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	261	http://****
2897	email	collective.expense.created	t	2016-11-28 14:28:52.436-08	2017-01-10 16:00:00-08	3	241	http://****
2915	email	collective.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	300	http://****
2920	email	collective.expense.created	t	2016-11-28 14:28:52.444-08	2017-01-10 16:00:00-08	3	294	http://****
2925	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	289	http://****
2929	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	285	http://****
2935	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	279	http://****
2939	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	275	http://****
7114	email	mailinglist.backers	t	2017-02-01 07:16:22.45-08	2017-02-01 07:16:22.45-08	2898	48	http://****
8101	email	mailinglist.host	t	2017-02-21 11:07:25.322-08	2017-02-21 11:07:25.322-08	3	517	http://****
8107	email	mailinglist.host	t	2017-02-21 11:13:03.539-08	2017-02-21 11:13:03.539-08	3	518	http://****
8113	email	mailinglist.host	t	2017-02-21 11:25:28.823-08	2017-02-21 11:25:28.823-08	3	519	http://****
8119	email	mailinglist.host	t	2017-02-21 11:34:47.428-08	2017-02-21 11:34:47.428-08	3	520	http://****
8125	email	mailinglist.host	t	2017-02-21 11:39:46.291-08	2017-02-21 11:39:46.291-08	3	521	http://****
8131	email	mailinglist.host	t	2017-02-21 11:45:19.314-08	2017-02-21 11:45:19.314-08	3	522	http://****
8144	email	mailinglist.admins	t	2017-02-21 12:11:44.768-08	2017-02-21 12:11:44.768-08	3	524	http://****
8150	email	mailinglist.admins	t	2017-02-21 12:16:59.093-08	2017-02-21 12:16:59.093-08	3	525	http://****
763	email	mailinglist.admins	t	2016-10-10 13:37:16.793-07	2016-10-10 13:37:16.793-07	70	12	http://****
764	email	mailinglist.admins	t	2016-10-10 13:37:16.793-07	2016-10-10 13:37:16.793-07	71	3	http://****
769	email	mailinglist.admins	t	2016-10-10 13:37:16.795-07	2016-10-10 13:37:16.795-07	76	4	http://****
2052	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1307	261	http://****
2059	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1314	264	http://****
2064	email	mailinglist.admins	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1318	268	http://****
8099	email	collective.monthlyreport	t	2017-02-21 11:07:25.189-08	2017-02-21 11:07:25.189-08	3	517	http://****
8106	email	collective.monthlyreport	t	2017-02-21 11:13:03.397-08	2017-02-21 11:13:03.397-08	3	518	http://****
8112	email	collective.monthlyreport	t	2017-02-21 11:25:28.726-08	2017-02-21 11:25:28.726-08	3	519	http://****
8118	email	collective.monthlyreport	t	2017-02-21 11:34:47.023-08	2017-02-21 11:34:47.023-08	3	520	http://****
8124	email	collective.monthlyreport	t	2017-02-21 11:39:46.24-08	2017-02-21 11:39:46.24-08	3	521	http://****
8130	email	collective.monthlyreport	t	2017-02-21 11:45:19.171-08	2017-02-21 11:45:19.171-08	3	522	http://****
8075	email	collective.transaction.created	t	2017-02-21 10:35:34.614-08	2017-02-21 10:35:34.614-08	3	513	http://****
8096	email	collective.transaction.created	t	2017-02-21 11:02:21.647-08	2017-02-21 11:02:21.647-08	3	516	http://****
8102	email	collective.transaction.created	t	2017-02-21 11:07:25.322-08	2017-02-21 11:07:25.322-08	3	517	http://****
8108	email	collective.transaction.created	t	2017-02-21 11:13:03.539-08	2017-02-21 11:13:03.539-08	3	518	http://****
8114	email	collective.transaction.created	t	2017-02-21 11:25:28.823-08	2017-02-21 11:25:28.823-08	3	519	http://****
5770	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1337	280	http://****
5759	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1317	268	http://****
5760	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1319	269	http://****
5788	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1365	298	http://****
5781	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1353	291	http://****
5765	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1325	273	http://****
5782	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1354	292	http://****
5768	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1331	277	http://****
8037	email	mailinglist.admins	t	2017-02-21 08:25:28.458-08	2017-02-21 08:25:28.458-08	3	510	http://****
8045	email	mailinglist.admins	t	2017-02-21 08:55:29.657-08	2017-02-21 08:55:29.657-08	3206	511	http://****
8061	email	mailinglist.admins	t	2017-02-21 10:11:30.774-08	2017-02-21 10:11:30.774-08	3	512	http://****
8071	email	mailinglist.admins	t	2017-02-21 10:35:34.525-08	2017-02-21 10:35:34.525-08	3	513	http://****
8085	email	mailinglist.admins	t	2017-02-21 10:49:14.347-08	2017-02-21 10:49:14.347-08	3	515	http://****
8092	email	mailinglist.admins	t	2017-02-21 11:02:21.569-08	2017-02-21 11:02:21.569-08	3	516	http://****
13797	email	mailinglist.admins	t	2017-04-03 09:22:45.963-07	2017-04-03 09:22:45.963-07	3206	584	http://****
624	email	mailinglist.admins	t	2016-10-10 13:37:16.649-07	2016-10-10 13:37:16.649-07	7	10	http://****
625	email	mailinglist.admins	t	2016-10-10 13:37:16.65-07	2016-10-10 13:37:16.65-07	36	10	http://****
626	email	mailinglist.admins	t	2016-10-10 13:37:16.65-07	2016-10-10 13:37:16.65-07	37	10	http://****
627	email	mailinglist.admins	t	2016-10-10 13:37:16.651-07	2016-10-10 13:37:16.651-07	35	12	http://****
628	email	mailinglist.admins	t	2016-10-10 13:37:16.652-07	2016-10-10 13:37:16.652-07	33	13	http://****
629	email	mailinglist.admins	t	2016-10-10 13:37:16.652-07	2016-10-10 13:37:16.652-07	31	14	http://****
630	email	mailinglist.admins	t	2016-10-10 13:37:16.654-07	2016-10-10 13:37:16.654-07	32	14	http://****
633	email	mailinglist.admins	t	2016-10-10 13:37:16.654-07	2016-10-10 13:37:16.654-07	34	15	http://****
669	email	mailinglist.admins	t	2016-10-10 13:37:16.688-07	2016-10-10 13:37:16.688-07	141	47	http://****
671	email	mailinglist.admins	t	2016-10-10 13:37:16.69-07	2016-10-10 13:37:16.69-07	142	48	http://****
765	email	mailinglist.admins	t	2016-10-10 13:37:16.794-07	2016-10-10 13:37:16.794-07	72	3	http://****
770	email	mailinglist.admins	t	2016-10-10 13:37:16.795-07	2016-10-10 13:37:16.795-07	77	4	http://****
705	email	mailinglist.admins	t	2016-10-10 13:37:16.725-07	2016-10-10 13:37:16.725-07	28	2	http://****
844	email	mailinglist.admins	t	2016-10-10 13:37:16.819-07	2016-10-10 13:37:16.819-07	170	59	http://****
761	email	mailinglist.admins	t	2016-10-10 13:37:16.792-07	2016-10-10 13:37:16.792-07	68	15	http://****
768	email	mailinglist.admins	t	2016-10-10 13:37:16.795-07	2016-10-10 13:37:16.795-07	75	4	http://****
760	email	mailinglist.admins	t	2016-10-10 13:37:16.792-07	2016-10-10 13:37:16.792-07	67	13	http://****
766	email	mailinglist.admins	t	2016-10-10 13:37:16.794-07	2016-10-10 13:37:16.794-07	73	3	http://****
771	email	mailinglist.admins	t	2016-10-10 13:37:16.796-07	2016-10-10 13:37:16.796-07	78	4	http://****
762	email	mailinglist.admins	t	2016-10-10 13:37:16.793-07	2016-10-10 13:37:16.793-07	69	12	http://****
767	email	mailinglist.admins	t	2016-10-10 13:37:16.794-07	2016-10-10 13:37:16.794-07	74	4	http://****
845	email	mailinglist.admins	t	2016-10-10 13:37:16.819-07	2016-10-10 13:37:16.819-07	171	59	http://****
1261	email	mailinglist.admins	t	2016-10-10 13:37:16.962-07	2016-10-10 13:37:16.962-07	577	4	http://****
1613	email	mailinglist.admins	t	2016-10-10 13:37:17.063-07	2016-10-10 13:37:17.063-07	898	195	http://****
1612	email	mailinglist.admins	t	2016-10-10 13:37:17.063-07	2016-10-10 13:37:17.063-07	897	195	http://****
1873	email	mailinglist.admins	t	2016-10-10 13:37:17.137-07	2016-10-10 13:37:17.137-07	1145	241	http://****
2069	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1323	272	http://****
2075	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1329	276	http://****
2080	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1334	278	http://****
2085	email	mailinglist.admins	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1339	282	http://****
2091	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1345	287	http://****
2096	email	mailinglist.admins	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1350	289	http://****
2100	email	mailinglist.admins	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1355	292	http://****
2104	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1358	294	http://****
2109	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1363	297	http://****
2114	email	mailinglist.admins	t	2016-10-10 13:37:17.209-07	2016-10-10 13:37:17.209-07	1368	299	http://****
2119	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1374	300	http://****
2124	email	mailinglist.admins	t	2016-10-10 13:37:17.212-07	2016-10-10 13:37:17.212-07	1377	301	http://****
2049	email	mailinglist.admins	t	2016-10-10 13:37:17.195-07	2016-10-10 13:37:17.195-07	1304	260	http://****
2055	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1310	262	http://****
2060	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1315	265	http://****
2065	email	mailinglist.admins	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1319	269	http://****
2070	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1324	272	http://****
2076	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1330	276	http://****
2081	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1335	279	http://****
2086	email	mailinglist.admins	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1340	283	http://****
2090	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1344	286	http://****
2093	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1347	288	http://****
2101	email	mailinglist.admins	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1354	292	http://****
2107	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1360	295	http://****
2112	email	mailinglist.admins	t	2016-10-10 13:37:17.209-07	2016-10-10 13:37:17.209-07	1367	298	http://****
2117	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1371	300	http://****
2122	email	mailinglist.admins	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1379	301	http://****
2050	email	mailinglist.admins	t	2016-10-10 13:37:17.195-07	2016-10-10 13:37:17.195-07	1305	260	http://****
2056	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1311	263	http://****
2061	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1316	266	http://****
2066	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1320	270	http://****
2071	email	mailinglist.admins	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1325	273	http://****
2072	email	mailinglist.admins	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1326	274	http://****
2077	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1331	277	http://****
2082	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1336	279	http://****
2087	email	mailinglist.admins	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1341	284	http://****
2094	email	mailinglist.admins	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1348	288	http://****
2099	email	mailinglist.admins	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1353	291	http://****
2106	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1361	295	http://****
2111	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1365	298	http://****
2116	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1370	299	http://****
2121	email	mailinglist.admins	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1375	301	http://****
2125	email	mailinglist.admins	t	2016-10-10 13:37:17.212-07	2016-10-10 13:37:17.212-07	1378	301	http://****
2053	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1308	261	http://****
2057	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1312	263	http://****
2062	email	mailinglist.admins	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1314	267	http://****
2067	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1321	270	http://****
2074	email	mailinglist.admins	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1328	275	http://****
2079	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1333	278	http://****
2083	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1337	280	http://****
2088	email	mailinglist.admins	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1342	285	http://****
2095	email	mailinglist.admins	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1349	289	http://****
2098	email	mailinglist.admins	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1352	290	http://****
2105	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1359	295	http://****
2110	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1364	297	http://****
2115	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1369	299	http://****
2120	email	mailinglist.admins	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1373	300	http://****
2048	email	mailinglist.admins	t	2016-10-10 13:37:17.195-07	2016-10-10 13:37:17.195-07	1303	259	http://****
2054	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1309	262	http://****
2058	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1313	264	http://****
2063	email	mailinglist.admins	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1317	268	http://****
2068	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1322	271	http://****
2073	email	mailinglist.admins	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1327	275	http://****
2078	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1332	277	http://****
2084	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1338	281	http://****
2089	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1343	286	http://****
2092	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1346	287	http://****
2097	email	mailinglist.admins	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1351	290	http://****
2102	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1356	293	http://****
2103	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1357	294	http://****
2108	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1362	297	http://****
2113	email	mailinglist.admins	t	2016-10-10 13:37:17.209-07	2016-10-10 13:37:17.209-07	1366	298	http://****
2118	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1372	300	http://****
2123	email	mailinglist.admins	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1376	301	http://****
8098	email	mailinglist.admins	t	2017-02-21 11:07:25.188-08	2017-02-21 11:07:25.188-08	3	517	http://****
8104	email	mailinglist.admins	t	2017-02-21 11:13:03.396-08	2017-02-21 11:13:03.396-08	3	518	http://****
8110	email	mailinglist.admins	t	2017-02-21 11:25:28.726-08	2017-02-21 11:25:28.726-08	3	519	http://****
8116	email	mailinglist.admins	t	2017-02-21 11:34:47.023-08	2017-02-21 11:34:47.023-08	3	520	http://****
8122	email	mailinglist.admins	t	2017-02-21 11:39:46.24-08	2017-02-21 11:39:46.24-08	3	521	http://****
8128	email	mailinglist.admins	t	2017-02-21 11:45:19.17-08	2017-02-21 11:45:19.17-08	3	522	http://****
8138	email	mailinglist.admins	t	2017-02-21 12:04:48.982-08	2017-02-21 12:04:48.982-08	3	523	http://****
99	email	collective.monthlyreport	t	2016-08-10 17:22:42.133-07	2016-08-10 17:22:42.133-07	7	10	http://****
100	email	collective.monthlyreport	t	2016-08-10 17:22:42.133-07	2016-08-10 17:22:42.133-07	36	10	http://****
101	email	collective.monthlyreport	t	2016-08-10 17:22:42.134-07	2016-08-10 17:22:42.134-07	37	10	http://****
102	email	collective.monthlyreport	t	2016-08-10 17:22:42.135-07	2016-08-10 17:22:42.135-07	35	12	http://****
103	email	collective.monthlyreport	t	2016-08-10 17:22:42.136-07	2016-08-10 17:22:42.136-07	33	13	http://****
104	email	collective.monthlyreport	t	2016-08-10 17:22:42.136-07	2016-08-10 17:22:42.136-07	31	14	http://****
105	email	collective.monthlyreport	t	2016-08-10 17:22:42.137-07	2016-08-10 17:22:42.137-07	32	14	http://****
106	email	collective.monthlyreport	t	2016-08-10 17:22:42.139-07	2016-08-10 17:22:42.139-07	34	15	http://****
115	email	collective.monthlyreport	t	2016-08-10 17:22:42.145-07	2016-08-10 17:22:42.145-07	141	47	http://****
116	email	collective.monthlyreport	t	2016-08-10 17:22:42.146-07	2016-08-10 17:22:42.146-07	142	48	http://****
124	email	collective.monthlyreport	t	2016-08-10 17:22:42.149-07	2016-08-10 17:22:42.149-07	28	2	http://****
148	email	collective.monthlyreport	t	2016-08-10 17:22:42.162-07	2016-08-10 17:22:42.162-07	67	13	http://****
149	email	collective.monthlyreport	t	2016-08-10 17:22:42.164-07	2016-08-10 17:22:42.164-07	68	15	http://****
150	email	collective.monthlyreport	t	2016-08-10 17:22:42.164-07	2016-08-10 17:22:42.164-07	69	12	http://****
151	email	collective.monthlyreport	t	2016-08-10 17:22:42.164-07	2016-08-10 17:22:42.164-07	70	12	http://****
152	email	collective.monthlyreport	t	2016-08-10 17:22:42.165-07	2016-08-10 17:22:42.165-07	71	3	http://****
153	email	collective.monthlyreport	t	2016-08-10 17:22:42.165-07	2016-08-10 17:22:42.165-07	72	3	http://****
154	email	collective.monthlyreport	t	2016-08-10 17:22:42.166-07	2016-08-10 17:22:42.166-07	73	3	http://****
155	email	collective.monthlyreport	t	2016-08-10 17:22:42.166-07	2016-08-10 17:22:42.166-07	74	4	http://****
156	email	collective.monthlyreport	t	2016-08-10 17:22:42.166-07	2016-08-10 17:22:42.166-07	75	4	http://****
157	email	collective.monthlyreport	t	2016-08-10 17:22:42.167-07	2016-08-10 17:22:42.167-07	76	4	http://****
158	email	collective.monthlyreport	t	2016-08-10 17:22:42.167-07	2016-08-10 17:22:42.167-07	77	4	http://****
159	email	collective.monthlyreport	t	2016-08-10 17:22:42.168-07	2016-08-10 17:22:42.168-07	78	4	http://****
194	email	collective.monthlyreport	t	2016-08-10 17:22:42.182-07	2016-08-10 17:22:42.182-07	170	59	http://****
335	email	collective.monthlyreport	t	2016-08-10 17:22:42.23-07	2016-08-10 17:22:42.23-07	577	4	http://****
472	email	collective.monthlyreport	t	2016-08-10 17:22:42.274-07	2016-08-10 17:22:42.274-07	898	195	http://****
471	email	collective.monthlyreport	t	2016-08-10 17:22:42.273-07	2016-08-10 17:22:42.273-07	897	195	http://****
195	email	collective.monthlyreport	t	2016-08-10 17:22:42.182-07	2016-08-10 17:22:42.182-07	171	59	http://****
2393	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1304	260	http://****
2398	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1310	262	http://****
2403	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1315	265	http://****
2408	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1319	269	http://****
2413	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1324	272	http://****
2418	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1329	276	http://****
2423	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1334	278	http://****
2428	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1339	282	http://****
2433	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1344	286	http://****
2438	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1349	289	http://****
2442	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1353	291	http://****
2447	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1358	294	http://****
2452	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1363	297	http://****
2457	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1368	299	http://****
2462	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1374	300	http://****
2467	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1377	301	http://****
2394	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1305	260	http://****
2399	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1311	263	http://****
2405	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1314	267	http://****
2409	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1320	270	http://****
2414	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1325	273	http://****
2419	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1330	276	http://****
2424	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1335	279	http://****
2429	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1340	283	http://****
2435	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1346	287	http://****
2440	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1351	290	http://****
2444	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1355	292	http://****
2449	email	collective.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1361	295	http://****
2455	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1367	298	http://****
2460	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1371	300	http://****
2465	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1379	301	http://****
2395	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1307	261	http://****
2400	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1312	263	http://****
2404	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1316	266	http://****
2410	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1321	270	http://****
2415	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1326	274	http://****
2420	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1331	277	http://****
2425	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1336	279	http://****
2430	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1341	284	http://****
2434	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1345	287	http://****
2439	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1350	289	http://****
2445	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1356	293	http://****
2450	email	collective.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1360	295	http://****
2454	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1365	298	http://****
2459	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1370	299	http://****
2464	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1375	301	http://****
2348	email	collective.monthlyreport	t	2016-11-06 16:37:19.095-08	2016-11-06 16:37:19.095-08	1145	241	http://****
2396	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1308	261	http://****
2402	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1314	264	http://****
2407	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1318	268	http://****
2412	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1323	272	http://****
2417	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1328	275	http://****
2422	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1333	278	http://****
2427	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1338	281	http://****
2432	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1343	286	http://****
2437	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1348	288	http://****
2443	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1354	292	http://****
2448	email	collective.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1359	295	http://****
2453	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1364	297	http://****
2458	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1369	299	http://****
2463	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1373	300	http://****
2468	email	collective.monthlyreport	t	2016-11-06 16:37:19.114-08	2016-11-06 16:37:19.114-08	1378	301	http://****
8120	email	collective.transaction.created	t	2017-02-21 11:34:47.428-08	2017-02-21 11:34:47.428-08	3	520	http://****
8127	email	collective.transaction.created	t	2017-02-21 11:39:46.291-08	2017-02-21 11:39:46.291-08	3	521	http://****
8132	email	collective.transaction.created	t	2017-02-21 11:45:19.315-08	2017-02-21 11:45:19.315-08	3	522	http://****
5769	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1335	279	http://****
5777	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1345	287	http://****
5556	email	collective.expense.created	f	2016-12-28 16:13:56.266-08	2017-01-17 16:00:00-08	35	12	http://****
5775	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1342	285	http://****
5596	email	collective.expense.created	f	2016-12-28 16:13:56.284-08	2017-01-17 16:00:00-08	170	59	http://****
5753	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1307	261	http://****
5570	email	collective.expense.created	f	2016-12-28 16:13:56.274-08	2017-01-17 16:00:00-08	71	3	http://****
5790	email	collective.expense.created	f	2016-12-28 16:13:56.345-08	2017-01-17 16:00:00-08	1375	301	http://****
5571	email	collective.expense.created	f	2016-12-28 16:13:56.275-08	2017-01-17 16:00:00-08	74	4	http://****
5778	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1347	288	http://****
5773	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1340	283	http://****
5784	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1359	295	http://****
5761	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1320	270	http://****
5752	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1304	260	http://****
5787	email	collective.expense.created	f	2016-12-28 16:13:56.345-08	2017-01-17 16:00:00-08	1368	299	http://****
8038	email	collective.expense.created	t	2017-02-21 08:25:28.459-08	2017-02-21 08:25:28.459-08	3	510	http://****
8046	email	collective.expense.created	t	2017-02-21 08:55:29.658-08	2017-02-21 08:55:29.658-08	3206	511	http://****
8050	email	collective.expense.created	t	2017-02-21 08:55:29.766-08	2017-02-21 08:55:29.766-08	3	511	http://****
8062	email	collective.expense.created	t	2017-02-21 10:11:30.775-08	2017-02-21 10:11:30.775-08	3	512	http://****
8072	email	collective.expense.created	t	2017-02-21 10:35:34.525-08	2017-02-21 10:35:34.525-08	3	513	http://****
2945	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	269	http://****
2950	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	264	http://****
2955	email	collective.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	259	http://****
2916	email	collective.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	299	http://****
2921	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	293	http://****
2924	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	290	http://****
2930	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	284	http://****
2934	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	280	http://****
2940	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	274	http://****
2944	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	270	http://****
2949	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	265	http://****
2914	email	collective.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	301	http://****
2941	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	273	http://****
2946	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	268	http://****
2951	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	263	http://****
2701	email	collective.expense.created	t	2016-11-28 14:28:52.359-08	2017-01-10 16:00:00-08	3	10	http://****
2703	email	collective.expense.created	t	2016-11-28 14:28:52.36-08	2017-01-10 16:00:00-08	3	12	http://****
2704	email	collective.expense.created	t	2016-11-28 14:28:52.361-08	2017-01-10 16:00:00-08	3	13	http://****
2705	email	collective.expense.created	t	2016-11-28 14:28:52.362-08	2017-01-10 16:00:00-08	3	14	http://****
2706	email	collective.expense.created	t	2016-11-28 14:28:52.362-08	2017-01-10 16:00:00-08	3	15	http://****
2708	email	collective.expense.created	t	2016-11-28 14:28:52.365-08	2017-01-10 16:00:00-08	3	47	http://****
2709	email	collective.expense.created	t	2016-11-28 14:28:52.368-08	2017-01-10 16:00:00-08	3	48	http://****
2712	email	collective.expense.created	t	2016-11-28 14:28:52.373-08	2017-01-10 16:00:00-08	3	51	http://****
2723	email	collective.expense.created	t	2016-11-28 14:28:52.376-08	2017-01-10 16:00:00-08	3	2	http://****
2724	email	collective.expense.created	t	2016-11-28 14:28:52.377-08	2017-01-10 16:00:00-08	3	3	http://****
2725	email	collective.expense.created	t	2016-11-28 14:28:52.377-08	2017-01-10 16:00:00-08	3	4	http://****
2751	email	collective.expense.created	t	2016-11-28 14:28:52.388-08	2017-01-10 16:00:00-08	3	59	http://****
2954	email	collective.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	260	http://****
2851	email	collective.expense.created	t	2016-11-28 14:28:52.427-08	2017-01-10 16:00:00-08	3	195	http://****
2918	email	collective.expense.created	t	2016-11-28 14:28:52.444-08	2017-01-10 16:00:00-08	3	297	http://****
2923	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	291	http://****
2928	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	286	http://****
2933	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	281	http://****
2938	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	276	http://****
2943	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	271	http://****
2948	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	266	http://****
2952	email	collective.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	262	http://****
5766	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1329	276	http://****
5780	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1351	290	http://****
5557	email	collective.expense.created	f	2016-12-28 16:13:56.267-08	2017-01-17 16:00:00-08	33	13	http://****
5774	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1341	284	http://****
5751	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1303	259	http://****
5589	email	collective.expense.created	f	2016-12-28 16:13:56.281-08	2017-01-17 16:00:00-08	142	48	http://****
5552	email	collective.expense.created	f	2016-12-28 16:13:56.264-08	2017-01-17 16:00:00-08	28	2	http://****
5563	email	collective.expense.created	f	2016-12-28 16:13:56.267-08	2017-01-17 16:00:00-08	31	14	http://****
5767	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1333	278	http://****
5786	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1357	294	http://****
5776	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1343	286	http://****
5771	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1338	281	http://****
5588	email	collective.expense.created	f	2016-12-28 16:13:56.281-08	2017-01-17 16:00:00-08	141	47	http://****
5555	email	collective.expense.created	f	2016-12-28 16:13:56.265-08	2017-01-17 16:00:00-08	7	10	http://****
5757	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1316	266	http://****
5763	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1326	274	http://****
5764	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1327	275	http://****
5779	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1349	289	http://****
5758	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1314	267	http://****
5689	email	collective.expense.created	f	2016-12-28 16:13:56.324-08	2017-01-17 16:00:00-08	897	195	http://****
5733	email	collective.expense.created	f	2016-12-28 16:13:56.333-08	2017-01-17 16:00:00-08	1145	241	http://****
5762	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1323	272	http://****
5783	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1356	293	http://****
5785	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1362	297	http://****
5756	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1315	265	http://****
5754	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1309	262	http://****
5755	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1313	264	http://****
8086	email	collective.expense.created	t	2017-02-21 10:49:14.347-08	2017-02-21 10:49:14.347-08	3	515	http://****
8100	email	collective.expense.created	t	2017-02-21 11:07:25.189-08	2017-02-21 11:07:25.189-08	3	517	http://****
8105	email	collective.expense.created	t	2017-02-21 11:13:03.396-08	2017-02-21 11:13:03.396-08	3	518	http://****
8111	email	collective.expense.created	t	2017-02-21 11:25:28.726-08	2017-02-21 11:25:28.726-08	3	519	http://****
8117	email	collective.expense.created	t	2017-02-21 11:34:47.023-08	2017-02-21 11:34:47.023-08	3	520	http://****
8123	email	collective.expense.created	t	2017-02-21 11:39:46.24-08	2017-02-21 11:39:46.24-08	3	521	http://****
8129	email	collective.expense.created	t	2017-02-21 11:45:19.17-08	2017-02-21 11:45:19.17-08	3	522	http://****
8139	email	collective.expense.created	t	2017-02-21 12:04:48.983-08	2017-02-21 12:04:48.983-08	3	523	http://****
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                              4017.dat                                                                                            0000600 0004000 0002000 00000045712 13155532021 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        97	30	14	USD	100	Recurring subscription	6	2016-04-01 07:32:16.68-07	2016-04-01 07:32:16.68-07	2016-04-07 07:32:16.68-07	\N	\N	\N	71	691	\N	\N
71	8	14	USD	100	Monthly donation to wwcode seattle	8	2016-04-01 07:32:16.574-07	2017-02-02 07:06:15.567-08	\N	45	2016-04-01 07:32:16.574-07	\N	71	724	\N	\N
101	8	14	USD	100	Recurring subscription	8	2016-04-01 07:32:16.701-07	2016-04-01 07:32:16.701-07	2016-04-07 07:32:16.701-07	\N	\N	\N	71	724	\N	\N
1709	2898	48	USD	22500	Donation to WWCode Twin Cities	\N	2017-02-01 07:16:17.78-08	2017-02-01 07:16:22.469-08	\N	1801	2017-02-01 07:16:17.78-08	\N	109	742	\N	\N
1537	2561	48	USD	50000	Donation to WWCode Twin Cities	\N	2017-01-16 10:03:53.812-08	2017-01-16 10:03:57.019-08	\N	1622	2017-01-16 10:03:53.812-08	\N	109	843	\N	\N
361	642	48	USD	100	Donation to WWCode Twin Cities	\N	2016-06-21 09:06:05.176-07	2017-02-02 07:06:18.855-08	\N	432	2016-06-21 09:06:05.176-07	\N	111	768	\N	\N
700	1263	59	USD	25000	Donation to WWCode Portland	\N	2016-09-22 18:07:06.293-07	2016-09-22 18:07:10.714-07	\N	790	2016-09-22 18:07:06.293-07	\N	115	752	\N	\N
1953	1263	59	USD	25000	Donation to WWCode Portland	\N	2017-03-01 14:51:17.006-08	2017-03-01 14:51:20.789-08	\N	2048	2017-03-01 14:51:17.006-08	\N	115	752	\N	\N
1129	1846	59	USD	30000	Donation to WWCode Portland	\N	2016-11-22 07:22:36.145-08	2016-11-22 07:22:40.436-08	\N	1211	2016-11-22 07:22:36.145-08	\N	115	842	\N	\N
1098	1808	59	USD	50000	Donation to WWCode Portland	\N	2016-11-17 09:43:26.405-08	2016-11-17 09:43:31.282-08	\N	1179	2016-11-17 09:43:26.405-08	\N	115	835	\N	\N
2152	3	59	USD	20000	Google I/O travel grant: Kezia W. 	\N	2017-03-27 10:45:17.489-07	2017-03-27 10:45:17.596-07	\N	\N	2017-03-27 10:45:17.489-07		115	848	\N	\N
2154	3	277	USD	100000	Leadership Development: Google I/O Travel Grant: Lydia L.	\N	2017-03-27 10:53:48.436-07	2017-03-27 10:53:48.659-07	\N	\N	2017-03-27 10:53:48.436-07		135	848	\N	\N
1175	1908	301	EUR	25000	Donation to WWCode Berlin	\N	2016-11-29 02:03:21.531-08	2016-11-29 02:03:23.984-08	\N	1257	2016-11-29 02:03:21.531-08	\N	137	836	\N	\N
647	1158	241	USD	1000	Monthly donation to wwcode taipei	496	2016-09-09 20:42:49.15-07	2016-10-14 13:08:32.241-07	\N	731	2016-09-09 20:42:49.15-07	\N	142	806	\N	\N
812	1446	241	USD	2500	Donation to WWCode Taipei	\N	2016-10-07 09:49:14.682-07	2016-10-07 09:49:20.396-07	\N	884	2016-10-07 09:49:14.682-07	\N	141	831	\N	\N
1388	2220	259	USD	2500	Donation to WWCode Birmingham	\N	2016-12-18 17:41:26.702-08	2016-12-18 17:41:29.227-08	\N	1471	2016-12-18 17:41:26.702-08	\N	147	844	\N	\N
2003	3442	259	USD	6000	Donation to WWCode Birmingham	\N	2017-03-09 10:29:52.29-08	2017-03-09 10:29:55.868-08	\N	2104	2017-03-09 10:29:52.29-08	\N	147	789	\N	\N
13	30	12	USD	1000	Donation to WWCode Atlanta	\N	2016-04-01 07:32:16.445-07	2017-02-02 07:06:14.763-08	\N	39	2016-04-01 07:32:16.445-07	\N	158	691	\N	\N
359	642	12	USD	100	Donation to WWCode Atlanta	\N	2016-06-21 09:02:55.605-07	2017-02-02 07:06:18.833-08	\N	430	2016-06-21 09:02:55.605-07	\N	158	768	\N	\N
1531	2549	270	USD	1000	Monthly donation to WWCode Chicago	1238	2017-01-14 09:11:39.405-08	2017-01-14 09:11:43.298-08	\N	1616	2017-01-14 09:11:39.405-08	\N	162	781	\N	\N
87	2	10	USD	500	Recurring subscription	1	2016-04-01 07:32:16.648-07	2016-04-01 07:32:16.648-07	2016-04-07 07:32:16.648-07	\N	\N	\N	166	688	\N	\N
65	2	10	USD	500	Monthly donation to wwcode mexico city	1	2016-04-01 07:32:16.527-07	2017-02-02 07:06:21.656-08	\N	34	2016-04-01 07:32:16.527-07	\N	166	688	\N	\N
122	7	10	MXN	100	Recurring subscription	16	2016-04-01 07:32:16.774-07	2016-04-01 07:32:16.774-07	2016-04-01 07:32:16.774-07	\N	\N	\N	166	722	\N	\N
98	80	10	MXN	500	Recurring subscription	4	2016-04-01 07:32:16.686-07	2016-04-01 07:32:16.686-07	2016-04-07 07:32:16.686-07	\N	\N	\N	166	775	\N	\N
68	80	10	MXN	500	Monthly donation to wwcode mexico city	4	2016-04-01 07:32:16.557-07	2017-02-02 07:06:15.653-08	\N	42	2016-04-01 07:32:16.557-07	\N	166	775	\N	\N
320	8	3	USD	100	Monthly donation to wwcode new york	224	2016-06-09 10:28:13.93-07	2017-02-02 07:06:18.32-08	\N	385	2016-06-09 10:28:13.93-07	\N	170	724	\N	\N
498	896	4	USD	10000	Monthly donation to wwcode san francisco	378	2016-08-03 10:47:17.188-07	2017-02-02 07:06:20.1-08	\N	571	2016-08-03 10:47:17.188-07	\N	179	784	\N	\N
360	642	4	USD	100	Donation to WWCode San Francisco	\N	2016-06-21 09:05:00.946-07	2017-02-02 07:06:18.844-08	\N	431	2016-06-21 09:05:00.946-07	\N	180	768	\N	\N
686	1244	4	USD	0	Monthly donation to wwcode san francisco	530	2016-09-20 13:58:49.811-07	2016-10-14 13:08:32.409-07	\N	773	2016-09-20 13:58:49.811-07	\N	180	826	\N	\N
181	283	13	USD	50000	Donation to WWCode Washington DC	\N	2016-04-28 08:01:17.431-07	2017-02-02 07:06:16.319-08	\N	213	2016-04-28 08:01:17.431-07	\N	185	719	\N	\N
183	303	13	USD	50000	Donation to WWCode Washington DC	\N	2016-04-29 06:51:18.715-07	2017-02-02 07:06:16.329-08	\N	216	2016-04-29 06:51:18.715-07	\N	185	735	\N	\N
95	126	13	USD	100	Monthly donation to wwcode washington dc	33	2016-04-01 07:32:16.673-07	2017-02-02 07:06:15.838-08	\N	93	2016-04-01 07:32:16.673-07	\N	186	839	\N	\N
316	555	13	USD	100000	Donation to WWCode Washington DC	\N	2016-06-06 17:53:47.064-07	2017-02-02 07:06:18.126-08	\N	381	2016-06-06 17:53:47.064-07	\N	185	801	\N	\N
72	2	13	USD	100	Monthly donation to wwcode washington dc	2	2016-04-01 07:32:16.577-07	2017-02-02 07:06:15.583-08	\N	46	2016-04-01 07:32:16.577-07	\N	186	688	\N	\N
102	2	13	USD	100	Recurring subscription	2	2016-04-01 07:32:16.704-07	2016-04-01 07:32:16.704-07	2016-04-07 07:32:16.691-07	\N	\N	\N	186	688	\N	\N
69	30	13	USD	100	Monthly donation to wwcode washington dc	7	2016-04-01 07:32:16.561-07	2017-02-02 07:06:15.552-08	\N	43	2016-04-01 07:32:16.561-07	\N	186	691	\N	\N
99	30	13	USD	100	Recurring subscription	7	2016-04-01 07:32:16.691-07	2016-04-01 07:32:16.691-07	2016-04-07 07:32:16.691-07	\N	\N	\N	186	691	\N	\N
1712	2906	271	USD	2500	Monthly donation to WWCode Dallas	1366	2017-02-01 09:30:44.044-08	2017-02-01 09:30:50.454-08	\N	1804	2017-02-01 09:30:44.044-08	\N	195	692	\N	\N
1801	3053	15	USD	84241	Donation to WWCode Boulder/Denver	\N	2017-02-10 08:47:30.962-08	2017-02-10 08:47:34.968-08	\N	1890	2017-02-10 08:47:30.962-08	\N	197	705	\N	\N
488	883	2	USD	150000	Donation to WWCode Austin	\N	2016-08-01 08:54:13.775-07	2017-02-02 07:06:19.784-08	\N	561	2016-08-01 08:54:13.775-07	\N	199	704	\N	\N
15	108	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 07:32:16.447-07	2017-02-02 07:06:14.785-08	\N	71	2016-04-01 07:32:16.447-07	\N	199	730	\N	\N
513	192	2	USD	150000	Donation to WWCode Austin	\N	2016-08-05 13:48:07.943-07	2017-02-02 07:06:20.648-08	\N	589	2016-08-05 13:48:07.943-07	\N	199	738	\N	\N
153	224	2	USD	20000	Donation to WWCode Austin	\N	2016-04-13 09:46:10.093-07	2017-02-02 07:06:16.24-08	\N	173	2016-04-13 09:46:10.093-07	\N	199	723	\N	\N
386	686	2	USD	1000	Monthly donation to wwcode austin	286	2016-07-01 15:31:45.982-07	2017-02-02 07:06:19.11-08	\N	461	2016-07-01 15:31:45.982-07	\N	200	740	\N	\N
191	308	2	USD	150000	Donation to WWCode Austin	\N	2016-05-03 06:07:27.747-07	2017-02-02 07:06:16.352-08	\N	230	2016-05-03 06:07:27.747-07	\N	199	745	\N	\N
653	1178	2	USD	50000	Donation to WWCode Austin	\N	2016-09-12 21:15:02.18-07	2016-09-12 21:15:05.541-07	\N	737	2016-09-12 21:15:02.18-07	\N	199	755	\N	\N
312	551	2	USD	150000	Donation to WWCode Austin	\N	2016-06-06 12:04:36.791-07	2017-02-02 07:06:18.114-08	\N	377	2016-06-06 12:04:36.791-07	\N	199	762	\N	\N
489	884	2	USD	20000	Donation to WWCode Austin	\N	2016-08-01 08:55:26.677-07	2017-02-02 07:06:19.797-08	\N	562	2016-08-01 08:55:26.677-07	\N	199	793	\N	\N
258	426	2	USD	50000	Donation to WWCode Austin	\N	2016-05-23 13:27:28.19-07	2017-02-02 07:06:17.13-08	\N	306	2016-05-23 13:27:28.19-07	\N	199	802	\N	\N
364	646	2	USD	75000	Donation to WWCode Austin	\N	2016-06-22 13:09:45.975-07	2017-02-02 07:06:18.866-08	\N	435	2016-06-22 13:09:45.975-07	\N	199	772	\N	\N
246	392	2	USD	50000	Donation to WWCode Austin	\N	2016-05-19 12:24:42.786-07	2017-02-02 07:06:17.118-08	\N	288	2016-05-19 12:24:42.786-07	\N	199	825	\N	\N
1167	1890	2	USD	4000	Donation to WWCode Austin	\N	2016-11-28 07:33:12.038-08	2016-11-28 07:33:15.883-08	\N	1249	2016-11-28 07:33:12.038-08	\N	199	733	\N	\N
1466	2416	2	USD	20000	Donation to WWCode Austin	\N	2017-01-03 12:59:34.554-08	2017-01-03 12:59:38.801-08	\N	1553	2017-01-03 12:59:34.554-08	\N	199	834	\N	\N
1215	1957	2	USD	20000	Donation to WWCode Austin	\N	2016-11-30 08:11:39.696-08	2016-11-30 08:11:42.626-08	\N	1296	2016-11-30 08:11:39.696-08	\N	199	833	\N	\N
25	129	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 07:32:16.462-07	2017-02-02 07:06:14.962-08	\N	94	2016-04-01 07:32:16.462-07	\N	199	689	\N	\N
622	1094	2	USD	200000	Donation to WWCode Austin	\N	2016-09-01 07:41:33.696-07	2016-09-01 07:41:37.79-07	\N	707	2016-09-01 07:41:33.696-07	\N	199	805	\N	\N
768	1299	2	USD	19000	Donation to WWCode Austin	\N	2016-09-28 14:47:15.105-07	2016-09-28 14:47:19.41-07	\N	842	2016-09-28 14:47:15.105-07	\N	199	748	\N	\N
1935	3301	522	CAD	30000	Donation to Women Who Code Vancouver	\N	2017-02-27 16:25:15.618-08	2017-02-27 16:25:20.42-08	\N	2030	2017-02-27 16:25:15.618-08	\N	56	706	\N	\N
2783	4749	522	CAD	1000	Donation to Women Who Code Vancouver	\N	2017-05-10 16:45:43.437-07	2017-05-10 16:45:46.821-07	\N	2888	2017-05-10 16:45:43.437-07	\N	56	796	\N	\N
2212	3	286	USD	100000	Leadership Development: Google I/O Travel grant for Karina M.	\N	2017-03-31 15:32:34.085-07	2017-03-31 15:32:34.135-07	\N	\N	2017-03-31 15:32:34.085-07		68	848	\N	\N
67	30	14	USD	100	Monthly donation to wwcode seattle	6	2016-04-01 07:32:16.552-07	2017-02-02 07:06:15.538-08	\N	41	2016-04-01 07:32:16.552-07	\N	71	691	\N	\N
2214	3	286	USD	20000	Leadership Development: Conference support for Karina M. 	\N	2017-03-31 15:50:23.845-07	2017-03-31 15:50:23.931-07	2017-03-31 17:00:00-07	\N	2017-03-31 15:50:23.845-07		68	848	\N	\N
2215	3	286	USD	7500	PayPal Fees for Google I/O transfer	\N	2017-03-31 15:52:45.044-07	2017-03-31 15:52:45.089-07	\N	\N	2017-03-31 15:52:45.044-07		68	848	\N	\N
2508	3	14	USD	1480	PayPal fees Google I/O Travel Stipend	\N	2017-04-18 17:39:23.089-07	2017-04-18 17:39:23.171-07	\N	\N	2017-04-18 17:39:23.089-07		71	848	\N	\N
2817	4834	14	USD	20000	Donation to WWCode Seattle	\N	2017-05-15 05:07:56.843-07	2017-05-15 05:07:59.734-07	\N	2922	2017-05-15 05:07:56.843-07	\N	70	744	\N	\N
2636	3419	516	USD	200	Monthly donation to Women Who Code Huntsville	2031	2017-04-30 18:40:26.938-07	2017-04-30 18:40:31.729-07	\N	2749	2017-04-30 18:40:26.938-07	\N	75	702	\N	\N
2677	3	51	USD	60000	Fullstory + WWCode Atlanta	\N	2017-05-02 11:45:44.196-07	2017-05-02 11:45:44.266-07	\N	\N	2017-05-02 11:45:44.196-07		112	848	\N	\N
2644	4550	516	USD	500	Monthly donation to Women Who Code Huntsville	2039	2017-05-01 10:13:32.223-07	2017-05-01 10:13:36.337-07	\N	2757	2017-05-01 10:13:32.223-07	\N	75	758	\N	\N
2393	3	516	USD	20000	Global Development	\N	2017-04-07 05:25:51.051-07	2017-04-07 05:25:51.101-07	\N	\N	2017-04-07 05:25:51.051-07		77	848	\N	\N
2473	3	517	USD	5000	PayPal Fees	\N	2017-04-17 13:41:53.536-07	2017-04-17 13:41:53.62-07	\N	\N	2017-04-17 13:41:53.536-07		101	848	\N	\N
2490	3	430	USD	100000	Google I/O Travel Grant: Yelyzaveta L.	\N	2017-04-17 15:40:40.287-07	2017-04-17 15:40:40.376-07	\N	\N	2017-04-17 15:40:40.287-07		107	848	\N	\N
2713	3	430	USD	1200	Western Union Fees for Google I/O grant	\N	2017-05-04 11:58:24.782-07	2017-05-04 11:58:24.948-07	\N	\N	2017-05-04 11:58:24.782-07		108	848	\N	\N
2694	3	51	USD	30000	User Testing and WWCode ATL	\N	2017-05-03 10:33:13.357-07	2017-05-03 10:33:13.7-07	\N	\N	2017-05-03 10:33:13.357-07		112	848	\N	\N
2697	3	51	USD	15000	Zapier + WWCode Atlanta	\N	2017-05-03 10:44:48.667-07	2017-05-03 10:44:48.731-07	\N	\N	2017-05-03 10:44:48.667-07		112	848	\N	\N
2532	4348	59	USD	10000	Donation to WWCode Portland	\N	2017-04-20 03:17:20.169-07	2017-04-20 03:17:23.35-07	\N	2643	2017-04-20 03:17:20.169-07	\N	115	703	\N	\N
2522	3	59	USD	610	PayPal Fees for Google I/O	\N	2017-04-19 11:35:02.98-07	2017-04-19 11:35:03.062-07	\N	\N	2017-04-19 11:35:02.98-07		116	848	\N	\N
2794	3	59	USD	90000	Adroit Resources - Global Development	\N	2017-05-11 09:41:16.673-07	2017-05-11 09:41:16.796-07	\N	\N	2017-05-11 09:41:16.673-07		115	848	\N	\N
2710	3	276	USD	2175	In honour of Maya Johnston	\N	2017-05-04 09:21:53.626-07	2017-05-04 09:21:53.703-07	\N	\N	2017-05-04 09:21:53.626-07		134	848	\N	\N
2471	3	277	USD	9000	PayPal fees to transfer Google I/O stipend	\N	2017-04-17 12:41:07.575-07	2017-04-17 12:41:07.676-07	\N	\N	2017-04-17 12:41:07.575-07		135	848	\N	\N
2153	3	277	USD	100000	Leadership Development: Google I/O travel grant: Chee Yim G.	\N	2017-03-27 10:52:38.07-07	2017-03-27 10:52:38.138-07	\N	\N	2017-03-27 10:52:38.07-07		135	848	\N	\N
2741	3	301	EUR	16563	Regional Leadership Event: Sofia	\N	2017-05-08 08:30:18.503-07	2017-05-08 08:30:18.616-07	\N	\N	2017-05-08 08:30:18.503-07		137	848	\N	\N
2507	3	195	USD	1400	PayPal Fees for Google I/O	\N	2017-04-18 17:31:31.884-07	2017-04-18 17:31:31.962-07	\N	\N	2017-04-18 17:31:31.884-07		140	848	\N	\N
2702	3	259	USD	2175	Catherine L. - fees and Global development	\N	2017-05-03 17:12:19.758-07	2017-05-03 17:12:19.828-07	\N	\N	2017-05-03 17:12:19.758-07		148	848	\N	\N
2208	3	278	GBP	80500	Google I/O travel grant: Kanke I.	\N	2017-03-31 10:54:33.373-07	2017-03-31 10:54:33.566-07	\N	\N	2017-03-31 10:54:33.373-07		155	848	\N	\N
2209	3	278	GBP	39800	Google I/O travel grant: Anastasia D. 	\N	2017-03-31 11:01:48.379-07	2017-03-31 11:01:48.43-07	\N	\N	2017-03-31 11:01:48.379-07		155	848	\N	\N
2474	3	278	GBP	85000	Travel Stipend for CONNECT	\N	2017-04-17 14:05:14.99-07	2017-04-17 14:05:15.087-07	\N	\N	2017-04-17 14:05:14.99-07		155	848	\N	\N
2486	3	278	GBP	41000	Leadership Development: Director Stipend to attend NY Stock Exchange Bell Ringing	\N	2017-04-17 15:31:52.609-07	2017-04-17 15:31:52.754-07	\N	\N	2017-04-17 15:31:52.609-07		155	848	\N	\N
2503	3	278	GBP	3562	PayPal Fees for Google I/O travel stipend	\N	2017-04-18 12:41:30.217-07	2017-04-18 12:41:30.305-07	\N	\N	2017-04-18 12:41:30.217-07		155	848	\N	\N
2475	3	278	GBP	4250	PayPal Fees	\N	2017-04-17 14:06:54.729-07	2017-04-17 14:06:54.818-07	\N	\N	2017-04-17 14:06:54.729-07		155	848	\N	\N
2206	3	267	GBP	79600	Google I/O Travel Grant: Rabeb O. 	\N	2017-03-31 10:20:23.87-07	2017-03-31 10:20:23.928-07	\N	\N	2017-03-31 10:20:23.87-07		153	848	\N	\N
2470	3	267	GBP	4000	PayPal Fees to transfer Google I/O stipend	\N	2017-04-17 12:31:52.832-07	2017-04-17 12:31:52.941-07	\N	\N	2017-04-17 12:31:52.832-07		153	848	\N	\N
2505	3	12	USD	1198	PayPal Fees Google I/O Ticket	\N	2017-04-18 17:19:14.259-07	2017-04-18 17:19:14.339-07	\N	\N	2017-04-18 17:19:14.259-07		158	848	\N	\N
2506	3	12	USD	1480	PayPal Fees Google I/O Ticket	\N	2017-04-18 17:20:11.451-07	2017-04-18 17:20:11.557-07	\N	\N	2017-04-18 17:20:11.451-07		158	848	\N	\N
2676	3	12	USD	300000	FullStory - Global Development	\N	2017-05-02 11:43:43.093-07	2017-05-02 11:43:43.175-07	\N	\N	2017-05-02 11:43:43.093-07		157	848	\N	\N
2696	3	12	USD	75000	Zapier - Global Development	\N	2017-05-03 10:44:10.796-07	2017-05-03 10:44:10.856-07	\N	\N	2017-05-03 10:44:10.796-07		157	848	\N	\N
2693	3	12	USD	150000	User Testing - Global Development	\N	2017-05-03 10:32:39.617-07	2017-05-03 10:32:39.663-07	\N	\N	2017-05-03 10:32:39.617-07		157	848	\N	\N
2477	3	270	USD	100000	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	\N	2017-04-17 15:09:42.506-07	2017-04-17 15:09:42.582-07	\N	\N	2017-04-17 15:09:42.506-07		161	848	\N	\N
2520	3	3	USD	40000	Google I/O Travel Expense	\N	2017-04-19 11:26:01.156-07	2017-04-19 11:26:01.247-07	\N	\N	2017-04-19 11:26:01.156-07		169	848	\N	\N
2521	3	3	USD	1190	PayPal Fees for Google I/O	\N	2017-04-19 11:26:58.952-07	2017-04-19 11:26:59.01-07	\N	\N	2017-04-19 11:26:58.952-07		170	848	\N	\N
2662	3	3	USD	2930	PayPal fees for Google I/O	\N	2017-05-01 17:33:45.604-07	2017-05-01 17:33:45.819-07	\N	\N	2017-05-01 17:33:45.604-07		169	848	\N	\N
2430	4173	13	USD	2500	Donation to WWCode Washington DC	\N	2017-04-11 19:05:32.82-07	2017-04-11 19:05:36.109-07	\N	2546	2017-04-11 19:05:32.82-07	\N	185	693	\N	\N
2649	3	13	USD	154800	iOS Dev Camp 2016 (Capital One)	\N	2017-05-01 11:02:20.457-07	2017-05-01 11:02:20.53-07	\N	\N	2017-05-01 11:02:20.457-07		185	848	\N	\N
2421	4153	13	USD	25000	Donation to WWCode Washington DC	\N	2017-04-10 18:09:47.558-07	2017-04-10 18:09:50.716-07	\N	2535	2017-04-10 18:09:47.558-07	\N	185	701	\N	\N
2217	3	291	CAD	50000	Google I/O Travel Grant: Evangelique L.	\N	2017-03-31 16:37:30.782-07	2017-03-31 16:37:30.831-07	\N	\N	2017-03-31 16:37:30.782-07		187	848	\N	\N
2755	4720	2	USD	84000	Donation to WWCode Austin	\N	2017-05-09 11:14:19.702-07	2017-05-09 11:14:23.386-07	\N	2860	2017-05-09 11:14:19.702-07	\N	199	697	\N	\N
2332	3999	2	USD	20000	Donation to WWCode Austin	\N	2017-04-04 12:51:02.781-07	2017-04-04 12:51:04.976-07	\N	2438	2017-04-04 12:51:02.781-07	\N	199	707	\N	\N
2204	3	2	USD	50000	Google I/O Travel Grant: Patricia C. 	\N	2017-03-31 10:17:51.642-07	2017-03-31 10:17:51.712-07	\N	\N	2017-03-31 10:17:51.642-07		199	848	\N	\N
2519	3	2	USD	1480	PayPal Fee for Google I/O Ticket	\N	2017-04-19 11:18:17.942-07	2017-04-19 11:18:19.333-07	\N	\N	2017-04-19 11:18:17.942-07		200	848	\N	\N
2488	3	511	MXN	18800	Leadership Development: Director travel stipend to attend CONNECT 2017	\N	2017-04-17 15:35:06.028-07	2017-04-17 15:35:06.109-07	\N	\N	2017-04-17 15:35:06.028-07		95	848	\N	\N
2487	3	511	MXN	25000	Leadership Development: Director Travel Stipend to attend CONNECT 2017	\N	2017-04-17 15:34:32.173-07	2017-04-17 15:34:32.292-07	\N	\N	2017-04-17 15:34:32.173-07		95	848	\N	\N
808	1438	2	USD	12500	Donation to WWCode Austin	\N	2016-10-06 11:36:35.208-07	2016-10-06 11:36:39.093-07	\N	880	2016-10-06 11:36:35.208-07	\N	199	830	\N	\N
2750	4711	517	USD	1000	Monthly donation to Women Who Code Manila	2103	2017-05-08 22:59:11.956-07	2017-05-08 22:59:17.596-07	\N	2855	2017-05-08 22:59:11.956-07	\N	99	832	\N	\N
1389	2220	259	USD	2500	Donation to WWCode Birmingham	\N	2016-12-18 17:41:58.846-08	2016-12-18 17:42:01.434-08	2016-12-27 16:00:00-08	1472	2016-12-18 17:41:58.846-08	\N	147	844	\N	\N
100	30	13	USD	100	Recurring subscription	3	2016-04-01 07:32:16.697-07	2016-04-01 07:32:16.697-07	2016-04-07 07:32:16.691-07	\N	\N	\N	186	691	\N	\N
64	192	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 07:32:16.52-07	2017-02-02 07:06:15.499-08	\N	152	2016-04-01 07:32:16.52-07	\N	199	738	\N	\N
2489	3	511	MXN	2200	PayPal Fees	\N	2017-04-17 15:35:54.945-07	2017-04-17 15:35:55.035-07	\N	\N	2017-04-17 15:35:54.945-07		95	848	\N	\N
2472	3	517	USD	100000	Director Travel Stipend CONNECT	\N	2017-04-17 13:41:37.54-07	2017-04-17 13:41:37.67-07	\N	\N	2017-04-17 13:41:37.54-07		101	848	\N	\N
1557	2594	48	USD	10000	Donation to WWCode Twin Cities	\N	2017-01-18 05:54:47.782-08	2017-01-18 05:54:51.04-08	\N	1647	2017-01-18 05:54:47.782-08	\N	109	846	\N	\N
2151	3	12	USD	50000	Leadership Development: Google i/o grant for Alicia C.	\N	2017-03-27 10:10:04.532-07	2017-03-27 10:10:04.637-07	\N	\N	2017-03-27 10:10:04.532-07		157	848	\N	\N
83	7	10	MXN	100	Monthly donation to wwcode mexico city	16	2016-04-01 07:32:16.636-07	2016-10-14 13:08:31.996-07	\N	\N	\N	\N	166	722	\N	\N
70	30	13	USD	100	Monthly donation to wwcode washington dc	3	2016-04-01 07:32:16.57-07	2017-02-02 07:06:21.68-08	\N	44	2016-04-01 07:32:16.57-07	\N	186	691	\N	\N
\.


                                                      4027.dat                                                                                            0000600 0004000 0002000 00000000005 13155532021 0014236 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4011.dat                                                                                            0000600 0004000 0002000 00000071456 13155532021 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        43	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 09:04:53.229-08	2016-02-02 09:04:53.229-08	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
41	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 08:36:35.761-08	2016-02-02 08:36:35.761-08	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
44	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 09:09:19.757-08	2016-02-02 09:09:19.757-08	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
39	*****@paypal.com	*****	*****	stripe	\N	2016-01-29 14:23:51.784-08	2016-01-29 14:23:51.784-08	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
51	*****@paypal.com	*****	*****	stripe	\N	2016-02-09 20:12:33.556-08	2016-02-09 20:12:33.556-08	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
80	*****@paypal.com	*****	*****	stripe	\N	2016-02-25 15:45:02.363-08	2016-02-25 15:45:02.363-08	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
203	*****@paypal.com	*****	*****	stripe	\N	2016-04-25 07:42:01.738-07	2016-04-25 07:42:02.272-07	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
323	*****@paypal.com	*****	*****	stripe	\N	2016-05-26 17:52:12.759-07	2016-05-26 17:52:14.148-07	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
507	*****@paypal.com	*****	*****	stripe	\N	2016-07-12 14:19:35.579-07	2016-07-12 14:19:36.177-07	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
572	*****@paypal.com	*****	*****	stripe	\N	2016-08-03 12:30:20.399-07	2016-08-03 12:30:20.964-07	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
703	*****@paypal.com	*****	*****	stripe	\N	2016-08-31 11:22:18.085-07	2016-08-31 11:22:28.874-07	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
715	*****@paypal.com	*****	*****	stripe	\N	2016-09-05 09:25:43.529-07	2016-09-05 09:25:44.192-07	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
561	*****@paypal.com	*****	*****	stripe	\N	2016-08-01 08:54:11.721-07	2016-08-01 08:54:12.394-07	\N	\N	883	\N	\N	704	2017-08-28 15:47:15.636-07	\N	f	\N
213	*****@paypal.com	*****	*****	stripe	\N	2016-04-28 08:01:14.747-07	2016-04-28 08:01:15.975-07	\N	\N	283	\N	\N	719	2017-08-28 15:47:15.649-07	\N	f	\N
64	*****@paypal.com	*****	*****	stripe	\N	2016-02-15 10:46:04.238-08	2016-02-15 10:46:04.238-08	\N	\N	7	\N	\N	722	2017-08-28 15:47:15.653-07	\N	f	\N
173	*****@paypal.com	*****	*****	stripe	\N	2016-04-13 09:46:07.391-07	2016-04-13 09:46:08.785-07	\N	\N	224	\N	\N	723	2017-08-28 15:47:15.655-07	\N	f	\N
45	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 13:46:42.678-08	2016-02-02 13:46:42.678-08	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
90	*****@paypal.com	*****	*****	stripe	\N	2016-02-29 17:35:13.096-08	2016-02-29 17:35:13.096-08	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
124	*****@paypal.com	*****	*****	stripe	\N	2016-03-17 08:29:28.675-07	2016-03-17 08:29:28.674-07	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
110	*****@paypal.com	*****	*****	stripe	\N	2016-03-07 19:35:50.332-08	2016-03-07 19:35:50.332-08	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
189	*****@paypal.com	*****	*****	paypal	\N	2016-04-20 07:14:38.754-07	2016-04-20 07:15:18.774-07	2016-04-20 07:15:18.772-07	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
385	*****@paypal.com	*****	*****	stripe	\N	2016-06-09 10:28:10.609-07	2016-06-09 10:28:11.319-07	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
587	*****@paypal.com	*****	*****	stripe	\N	2016-08-04 14:49:06.957-07	2016-08-04 14:49:07.534-07	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
701	*****@paypal.com	*****	*****	stripe	\N	2016-08-31 01:34:48.855-07	2016-08-31 01:34:49.606-07	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
789	*****@paypal.com	*****	*****	stripe	\N	2016-09-22 11:56:45.915-07	2016-09-22 11:56:47.116-07	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
885	*****@paypal.com	*****	*****	stripe	\N	2016-10-07 13:46:31.454-07	2016-10-07 13:46:32.168-07	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
911	*****@paypal.com	*****	*****	stripe	\N	2016-10-15 08:47:38.174-07	2016-10-15 08:47:38.802-07	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
71	*****@paypal.com	*****	*****	stripe	\N	2016-02-18 11:54:06.513-08	2016-02-18 11:54:06.513-08	\N	\N	108	\N	\N	730	2017-08-28 15:47:15.66-07	\N	f	\N
216	*****@paypal.com	*****	*****	stripe	\N	2016-04-29 06:51:16.73-07	2016-04-29 06:51:17.252-07	\N	\N	303	\N	\N	735	2017-08-28 15:47:15.664-07	\N	f	\N
152	*****@paypal.com	*****	*****	stripe	\N	2016-03-25 08:11:03.086-07	2016-03-25 08:11:03.086-07	\N	\N	192	\N	\N	738	2017-08-28 15:47:15.667-07	\N	f	\N
589	*****@paypal.com	*****	*****	stripe	\N	2016-08-05 13:48:05.525-07	2016-08-05 13:48:06.15-07	\N	\N	192	\N	\N	738	2017-08-28 15:47:15.667-07	\N	f	\N
461	*****@paypal.com	*****	*****	stripe	\N	2016-07-01 15:31:42.782-07	2016-07-01 15:31:43.38-07	\N	\N	686	\N	\N	740	2017-08-28 15:47:15.668-07	\N	f	\N
219	*****@paypal.com	*****	*****	stripe	\N	2016-04-29 11:46:16.188-07	2016-04-29 11:46:16.688-07	\N	\N	308	\N	\N	745	2017-08-28 15:47:15.676-07	\N	f	\N
230	*****@paypal.com	*****	*****	stripe	\N	2016-05-03 06:07:25.728-07	2016-05-03 06:07:26.509-07	\N	\N	308	\N	\N	745	2017-08-28 15:47:15.676-07	\N	f	\N
790	*****@paypal.com	*****	*****	stripe	\N	2016-09-22 18:07:06.282-07	2016-09-22 18:07:07.667-07	\N	\N	1263	\N	\N	752	2017-08-28 15:47:15.679-07	\N	f	\N
842	*****@paypal.com	*****	*****	stripe	\N	2016-09-28 14:47:15.094-07	2016-09-28 14:47:16.348-07	\N	\N	1299	\N	\N	748	2017-08-28 15:47:15.68-07	\N	f	\N
737	*****@paypal.com	*****	*****	stripe	\N	2016-09-12 21:15:02.169-07	2016-09-12 21:15:02.814-07	\N	\N	1178	\N	\N	755	2017-08-28 15:47:15.684-07	\N	f	\N
377	*****@paypal.com	*****	*****	stripe	\N	2016-06-06 12:04:34.62-07	2016-06-06 12:04:35.385-07	\N	\N	551	\N	\N	762	2017-08-28 15:47:15.688-07	\N	f	\N
430	*****@paypal.com	*****	*****	stripe	\N	2016-06-21 09:02:53.255-07	2016-06-21 09:02:53.912-07	\N	\N	642	\N	\N	768	2017-08-28 15:47:15.695-07	\N	f	\N
431	*****@paypal.com	*****	*****	stripe	\N	2016-06-21 09:04:57.958-07	2016-06-21 09:04:59.511-07	\N	\N	642	\N	\N	768	2017-08-28 15:47:15.695-07	\N	f	\N
432	*****@paypal.com	*****	*****	stripe	\N	2016-06-21 09:06:02.746-07	2016-06-21 09:06:03.475-07	\N	\N	642	\N	\N	768	2017-08-28 15:47:15.695-07	\N	f	\N
435	*****@paypal.com	*****	*****	stripe	\N	2016-06-22 13:09:44.066-07	2016-06-22 13:09:44.651-07	\N	\N	646	\N	\N	772	2017-08-28 15:47:15.698-07	\N	f	\N
42	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 08:52:00.333-08	2016-02-02 08:52:00.333-08	\N	\N	80	\N	\N	775	2017-08-28 15:47:15.702-07	\N	f	\N
571	*****@paypal.com	*****	*****	stripe	\N	2016-08-03 10:47:13.706-07	2016-08-03 10:47:14.326-07	\N	\N	896	\N	\N	784	2017-08-28 15:47:15.708-07	\N	f	\N
562	*****@paypal.com	*****	*****	stripe	\N	2016-08-01 08:55:23.426-07	2016-08-01 08:55:24.6-07	\N	\N	884	\N	\N	793	2017-08-28 15:47:15.714-07	\N	f	\N
381	*****@paypal.com	*****	*****	stripe	\N	2016-06-06 17:53:45.068-07	2016-06-06 17:53:45.674-07	\N	\N	555	\N	\N	801	2017-08-28 15:47:15.72-07	\N	f	\N
306	*****@paypal.com	*****	*****	stripe	\N	2016-05-23 13:27:26.16-07	2016-05-23 13:27:26.962-07	\N	\N	426	\N	\N	802	2017-08-28 15:47:15.723-07	\N	f	\N
731	*****@paypal.com	*****	*****	stripe	\N	2016-09-09 20:42:49.13-07	2016-09-09 20:42:49.63-07	\N	\N	1158	\N	\N	806	2017-08-28 15:47:15.725-07	\N	f	\N
707	*****@paypal.com	*****	*****	stripe	\N	2016-09-01 07:41:33.663-07	2016-09-01 07:41:34.394-07	\N	\N	1094	\N	\N	805	2017-08-28 15:47:15.725-07	\N	f	\N
773	*****@paypal.com	*****	*****	stripe	\N	2016-09-20 13:58:49.788-07	2016-09-20 13:58:50.526-07	\N	\N	1244	\N	\N	826	2017-08-28 15:47:15.744-07	\N	f	\N
880	*****@paypal.com	*****	*****	stripe	\N	2016-10-06 11:36:35.196-07	2016-10-06 11:36:35.794-07	\N	\N	1438	\N	\N	830	2017-08-28 15:47:15.75-07	\N	f	\N
884	*****@paypal.com	*****	*****	stripe	\N	2016-10-07 09:49:14.672-07	2016-10-07 09:49:15.283-07	\N	\N	1446	\N	\N	831	2017-08-28 15:47:15.75-07	\N	f	\N
26	*****@paypal.com	*****	*****	paypal	\N	2015-12-18 12:07:43.76-08	2016-05-26 08:38:39.069-07	2015-12-18 13:52:39.247-08	2016-05-26 08:38:39.068-07	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
320	*****@paypal.com	*****	*****	paypal	\N	2016-05-26 08:37:59.825-07	2016-05-26 08:38:38.996-07	2016-05-26 08:38:38.994-07	2016-08-03 14:40:05.198-07	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
176	*****@paypal.com	*****	*****	stripe	\N	2016-04-14 11:12:55.955-07	2016-04-14 11:12:56.555-07	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
1811	*****@paypal.com	*****	*****	stripe	\N	2017-02-01 13:53:00.461-08	2017-02-01 13:53:01.901-08	\N	\N	30	\N	\N	691	2017-08-28 15:47:15.623-07	\N	f	\N
1804	*****@paypal.com	*****	*****	stripe	\N	2017-02-01 09:30:44.023-08	2017-02-01 09:30:45.232-08	\N	\N	2906	\N	\N	692	2017-08-28 15:47:15.624-07	\N	f	\N
2546	*****@paypal.com	*****	*****	stripe	\N	2017-04-11 19:05:32.807-07	2017-04-11 19:05:33.502-07	\N	\N	4173	\N	\N	693	2017-08-28 15:47:15.626-07	\N	f	\N
1793	*****@paypal.com	*****	*****	stripe	\N	2017-01-31 07:51:34.575-08	2017-01-31 07:51:36.336-08	\N	\N	1325	\N	\N	700	2017-08-28 15:47:15.631-07	\N	f	\N
2535	*****@paypal.com	*****	*****	stripe	\N	2017-04-10 18:09:47.541-07	2017-04-10 18:09:48.354-07	\N	\N	4153	\N	\N	701	2017-08-28 15:47:15.633-07	\N	f	\N
2642	*****@paypal.com	*****	*****	stripe	\N	2017-04-20 02:34:08.282-07	2017-04-20 02:34:09.518-07	\N	\N	4348	\N	\N	703	2017-08-28 15:47:15.635-07	\N	f	\N
2643	*****@paypal.com	*****	*****	stripe	\N	2017-04-20 03:17:20.159-07	2017-04-20 03:17:21.398-07	\N	\N	4348	\N	\N	703	2017-08-28 15:47:15.635-07	\N	f	\N
1890	*****@paypal.com	*****	*****	stripe	\N	2017-02-10 08:47:30.914-08	2017-02-10 08:47:31.716-08	\N	\N	3053	\N	\N	705	2017-08-28 15:47:15.636-07	\N	f	\N
2030	*****@paypal.com	*****	*****	stripe	\N	2017-02-27 16:25:15.595-08	2017-02-27 16:25:16.385-08	\N	\N	3301	\N	\N	706	2017-08-28 15:47:15.638-07	\N	f	\N
2438	*****@paypal.com	*****	*****	stripe	\N	2017-04-04 12:51:02.77-07	2017-04-04 12:51:03.349-07	\N	\N	3999	\N	\N	707	2017-08-28 15:47:15.639-07	\N	f	\N
1111	*****@paypal.com	*****	*****	stripe	\N	2016-11-03 08:52:11.942-07	2016-11-03 08:52:12.638-07	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
1348	*****@paypal.com	*****	*****	stripe	\N	2016-12-02 11:17:05.459-08	2016-12-02 11:17:06.168-08	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
1744	*****@paypal.com	*****	*****	stripe	\N	2017-01-28 16:05:21.392-08	2017-01-28 16:05:21.978-08	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
2091	*****@paypal.com	*****	*****	stripe	\N	2017-03-07 13:36:22.758-08	2017-03-07 13:36:23.955-08	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
1249	*****@paypal.com	*****	*****	stripe	\N	2016-11-28 07:33:12.012-08	2016-11-28 07:33:12.766-08	\N	\N	1890	\N	\N	733	2017-08-28 15:47:15.663-07	\N	f	\N
1801	*****@paypal.com	*****	*****	stripe	\N	2017-02-01 07:16:17.747-08	2017-02-01 07:16:18.471-08	\N	\N	2898	\N	\N	742	2017-08-28 15:47:15.67-07	\N	f	\N
2048	*****@paypal.com	*****	*****	stripe	\N	2017-03-01 14:51:16.983-08	2017-03-01 14:51:18.471-08	\N	\N	1263	\N	\N	752	2017-08-28 15:47:15.679-07	\N	f	\N
1616	*****@paypal.com	*****	*****	stripe	\N	2017-01-14 09:11:39.386-08	2017-01-14 09:11:39.965-08	\N	\N	2549	\N	\N	781	2017-08-28 15:47:15.706-07	\N	f	\N
2104	*****@paypal.com	*****	*****	stripe	\N	2017-03-09 10:29:52.21-08	2017-03-09 10:29:53.195-08	\N	\N	3442	\N	\N	789	2017-08-28 15:47:15.712-07	\N	f	\N
288	*****@paypal.com	*****	*****	stripe	\N	2016-05-19 12:24:40.781-07	2016-05-19 12:24:41.33-07	\N	\N	392	\N	\N	825	2017-08-28 15:47:15.743-07	\N	f	\N
1296	*****@paypal.com	*****	*****	stripe	\N	2016-11-30 08:11:39.675-08	2016-11-30 08:11:40.34-08	\N	\N	1957	\N	\N	833	2017-08-28 15:47:15.75-07	\N	f	\N
1553	*****@paypal.com	*****	*****	stripe	\N	2017-01-03 12:59:34.532-08	2017-01-03 12:59:35.653-08	\N	\N	2416	\N	\N	834	2017-08-28 15:47:15.753-07	\N	f	\N
1179	*****@paypal.com	*****	*****	stripe	\N	2016-11-17 09:43:26.371-08	2016-11-17 09:43:27.368-08	\N	\N	1808	\N	\N	835	2017-08-28 15:47:15.754-07	\N	f	\N
1257	*****@paypal.com	*****	*****	stripe	\N	2016-11-29 02:03:21.517-08	2016-11-29 02:03:22.16-08	\N	\N	1908	\N	\N	836	2017-08-28 15:47:15.755-07	\N	f	\N
1211	*****@paypal.com	*****	*****	stripe	\N	2016-11-22 07:22:36.125-08	2016-11-22 07:22:37.512-08	\N	\N	1846	\N	\N	842	2017-08-28 15:47:15.761-07	\N	f	\N
1622	*****@paypal.com	*****	*****	stripe	\N	2017-01-16 10:03:53.804-08	2017-01-16 10:03:54.509-08	\N	\N	2561	\N	\N	843	2017-08-28 15:47:15.762-07	\N	f	\N
1471	*****@paypal.com	*****	*****	stripe	\N	2016-12-18 17:41:26.69-08	2016-12-18 17:41:27.187-08	\N	\N	2220	\N	\N	844	2017-08-28 15:47:15.763-07	\N	f	\N
1472	*****@paypal.com	*****	*****	stripe	\N	2016-12-18 17:41:58.818-08	2016-12-18 17:41:59.328-08	\N	\N	2220	\N	\N	844	2017-08-28 15:47:15.763-07	\N	f	\N
1645	*****@paypal.com	*****	*****	stripe	\N	2017-01-18 05:51:43.462-08	2017-01-18 05:51:44.621-08	\N	\N	2594	\N	\N	846	2017-08-28 15:47:15.765-07	\N	f	\N
1646	*****@paypal.com	*****	*****	stripe	\N	2017-01-18 05:53:28.297-08	2017-01-18 05:53:29.29-08	\N	\N	2594	\N	\N	846	2017-08-28 15:47:15.765-07	\N	f	\N
1647	*****@paypal.com	*****	*****	stripe	\N	2017-01-18 05:54:47.775-08	2017-01-18 05:54:48.732-08	\N	\N	2594	\N	\N	846	2017-08-28 15:47:15.765-07	\N	f	\N
971	*****@paypal.com	*****	*****	paypal	\N	2016-10-22 03:52:05.33-07	2016-10-22 03:52:05.881-07	\N	2016-10-27 14:01:07.137-07	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
573	*****@paypal.com	*****	*****	paypal	\N	2016-08-03 14:38:52.082-07	2016-08-03 14:40:05.094-07	2016-08-03 14:40:05.093-07	2016-10-27 14:02:50.674-07	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1043	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 14:12:07.923-07	2016-10-31 14:12:53.002-07	2016-10-31 14:12:53.002-07	2016-10-31 14:34:17.33-07	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1024	*****@paypal.com	*****	*****	paypal	\N	2016-10-27 14:01:07.153-07	2016-10-27 14:02:50.617-07	2016-10-27 14:02:50.616-07	2016-10-31 14:08:26.464-07	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
19	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 01:42:57.058-08	2015-12-16 10:22:05.853-08	\N	2015-12-16 10:22:05.842-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
18	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 01:42:53.531-08	2015-12-16 01:42:57.019-08	\N	2015-12-16 01:42:57.018-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
17	*****@paypal.com	*****	*****	paypal	\N	2015-12-15 19:05:01.805-08	2015-12-16 10:22:39.715-08	2015-12-15 19:05:25.467-08	2015-12-16 10:22:39.714-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
24	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 10:28:34.146-08	2015-12-16 10:28:36.228-08	\N	2015-12-16 10:28:36.227-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
29	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:51:35.761-08	2016-01-12 09:54:45.421-08	2016-01-12 09:52:16.235-08	2016-01-12 09:54:45.421-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
27	*****@paypal.com	*****	*****	stripe	\N	2016-01-06 16:55:36.615-08	2016-01-06 16:55:36.615-08	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
25	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 10:28:36.264-08	2016-01-12 09:52:16.325-08	2015-12-16 10:29:24.829-08	2016-01-12 09:52:16.323-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
30	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:53:19.259-08	2016-01-12 09:53:20.842-08	\N	2016-01-12 09:53:20.841-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
31	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:53:20.88-08	2016-01-12 09:54:22.364-08	\N	2016-01-12 09:54:22.343-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
34	*****@paypal.com	*****	*****	stripe	\N	2016-01-18 15:54:03.69-08	2016-01-18 15:54:03.69-08	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
32	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:54:22.442-08	2016-01-21 22:25:25.222-08	2016-01-12 09:54:45.399-08	2016-01-21 22:25:25.222-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
36	*****@paypal.com	*****	*****	paypal	\N	2016-01-23 10:23:35.682-08	2016-03-10 08:54:14.551-08	2016-01-23 10:23:58.941-08	2016-03-10 08:54:14.542-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
119	*****@paypal.com	*****	*****	paypal	\N	2016-03-11 13:34:11.535-08	2016-03-25 21:12:54.174-07	\N	2016-03-25 21:12:54.171-07	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
46	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 15:09:03.515-08	2016-02-02 15:09:03.515-08	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
68	*****@paypal.com	*****	*****	stripe	\N	2016-02-16 16:12:43.167-08	2016-02-16 16:12:43.165-08	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
105	*****@paypal.com	*****	*****	paypal	\N	2016-03-05 10:48:06.494-08	2016-03-10 08:53:49.77-08	\N	2016-03-10 08:53:49.769-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
117	*****@paypal.com	*****	*****	paypal	\N	2016-03-10 08:53:49.777-08	2016-03-10 08:54:14.484-08	2016-03-10 08:54:14.479-08	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
35	*****@paypal.com	*****	*****	paypal	\N	2016-01-21 22:24:39.343-08	2016-01-23 10:23:58.964-08	2016-01-21 22:25:25.199-08	2016-01-23 10:23:58.964-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
109	*****@paypal.com	*****	*****	stripe	\N	2016-03-07 18:43:27.661-08	2016-03-07 18:43:27.661-08	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
252	*****@paypal.com	*****	*****	stripe	\N	2016-05-10 10:19:56.78-07	2016-05-10 10:19:58.837-07	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
494	*****@paypal.com	*****	*****	stripe	\N	2016-07-08 09:25:56.621-07	2016-07-08 09:25:58.207-07	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
495	*****@paypal.com	*****	*****	stripe	\N	2016-07-08 10:24:14.577-07	2016-07-08 10:24:15.71-07	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
524	*****@paypal.com	*****	*****	stripe	\N	2016-07-18 14:00:51.641-07	2016-07-18 14:00:52.921-07	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
567	*****@paypal.com	*****	*****	stripe	\N	2016-08-02 21:54:45.226-07	2016-08-02 21:54:46.256-07	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
1040	*****@paypal.com	*****	*****	stripe	\N	2016-10-31 06:27:24.403-07	2016-10-31 06:27:25.268-07	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
1106	*****@paypal.com	*****	*****	stripe	\N	2016-11-02 15:49:22.021-07	2016-11-02 15:49:23.61-07	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
1262	*****@paypal.com	*****	*****	stripe	\N	2016-11-29 10:35:19.012-08	2016-11-29 10:35:20.055-08	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
1701	*****@paypal.com	*****	*****	stripe	\N	2017-01-24 05:28:17.965-08	2017-01-24 05:28:21.097-08	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
1742	*****@paypal.com	*****	*****	stripe	\N	2017-01-28 15:51:03.682-08	2017-01-28 15:51:05.032-08	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
1986	*****@paypal.com	*****	*****	stripe	\N	2017-02-22 10:25:00.347-08	2017-02-22 10:25:00.347-08	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
2071	*****@paypal.com	*****	*****	stripe	\N	2017-03-04 08:55:18.286-08	2017-03-04 08:55:19.53-08	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
2074	*****@paypal.com	*****	*****	stripe	\N	2017-03-04 21:40:45.496-08	2017-03-04 21:40:48.337-08	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
2246	*****@paypal.com	*****	*****	stripe	\N	2017-03-25 07:33:48.263-07	2017-03-25 07:33:51.315-07	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
2208	*****@paypal.com	*****	*****	stripe	\N	2017-03-21 20:28:09.493-07	2017-03-21 20:28:11.234-07	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
2247	*****@paypal.com	*****	*****	stripe	\N	2017-03-25 08:36:50.843-07	2017-03-25 08:36:53.712-07	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
9	*****@paypal.com	*****	*****	paypal	\N	2015-11-23 10:13:00.576-08	2015-12-15 19:05:25.484-08	2015-11-30 09:00:17.828-08	2015-12-15 19:05:25.484-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
160	*****@paypal.com	*****	*****	stripe	\N	2016-04-01 08:09:24.215-07	2016-04-01 08:09:25.585-07	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
23	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 10:22:06.064-08	2015-12-16 10:29:24.85-08	2015-12-16 10:22:39.681-08	2015-12-16 10:29:24.848-08	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
153	*****@paypal.com	*****	*****	paypal	\N	2016-03-25 21:12:54.185-07	2016-03-25 21:12:54.98-07	\N	\N	2	\N	\N	688	2017-08-28 15:47:15.622-07	\N	f	\N
94	*****@paypal.com	*****	*****	stripe	\N	2016-03-02 13:31:48.638-08	2016-03-02 13:31:48.638-08	\N	\N	129	\N	\N	689	2017-08-28 15:47:15.622-07	\N	f	\N
2860	*****@paypal.com	*****	*****	stripe	\N	2017-05-09 11:14:19.686-07	2017-05-09 11:14:21.05-07	\N	\N	4720	\N	\N	697	2017-08-28 15:47:15.629-07	\N	f	\N
2749	*****@paypal.com	*****	*****	stripe	\N	2017-04-30 18:40:26.919-07	2017-04-30 18:40:28.231-07	\N	\N	3419	\N	\N	702	2017-08-28 15:47:15.634-07	\N	f	\N
11	*****@paypal.com	*****	*****	paypal	\N	2015-11-30 10:25:48.501-08	2015-12-03 15:53:17.763-08	\N	2015-12-03 15:53:17.762-08	7	\N	\N	722	2017-08-28 15:47:15.653-07	\N	f	\N
12	*****@paypal.com	*****	*****	paypal	\N	2015-12-03 15:53:17.772-08	2015-12-03 15:54:56.087-08	2015-12-03 15:54:56.084-08	\N	7	\N	\N	722	2017-08-28 15:47:15.653-07	\N	f	\N
2659	*****@paypal.com	*****	*****	stripe	\N	2017-04-20 14:31:48-07	2017-04-20 14:31:49.294-07	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
2847	*****@paypal.com	*****	*****	stripe	\N	2017-05-08 13:06:11.209-07	2017-05-08 13:06:11.921-07	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
159	*****@paypal.com	*****	*****	stripe	\N	2016-04-01 07:33:31.759-07	2016-04-01 07:33:32.893-07	\N	\N	8	\N	\N	724	2017-08-28 15:47:15.655-07	\N	f	\N
2922	*****@paypal.com	*****	*****	stripe	\N	2017-05-15 05:07:56.825-07	2017-05-15 05:07:57.556-07	\N	\N	4834	\N	\N	744	2017-08-28 15:47:15.675-07	\N	f	\N
2757	*****@paypal.com	*****	*****	stripe	\N	2017-05-01 10:13:32.205-07	2017-05-01 10:13:32.817-07	\N	\N	4550	\N	\N	758	2017-08-28 15:47:15.686-07	\N	f	\N
2888	*****@paypal.com	*****	*****	stripe	\N	2017-05-10 16:45:43.414-07	2017-05-10 16:45:44.785-07	\N	\N	4749	\N	\N	796	2017-08-28 15:47:15.716-07	\N	f	\N
2855	*****@paypal.com	*****	*****	stripe	\N	2017-05-08 22:59:11.913-07	2017-05-08 22:59:13.104-07	\N	\N	4711	\N	\N	832	2017-08-28 15:47:15.752-07	\N	f	\N
93	*****@paypal.com	*****	*****	stripe	\N	2016-03-01 20:41:57.377-08	2016-03-01 20:41:57.377-08	\N	\N	126	\N	\N	839	2017-08-28 15:47:15.76-07	\N	f	\N
1042	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 14:04:38.968-07	2016-10-31 14:08:26.416-07	2016-10-31 14:08:26.414-07	2016-10-31 14:12:53.305-07	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1114	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:32:01.482-07	2016-11-03 12:32:02.116-07	\N	2016-11-03 12:33:52.634-07	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1044	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 14:33:13-07	2016-10-31 14:34:17.306-07	2016-10-31 14:34:17.306-07	2016-11-03 12:34:26.577-07	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1115	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:33:52.773-07	2016-11-03 12:34:26.403-07	2016-11-03 12:34:26.402-07	2016-11-03 12:41:28.484-07	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1116	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:35:14.952-07	2016-11-03 12:35:15.487-07	\N	2016-11-03 12:39:59.781-07	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1117	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:39:59.972-07	2016-11-03 12:41:28.432-07	2016-11-03 12:41:28.432-07	2016-11-18 13:01:23.135-08	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1189	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 13:00:56.092-08	2016-11-18 13:01:23.091-08	2016-11-18 13:01:23.091-08	2016-11-18 13:02:50.88-08	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1190	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 13:02:28.687-08	2016-11-18 13:02:50.197-08	2016-11-18 13:02:50.193-08	2016-11-18 13:03:32.325-08	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1191	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 13:03:06.664-08	2016-11-18 13:03:32.285-08	2016-11-18 13:03:32.285-08	2016-12-20 08:50:13.592-08	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1476	*****@paypal.com	*****	*****	paypal	\N	2016-12-20 08:45:05.334-08	2016-12-20 10:53:04.678-08	2016-12-20 10:53:04.677-08	2017-01-25 10:43:43.363-08	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1718	*****@paypal.com	*****	*****	paypal	\N	2017-01-25 10:42:33.289-08	2017-01-25 10:43:43.316-08	2017-01-25 10:43:43.315-08	2017-02-10 12:19:25.564-08	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
1893	*****@paypal.com	*****	*****	paypal	\N	2017-02-10 12:18:58.618-08	2017-03-14 10:47:25.438-07	2017-03-14 10:47:25.433-07	2017-03-14 10:48:00.117-07	3	\N	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2149	*****@paypal.com	*****	*****	paypal	\N	2017-03-14 10:47:32.51-07	2017-03-17 08:34:02.314-07	2017-03-17 08:34:02.314-07	2017-03-17 08:34:41.542-07	3	2018-03-14 10:47:32.043-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2218	*****@paypal.com	*****	*****	paypal	\N	2017-03-22 13:58:36.077-07	2017-03-27 09:00:11.768-07	2017-03-27 09:00:11.767-07	2017-03-27 09:01:06.921-07	3	2018-03-22 13:58:35.533-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2180	*****@paypal.com	*****	*****	paypal	\N	2017-03-17 08:34:13.62-07	2017-03-22 13:58:30.022-07	2017-03-22 13:58:30.021-07	2017-03-22 13:59:49.26-07	3	2018-03-17 08:34:13.106-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2264	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 08:58:40.001-07	2017-03-27 08:58:40.001-07	\N	2017-03-27 09:01:06.923-07	3	2018-03-27 08:58:39.313-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2265	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 09:00:15.115-07	2017-03-27 10:46:18.273-07	2017-03-27 10:46:18.272-07	2017-03-27 10:46:43.247-07	3	2018-03-27 09:00:14.596-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2266	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 10:46:21.637-07	2017-03-27 10:54:36.2-07	2017-03-27 10:54:36.199-07	2017-03-27 10:55:03.518-07	3	2018-03-27 10:46:21.041-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2267	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 10:54:38.499-07	2017-03-31 10:54:59.737-07	2017-03-31 10:54:59.736-07	2017-03-31 10:57:17.587-07	3	2018-03-27 10:54:37.975-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2318	*****@paypal.com	*****	*****	paypal	\N	2017-03-31 10:55:08.767-07	2017-03-31 15:33:10.929-07	2017-03-31 15:33:10.928-07	2017-03-31 15:33:37.928-07	3	2018-03-31 10:55:08.252-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2601	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:15:58.306-07	2017-04-17 14:15:58.306-07	\N	2017-04-17 14:17:31.155-07	3	2018-04-17 14:15:57.816-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2560	*****@paypal.com	*****	*****	paypal	\N	2017-04-13 13:50:41.094-07	2017-04-13 13:57:22.555-07	2017-04-13 13:57:22.534-07	2017-04-17 12:34:05.25-07	3	2018-04-13 13:50:40.609-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2561	*****@paypal.com	*****	*****	paypal	\N	2017-04-13 13:52:22.989-07	2017-04-13 13:52:22.989-07	\N	2017-04-13 13:57:22.804-07	3	2018-04-13 13:52:22.424-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2321	*****@paypal.com	*****	*****	paypal	\N	2017-03-31 15:33:13.922-07	2017-03-31 15:33:37.801-07	2017-03-31 15:33:37.801-07	2017-04-13 13:57:22.795-07	3	2018-03-31 15:33:13.429-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2589	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 07:29:51.502-07	2017-04-17 07:29:51.502-07	\N	2017-04-17 12:34:05.252-07	3	2018-04-17 07:29:50.969-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2592	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:32:22.818-07	2017-04-17 12:32:22.818-07	\N	2017-04-17 12:34:05.253-07	3	2018-04-17 12:32:22.311-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2593	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:32:25.362-07	2017-04-17 12:32:25.362-07	\N	2017-04-17 12:34:05.254-07	3	2018-04-17 12:32:24.902-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2595	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:33:26.483-07	2017-04-17 12:33:26.483-07	\N	2017-04-17 12:34:05.255-07	3	2018-04-17 12:33:26.015-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2602	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:16:50.566-07	2017-04-17 14:17:30.886-07	2017-04-17 14:17:30.886-07	\N	3	2018-04-17 14:16:49.999-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2596	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:03:48.29-07	2017-04-17 14:03:48.29-07	\N	2017-04-17 14:17:31.145-07	3	2018-04-17 14:03:47.645-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2597	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:08:47.699-07	2017-04-17 14:08:47.699-07	\N	2017-04-17 14:17:31.148-07	3	2018-04-17 14:08:47.299-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2599	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:14:29.551-07	2017-04-17 14:14:29.551-07	\N	2017-04-17 14:17:31.151-07	3	2018-04-17 14:14:29.12-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2600	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:15:56.101-07	2017-04-17 14:15:56.101-07	\N	2017-04-17 14:17:31.153-07	3	2018-04-17 14:15:55.67-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2594	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:33:22.594-07	2017-04-17 14:16:44.162-07	2017-04-17 14:16:44.162-07	2017-04-17 14:17:31.156-07	3	2018-04-17 12:33:22.134-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
2846	*****@paypal.com	*****	*****	paypal	\N	2017-05-08 08:30:40.035-07	2017-05-08 08:30:40.035-07	\N	\N	3	2018-05-08 08:30:39.371-07	\N	848	2017-08-28 15:47:15.767-07	\N	f	\N
\.


                                                                                                                                                                                                                  4029.dat                                                                                            0000600 0004000 0002000 00000010303 13155532021 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        00-stripemanaged-model.js
01-transaction-model.js
02-group-model.js
03-card-model.js
04-application-model.js
05-user-model.js
06-paykey-model.js
07-activity-model.js
08-usergroup-model.js
09-application-group-model.js
10-transaction-model-relations.js
11-activity-model-relation.js
12-card-model-relation.js
20151030150110-addpaypalfield.js
20151208112311-add_group_public_flag.js
20151209114845-add_email_to_stripe_managed_account.js
20151221110406-add_stripesubscriptionid_to_transaction.js
20151230143257-add-longdescription-logo-video-image-expensePolicy-to-Group-migration.js
20151230150937-rename-membership_type-to-membershipType-migration.js
20151230160803-add_group_slug.js
20160105163703-add_transaction_payment_method.js
20160108134935-merge-name-field-and-add-website-and-twitter-handle-migration.js
20160108145839-updating-longDescription-datatype-migration.js
20160109164217-addVAT-migration.js
20160111104412-switch-expensepolicy-to-be-larger-migration.js
20160112093010-reshape_stripe_managed_account.js
20160113172636-add_stripe_accountid_to_user.js
20160113172933-replace-usergroup-role.js
20160115105814-add-website-twitter-to-group.js
20160119121646-add-pending-subscription.js
20160121133658-subscriptions-migration.js
20160128142427-add_reset_token_to_user.js
20160211190935-add-group-tiers.js
20160216121153-add-interval-to-transaction.js
20160218164134-add-new-constraint-to-UserGroups.js
20160219151355-add-usergroup-id.js
201602242300-add-vendor.js
20160225133109-rename-subscriptions-to-notifications.js
20160226153046-subscription-remodel.js
20160226154559-transactions-subscription-reshape.js
20160309143800-notifications-webhook.js
20160311090652-connected-account-migration.js
20160311113816-transaction-paranoid-migration.js
20160321114955-transaction-data.js
20160322231916-rename-card-to-paymentmethod-migration.js
20160323121731-rename-CardId-to-PaymentsMethodId-in-Transactions-migration.js
20160323133617-add-donations-table-migration.js
20160323152724-add-fields-to-transactions-migration.js
20160402120725-add-fee-fields-to-transactions-migration.js
20160405133705-add-burnrate-and-mission-to-group.js
201604150000-add-backgroundImage.js
201604150000-add-referer-to-users.js
20160415194252-add-netAmountInGroupCurrency-to-Transactions-migration.js
20160416141204-add-hostCommissionPercent-migration.js
20160505173300-add-connected-account-group-id.js
20160511222234-group-settings-and-whyjoin.js
20160519162112-make-group.slug-unique-migration.js
20160520153932-remove-user.email-unique-constraint-migration.js
20160602124940-group-data.js
20160608001600-add-expenses-table.js
20160610103923-add-payoutmethod-to-expense-migration.js
20160616161932-group-tags-and-supercollective-field-migration.js
20160610161454-add-users-description-organization.js
20160613174610-temporal-migration.js
20160713221132-user-add-longDescription.js
20160716003148-users-add-mission.js
20160802180635-add-paymentmethod-to-donation.js
20160815115600-add-sessions-table.js
20160822191515-processedAt-in-Donation-migration.js
20160918000000-users-add-firstname.js
20161007172819-lastEditedBy-in-Groups-migration.js
20161007175650-add-grouphistories-migration.js
20161012000000-comments.js
20161117000000-users-add-billingAddress.js
20161204000000-add-index.js
20161205175944-increase-group-mission-length-migration.js
201701040000-group-isActive.js
20170116163901-create-Event-migration.js
20170116170650-create-Tier-migration.js
20170116190354-create-Response-migration.js
20170124210251-New-fields-Event-Tier-Response-migration.js
20170125005855-Add-Lat-Long-in-Event-migration.js
20170127211709-remove-unused-transaction-fields-migration.js
20170127223729-change-amounts-to-ints-migration.js
20170209212119-add-response-to-migration.js
20170220000000-transactions-add-uuid.js
20170228184811-add-fields-to-PaymentMethod-migration.js
201703150000-add-timezone-events.js
20170310165323-add-notes-to-donations-migration.js
201704100000-updateTiers.js
20170525000000-event-addIndex.js
201706030000-add-HostId.js
201706300000-addTransactionDonationIndex.js
201707080000-add-tiers-maxQuantityPerUser.js
201707100000-add-tiers-to-group.js
201707120000-updatePaymentMethod.js
201707140000-GroupToCollective.js
201709020000-AddPaymentMethodData.js
201709110000-DoubleEntry.js
\.


                                                                                                                                                                                                                                                                                                                             4030.dat                                                                                            0000600 0004000 0002000 00000000005 13155532021 0014230 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4031.dat                                                                                            0000600 0004000 0002000 00000004437 13155532021 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        6	100	USD	month	f	\N	*****	2016-02-02 08:36:36-08	2016-06-01 17:00:00-07	2016-02-29 17:07:14.394-08	2016-02-29 17:07:14.394-08	\N
7	100	USD	month	f	\N	*****	2016-02-02 09:04:54-08	2016-06-01 17:00:00-07	2016-02-29 17:07:14.807-08	2016-02-29 17:07:14.807-08	\N
3	100	USD	month	f	\N	*****	2016-02-02 09:09:20-08	2016-06-01 17:00:00-07	2016-02-29 17:07:13.303-08	2016-02-29 17:07:13.303-08	\N
8	100	USD	month	f	\N	*****	2016-02-02 13:46:43-08	2016-06-01 17:00:00-07	2016-02-29 17:07:15.151-08	2016-02-29 17:07:15.151-08	\N
2	100	USD	month	f	\N	*****	2016-02-02 15:09:04-08	2016-06-01 17:00:00-07	2016-02-29 17:07:12.938-08	2016-02-29 17:07:12.938-08	\N
16	100	MXN	month	f	\N	*****	2016-02-15 10:46:05-08	\N	2016-02-29 17:07:18.292-08	2016-02-29 17:07:18.292-08	\N
1	500	USD	month	f	\N	*****	\N	\N	2016-02-29 17:07:12.45-08	2016-02-29 17:07:12.45-08	\N
496	1000	USD	month	t	\N	*****	2016-09-09 20:42:55.758-07	\N	2016-09-09 20:42:49.141-07	2016-09-09 20:42:55.759-07	\N
33	100	USD	month	f	\N	*****	2016-03-01 20:42:15.671-08	2016-06-01 17:00:00-07	2016-03-01 20:41:59.934-08	2016-03-01 20:42:15.673-08	\N
4	500	MXN	month	f	\N	*****	2016-02-02 08:52:01-08	\N	2016-02-29 17:07:13.684-08	2016-02-29 17:07:13.684-08	\N
378	10000	USD	month	f	\N	*****	2016-08-03 10:47:24.609-07	2016-08-03 10:48:03.066-07	2016-08-03 10:47:17.197-07	2016-08-03 10:48:03.067-07	\N
2031	200	USD	month	t	\N	*****	2017-04-30 18:40:31.674-07	\N	2017-04-30 18:40:26.929-07	2017-04-30 18:40:31.674-07	\N
224	100	USD	month	t	\N	*****	2016-06-09 10:28:30.06-07	\N	2016-06-09 10:28:13.943-07	2016-06-09 10:28:30.069-07	\N
1366	2500	USD	month	t	\N	*****	2017-02-01 09:30:50.219-08	\N	2017-02-01 09:30:44.034-08	2017-02-01 09:30:50.219-08	\N
2039	500	USD	month	t	\N	*****	2017-05-01 10:13:36.243-07	\N	2017-05-01 10:13:32.216-07	2017-05-01 10:13:36.243-07	\N
286	1000	USD	month	t	\N	*****	2016-07-01 15:38:36.9-07	\N	2016-07-01 15:31:45.99-07	2016-07-01 15:38:36.9-07	\N
530	0	USD	month	f	\N	*****	2016-09-20 13:59:00.661-07	2017-01-16 07:00:35.909-08	2016-09-20 13:58:49.798-07	2017-01-16 07:00:35.909-08	\N
2103	1000	USD	month	t	\N	*****	2017-05-08 22:59:17.481-07	\N	2017-05-08 22:59:11.936-07	2017-05-08 22:59:17.482-07	\N
1238	1000	USD	month	f	\N	*****	2017-01-14 09:12:00.516-08	2017-02-22 15:10:02.422-08	2017-01-14 09:11:39.397-08	2017-02-22 15:10:02.422-08	\N
\.


                                                                                                                                                                                                                                 4034.dat                                                                                            0000600 0004000 0002000 00000052165 13155532021 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        40	donor	\N	\N	EUR	\N	\N	\N	\N	2017-08-28 15:47:16.152-07	\N	\N	donors	\N	\N	TIER	524	\N	\N	\N
42	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.152-07	\N	\N	backers	\N	\N	TIER	47	\N	Become a backer	[2500,5000,10000]
43	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.152-07	\N	\N	donors	\N	\N	TIER	47	\N	\N	\N
45	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.153-07	\N	\N	donors	\N	\N	TIER	292	\N	\N	\N
46	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.153-07	\N	\N	backers	\N	\N	TIER	275	\N	Become a backer	[2500,5000,10000]
48	backer	\N	200	USD	\N	\N	\N	\N	2017-08-28 15:47:16.154-07	\N	\N	backers	\N	\N	TIER	521	month	\N	[200,1000,2500]
50	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.154-07	\N	\N	donors	\N	\N	TIER	521	\N	\N	\N
51	backer	\N	200	USD	\N	\N	\N	\N	2017-08-28 15:47:16.154-07	\N	\N	backers	\N	\N	TIER	525	month	\N	[200,1000,2500]
53	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.154-07	\N	\N	donors	\N	\N	TIER	525	\N	\N	\N
55	sponsor	\N	10000	CAD	\N	\N	\N	\N	2017-08-28 15:47:16.155-07	\N	\N	sponsors	\N	\N	TIER	522	month	\N	[10000,25000,50000]
56	donor	\N	\N	CAD	\N	\N	\N	\N	2017-08-28 15:47:16.155-07	\N	\N	donors	\N	\N	TIER	522	\N	\N	\N
58	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.155-07	\N	\N	donors	\N	\N	TIER	262	\N	\N	\N
60	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-08-28 15:47:16.155-07	\N	\N	sponsors	\N	\N	TIER	510	month	\N	[10000,25000,50000]
61	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.155-07	\N	\N	donors	\N	\N	TIER	510	\N	\N	\N
63	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.156-07	\N	\N	donors	\N	\N	TIER	295	\N	\N	\N
65	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.157-07	\N	\N	donors	\N	\N	TIER	280	\N	\N	\N
66	Backers	Support us with a donation and help us continue our activities.	2500	EUR	\N	\N	\N	\N	2017-08-28 15:47:16.159-07	\N	\N	backers	\N	\N	TIER	283	\N	Become a backer	[2500,5000,10000]
68	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.16-07	\N	\N	backers	\N	\N	TIER	286	\N	Become a backer	[2500,5000,10000]
70	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.163-07	\N	\N	backers	\N	\N	TIER	14	\N	Become a backer	[2500,5000,10000]
71	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.163-07	\N	\N	donors	\N	\N	TIER	14	\N	\N	\N
73	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-08-28 15:47:16.164-07	\N	\N	sponsors	\N	\N	TIER	515	month	\N	[10000,25000,50000]
74	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.164-07	\N	\N	donors	\N	\N	TIER	515	\N	\N	\N
76	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-08-28 15:47:16.165-07	\N	\N	sponsors	\N	\N	TIER	516	month	\N	[10000,25000,50000]
78	backer	\N	200	USD	\N	\N	\N	\N	2017-08-28 15:47:16.165-07	\N	\N	backers	\N	\N	TIER	518	month	\N	[200,1000,2500]
79	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-08-28 15:47:16.167-07	\N	\N	sponsors	\N	\N	TIER	518	month	\N	[10000,25000,50000]
81	backer	\N	200	USD	\N	\N	\N	\N	2017-08-28 15:47:16.168-07	\N	\N	backers	\N	\N	TIER	519	month	\N	[200,1000,2500]
83	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.168-07	\N	\N	donors	\N	\N	TIER	519	\N	\N	\N
84	backer	\N	200	USD	\N	\N	\N	\N	2017-08-28 15:47:16.168-07	\N	\N	backers	\N	\N	TIER	520	month	\N	[200,1000,2500]
86	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.169-07	\N	\N	donors	\N	\N	TIER	520	\N	\N	\N
88	sponsor	\N	10000	EUR	\N	\N	\N	\N	2017-08-28 15:47:16.169-07	\N	\N	sponsors	\N	\N	TIER	523	month	\N	[10000,25000,50000]
89	donor	\N	\N	EUR	\N	\N	\N	\N	2017-08-28 15:47:16.169-07	\N	\N	donors	\N	\N	TIER	523	\N	\N	\N
91	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-08-28 15:47:16.17-07	\N	\N	sponsors	\N	\N	TIER	512	month	\N	[10000,25000,50000]
93	backer	\N	200	MXN	\N	\N	\N	\N	2017-08-28 15:47:16.17-07	\N	\N	backers	\N	\N	TIER	511	month	\N	[200,1000,2500]
94	sponsor	\N	10000	MXN	\N	\N	\N	\N	2017-08-28 15:47:16.171-07	\N	\N	sponsors	\N	\N	TIER	511	month	\N	[10000,25000,50000]
96	backer	\N	200	USD	\N	\N	\N	\N	2017-08-28 15:47:16.171-07	\N	\N	backers	\N	\N	TIER	513	month	\N	[200,1000,2500]
98	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.172-07	\N	\N	donors	\N	\N	TIER	513	\N	\N	\N
99	backer	\N	200	USD	\N	\N	\N	\N	2017-08-28 15:47:16.172-07	\N	\N	backers	\N	\N	TIER	517	month	\N	[200,1000,2500]
101	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.172-07	\N	\N	donors	\N	\N	TIER	517	\N	\N	\N
103	sponsor	\N	10000	GBP	\N	\N	\N	\N	2017-08-28 15:47:16.172-07	\N	\N	sponsors	\N	\N	TIER	584	month	\N	[10000,25000,50000]
104	donor	\N	\N	GBP	\N	\N	\N	\N	2017-08-28 15:47:16.173-07	\N	\N	donors	\N	\N	TIER	584	\N	\N	\N
106	donor	\N	\N	MXN	\N	\N	\N	\N	2017-08-28 15:47:16.173-07	\N	\N	donors	\N	\N	TIER	299	\N	\N	\N
108	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.173-07	\N	\N	donors	\N	\N	TIER	430	\N	\N	\N
109	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.173-07	\N	\N	backers	\N	\N	TIER	48	\N	Become a backer	[2500,5000,10000]
111	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.174-07	\N	\N	donors	\N	\N	TIER	48	\N	\N	\N
113	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.174-07	\N	\N	backers	\N	\N	TIER	260	\N	Become a backer	[2500,5000,10000]
114	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.174-07	\N	\N	donors	\N	\N	TIER	260	\N	\N	\N
116	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.175-07	\N	\N	donors	\N	\N	TIER	59	\N	\N	\N
118	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.175-07	\N	\N	donors	\N	\N	TIER	261	\N	\N	\N
119	donor	\N	\N	EUR	\N	\N	\N	\N	2017-08-28 15:47:16.176-07	\N	\N	donors	\N	\N	TIER	298	\N	\N	\N
120	Backers	Support us with a donation and help us continue our activities.	2500	EUR	\N	\N	\N	\N	2017-08-28 15:47:16.176-07	\N	\N	backers	\N	\N	TIER	298	\N	Become a backer	[2500,5000,10000]
122	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.176-07	\N	\N	donors	\N	\N	TIER	272	\N	\N	\N
124	donor	\N	\N	CAD	\N	\N	\N	\N	2017-08-28 15:47:16.176-07	\N	\N	donors	\N	\N	TIER	293	\N	\N	\N
125	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.176-07	\N	\N	backers	\N	\N	TIER	273	\N	Become a backer	[2500,5000,10000]
127	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.177-07	\N	\N	backers	\N	\N	TIER	294	\N	Become a backer	[2500,5000,10000]
129	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.177-07	\N	\N	backers	\N	\N	TIER	263	\N	Become a backer	[2500,5000,10000]
130	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.177-07	\N	\N	donors	\N	\N	TIER	263	\N	\N	\N
132	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.177-07	\N	\N	donors	\N	\N	TIER	274	\N	\N	\N
134	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.178-07	\N	\N	donors	\N	\N	TIER	276	\N	\N	\N
135	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.178-07	\N	\N	backers	\N	\N	TIER	277	\N	Become a backer	[2500,5000,10000]
137	Backers	Support us with a donation and help us continue our activities.	2500	EUR	\N	\N	\N	\N	2017-08-28 15:47:16.178-07	\N	\N	backers	\N	\N	TIER	301	\N	Become a backer	[2500,5000,10000]
139	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.179-07	\N	\N	backers	\N	\N	TIER	195	\N	Become a backer	[2500,5000,10000]
141	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.18-07	\N	\N	backers	\N	\N	TIER	241	\N	Become a backer	[2500,5000,10000]
142	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.18-07	\N	\N	donors	\N	\N	TIER	241	\N	\N	\N
144	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.18-07	\N	\N	donors	\N	\N	TIER	265	\N	\N	\N
146	donor	\N	\N	AUD	\N	\N	\N	\N	2017-08-28 15:47:16.181-07	\N	\N	donors	\N	\N	TIER	297	\N	\N	\N
147	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.181-07	\N	\N	backers	\N	\N	TIER	259	\N	Become a backer	[2500,5000,10000]
149	Backers	Support us with a donation and help us continue our activities.	2500	AUD	\N	\N	\N	\N	2017-08-28 15:47:16.182-07	\N	\N	backers	\N	\N	TIER	266	\N	Become a backer	[2500,5000,10000]
150	donor	\N	\N	AUD	\N	\N	\N	\N	2017-08-28 15:47:16.182-07	\N	\N	donors	\N	\N	TIER	266	\N	\N	\N
152	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.182-07	\N	\N	donors	\N	\N	TIER	279	\N	\N	\N
154	donor	\N	\N	GBP	\N	\N	\N	\N	2017-08-28 15:47:16.183-07	\N	\N	donors	\N	\N	TIER	267	\N	\N	\N
155	Backers	Support us with a donation and help us continue our activities.	2500	GBP	\N	\N	\N	\N	2017-08-28 15:47:16.183-07	\N	\N	backers	\N	\N	TIER	278	\N	Become a backer	[2500,5000,10000]
160	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.184-07	\N	\N	donors	\N	\N	TIER	269	\N	\N	\N
41	backer	\N	200	EUR	\N	\N	\N	\N	2017-08-28 15:47:16.151-07	\N	\N	backers	\N	\N	TIER	524	month	\N	[200,1000,2500]
44	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.153-07	\N	\N	backers	\N	\N	TIER	292	\N	Become a backer	[2500,5000,10000]
47	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.153-07	\N	\N	donors	\N	\N	TIER	275	\N	\N	\N
49	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-08-28 15:47:16.154-07	\N	\N	sponsors	\N	\N	TIER	521	month	\N	[10000,25000,50000]
52	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-08-28 15:47:16.154-07	\N	\N	sponsors	\N	\N	TIER	525	month	\N	[10000,25000,50000]
54	backer	\N	200	CAD	\N	\N	\N	\N	2017-08-28 15:47:16.155-07	\N	\N	backers	\N	\N	TIER	522	month	\N	[200,1000,2500]
57	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.155-07	\N	\N	backers	\N	\N	TIER	262	\N	Become a backer	[2500,5000,10000]
59	backer	\N	200	USD	\N	\N	\N	\N	2017-08-28 15:47:16.155-07	\N	\N	backers	\N	\N	TIER	510	month	\N	[200,1000,2500]
62	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.156-07	\N	\N	backers	\N	\N	TIER	295	\N	Become a backer	[2500,5000,10000]
64	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.157-07	\N	\N	backers	\N	\N	TIER	280	\N	Become a backer	[2500,5000,10000]
67	donor	\N	\N	EUR	\N	\N	\N	\N	2017-08-28 15:47:16.159-07	\N	\N	donors	\N	\N	TIER	283	\N	\N	\N
69	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.161-07	\N	\N	donors	\N	\N	TIER	286	\N	\N	\N
72	backer	\N	200	USD	\N	\N	\N	\N	2017-08-28 15:47:16.164-07	\N	\N	backers	\N	\N	TIER	515	month	\N	[200,1000,2500]
75	backer	\N	200	USD	\N	\N	\N	\N	2017-08-28 15:47:16.164-07	\N	\N	backers	\N	\N	TIER	516	month	\N	[200,1000,2500]
77	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.165-07	\N	\N	donors	\N	\N	TIER	516	\N	\N	\N
80	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.167-07	\N	\N	donors	\N	\N	TIER	518	\N	\N	\N
82	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-08-28 15:47:16.168-07	\N	\N	sponsors	\N	\N	TIER	519	month	\N	[10000,25000,50000]
85	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-08-28 15:47:16.169-07	\N	\N	sponsors	\N	\N	TIER	520	month	\N	[10000,25000,50000]
87	backer	\N	200	EUR	\N	\N	\N	\N	2017-08-28 15:47:16.169-07	\N	\N	backers	\N	\N	TIER	523	month	\N	[200,1000,2500]
90	backer	\N	200	USD	\N	\N	\N	\N	2017-08-28 15:47:16.169-07	\N	\N	backers	\N	\N	TIER	512	month	\N	[200,1000,2500]
92	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.17-07	\N	\N	donors	\N	\N	TIER	512	\N	\N	\N
95	donor	\N	\N	MXN	\N	\N	\N	\N	2017-08-28 15:47:16.171-07	\N	\N	donors	\N	\N	TIER	511	\N	\N	\N
97	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-08-28 15:47:16.171-07	\N	\N	sponsors	\N	\N	TIER	513	month	\N	[10000,25000,50000]
100	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-08-28 15:47:16.172-07	\N	\N	sponsors	\N	\N	TIER	517	month	\N	[10000,25000,50000]
102	backer	\N	200	GBP	\N	\N	\N	\N	2017-08-28 15:47:16.172-07	\N	\N	backers	\N	\N	TIER	584	month	\N	[200,1000,2500]
105	Backers	Support us with a donation and help us continue our activities.	2500	MXN	\N	\N	\N	\N	2017-08-28 15:47:16.173-07	\N	\N	backers	\N	\N	TIER	299	\N	Become a backer	[2500,5000,10000]
107	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.173-07	\N	\N	backers	\N	\N	TIER	430	\N	Become a backer	[2500,5000,10000]
110	Sponsors	Become a Sponsor and help us fulfill our mission to inspire women to excel in tech careers. See the description above for more info.	150000	USD	\N	\N	\N	\N	2017-08-28 15:47:16.173-07	\N	\N	sponsors	\N	\N	TIER	48	\N	Become a Sponsor	[150000,300000,500000]
112	donor	Become a donor and help us support all the local Women Who Code collectives	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.174-07	\N	\N	donors	\N	\N	TIER	51	\N	\N	["other",100000,500000,1000000]
115	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.175-07	\N	\N	backers	\N	\N	TIER	59	\N	Become a backer	[2500,5000,10000]
117	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.175-07	\N	\N	backers	\N	\N	TIER	261	\N	Become a backer	[2500,5000,10000]
121	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.176-07	\N	\N	backers	\N	\N	TIER	272	\N	Become a backer	[2500,5000,10000]
123	Backers	Support us with a donation and help us continue our activities.	2500	CAD	\N	\N	\N	\N	2017-08-28 15:47:16.176-07	\N	\N	backers	\N	\N	TIER	293	\N	Become a backer	[2500,5000,10000]
126	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.177-07	\N	\N	donors	\N	\N	TIER	273	\N	\N	\N
128	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.177-07	\N	\N	donors	\N	\N	TIER	294	\N	\N	\N
131	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.177-07	\N	\N	backers	\N	\N	TIER	274	\N	Become a backer	[2500,5000,10000]
133	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.178-07	\N	\N	backers	\N	\N	TIER	276	\N	Become a backer	[2500,5000,10000]
136	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.178-07	\N	\N	donors	\N	\N	TIER	277	\N	\N	\N
138	donor	\N	\N	EUR	\N	\N	\N	\N	2017-08-28 15:47:16.179-07	\N	\N	donors	\N	\N	TIER	301	\N	\N	\N
140	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.179-07	\N	\N	donors	\N	\N	TIER	195	\N	\N	\N
143	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.18-07	\N	\N	backers	\N	\N	TIER	265	\N	Become a backer	[2500,5000,10000]
145	Backers	Support us with a donation and help us continue our activities.	2500	AUD	\N	\N	\N	\N	2017-08-28 15:47:16.181-07	\N	\N	backers	\N	\N	TIER	297	\N	Become a backer	[2500,5000,10000]
148	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.182-07	\N	\N	donors	\N	\N	TIER	259	\N	\N	\N
151	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.182-07	\N	\N	backers	\N	\N	TIER	279	\N	Become a backer	[2500,5000,10000]
153	Backers	Support us with a donation and help us continue our activities.	2500	GBP	\N	\N	\N	\N	2017-08-28 15:47:16.183-07	\N	\N	backers	\N	\N	TIER	267	\N	Become a backer	[2500,5000,10000]
156	donor	\N	\N	GBP	\N	\N	\N	\N	2017-08-28 15:47:16.183-07	\N	\N	donors	\N	\N	TIER	278	\N	\N	\N
158	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.183-07	\N	\N	donors	\N	\N	TIER	12	\N	\N	\N
161	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.184-07	\N	\N	backers	\N	\N	TIER	270	\N	Become a backer	[2500,5000,10000]
163	Backers	Support us with a donation and help us continue our activities.	2500	AUD	\N	\N	\N	\N	2017-08-28 15:47:16.185-07	\N	\N	backers	\N	\N	TIER	281	\N	Become a backer	[2500,5000,10000]
166	donor	\N	\N	MXN	\N	\N	\N	\N	2017-08-28 15:47:16.185-07	\N	\N	donors	\N	\N	TIER	10	\N	\N	\N
168	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.185-07	\N	\N	donors	\N	\N	TIER	282	\N	\N	\N
171	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.186-07	\N	\N	backers	\N	\N	TIER	284	\N	Become a backer	[2500,5000,10000]
173	Backers	Support us with a donation and help us continue our activities.	2500	GBP	\N	\N	\N	\N	2017-08-28 15:47:16.186-07	\N	\N	backers	\N	\N	TIER	264	\N	Become a backer	[2500,5000,10000]
176	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.186-07	\N	\N	donors	\N	\N	TIER	287	\N	\N	\N
178	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.187-07	\N	\N	donors	\N	\N	TIER	268	\N	\N	\N
181	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.187-07	\N	\N	backers	\N	\N	TIER	300	\N	Become a backer	[2500,5000,10000]
184	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.188-07	\N	\N	donors	\N	\N	TIER	289	\N	\N	\N
186	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.188-07	\N	\N	donors	\N	\N	TIER	13	\N	\N	\N
188	donor	\N	\N	CAD	\N	\N	\N	\N	2017-08-28 15:47:16.188-07	\N	\N	donors	\N	\N	TIER	291	\N	\N	\N
191	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.189-07	\N	\N	backers	\N	\N	TIER	288	\N	Become a backer	[2500,5000,10000]
195	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.189-07	\N	\N	backers	\N	\N	TIER	271	\N	Become a backer	[2500,5000,10000]
196	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.189-07	\N	\N	donors	\N	\N	TIER	290	\N	\N	\N
157	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.183-07	\N	\N	backers	\N	\N	TIER	12	\N	Become a backer	[2500,5000,10000]
162	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.184-07	\N	\N	donors	\N	\N	TIER	270	\N	\N	\N
167	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.185-07	\N	\N	backers	\N	\N	TIER	282	\N	Become a backer	[2500,5000,10000]
172	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.186-07	\N	\N	donors	\N	\N	TIER	284	\N	\N	\N
177	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.187-07	\N	\N	backers	\N	\N	TIER	268	\N	Become a backer	[2500,5000,10000]
182	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.187-07	\N	\N	donors	\N	\N	TIER	300	\N	\N	\N
187	Backers	Support us with a donation and help us continue our activities.	2500	CAD	\N	\N	\N	\N	2017-08-28 15:47:16.188-07	\N	\N	backers	\N	\N	TIER	291	\N	Become a backer	[2500,5000,10000]
192	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.189-07	\N	\N	donors	\N	\N	TIER	288	\N	\N	\N
197	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.19-07	\N	\N	backers	\N	\N	TIER	15	\N	Become a backer	[2500,5000,10000]
159	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.183-07	\N	\N	backers	\N	\N	TIER	269	\N	Become a backer	[2500,5000,10000]
164	donor	\N	\N	AUD	\N	\N	\N	\N	2017-08-28 15:47:16.185-07	\N	\N	donors	\N	\N	TIER	281	\N	\N	\N
169	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.186-07	\N	\N	backers	\N	\N	TIER	3	\N	Become a backer	[2500,5000,10000]
174	donor	\N	\N	GBP	\N	\N	\N	\N	2017-08-28 15:47:16.186-07	\N	\N	donors	\N	\N	TIER	264	\N	\N	\N
179	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.187-07	\N	\N	backers	\N	\N	TIER	4	\N	Become a backer	[2500,5000,10000]
183	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.188-07	\N	\N	backers	\N	\N	TIER	289	\N	Become a backer	[2500,5000,10000]
190	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.189-07	\N	\N	donors	\N	\N	TIER	285	\N	\N	\N
194	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.189-07	\N	\N	backers	\N	\N	TIER	290	\N	Become a backer	[2500,5000,10000]
200	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.19-07	\N	\N	donors	\N	\N	TIER	2	\N	\N	\N
165	Backers	Support us with a donation and help us continue our activities.	5000	MXN	\N	\N	\N	\N	2017-08-28 15:47:16.185-07	\N	\N	backers	\N	\N	TIER	10	\N	Become a backer	[5000,10000,25000,50000,100000]
170	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.186-07	\N	\N	donors	\N	\N	TIER	3	\N	\N	\N
175	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.186-07	\N	\N	backers	\N	\N	TIER	287	\N	Become a backer	[2500,5000,10000]
180	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.187-07	\N	\N	donors	\N	\N	TIER	4	\N	\N	\N
185	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.188-07	\N	\N	backers	\N	\N	TIER	13	\N	Become a backer	[2500,5000,10000]
189	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.188-07	\N	\N	backers	\N	\N	TIER	285	\N	Become a backer	[2500,5000,10000]
193	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.189-07	\N	\N	donors	\N	\N	TIER	271	\N	\N	\N
198	donor	\N	\N	USD	\N	\N	\N	\N	2017-08-28 15:47:16.19-07	\N	\N	donors	\N	\N	TIER	15	\N	\N	\N
199	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-08-28 15:47:16.19-07	\N	\N	backers	\N	\N	TIER	2	\N	Become a backer	[2500,5000,10000]
\.


                                                                                                                                                                                                                                                                                                                                                                                                           4036.dat                                                                                            0000600 0004000 0002000 00001054534 13155532021 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5786	DEBIT	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	-4431	USD	2017-02-07 10:40:27.475-08	2017-02-07 10:40:27.96-08	59	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4431	736	2bbc0783-4b84-4636-a6aa-9b9336c1550e	716	848
5787	DEBIT	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	-9050	USD	2017-02-07 10:40:49.494-08	2017-02-07 10:40:49.852-08	59	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9050	790	e25d3885-580e-477b-ac27-6dfaa2ab8466	716	848
6199	DEBIT	Domain name for hackathon and study night projects	-1798	USD	2017-02-20 12:53:02.864-08	2017-02-20 12:53:02.879-08	59	171	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1798	497	3aae7b32-dbf9-4383-94eb-9c339211043a	716	848
3526	DEBIT	Banner	-2000	USD	2016-11-29 14:34:04.252-08	2016-11-29 14:34:04.435-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	f2092196-e65f-4d9c-9981-37518272c36e	848	848
305	DEBIT	test 	-100	USD	2016-04-06 10:39:39.954-07	2016-04-06 10:46:25.532-07	14	3	\N	2016-04-06 10:46:25.531-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5161e6cf-8e5c-43e1-b626-da7e129d3fe6	848	848
3599	DEBIT	Banner	-2000	USD	2016-11-30 10:40:24.258-08	2016-11-30 10:40:24.443-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	dddd092c-b5a8-475a-a35e-d4f12bc724d6	848	848
2941	DEBIT	Order for stickers of our official WWC Boulder/Denver chapter logo	-7800	USD	2016-11-03 12:45:23.582-07	2016-11-03 12:45:24.25-07	15	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7800	48	920fcb4b-a53d-48d7-8294-2914e6c5df81	848	848
2942	DEBIT	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	-2838	USD	2016-11-03 14:13:31.956-07	2016-11-03 14:13:32.241-07	12	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2838	409	edf0f89b-9f88-4050-a39b-a1c03329fd49	848	848
4366	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:23:35.936-08	2016-12-27 08:23:35.936-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	634	19aac764-7f1c-4545-964c-aa419cddcadf	848	848
4388	DEBIT	Meetup Fees	-4900	GBP	2016-12-27 09:34:46.469-08	2016-12-27 09:34:46.469-08	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	647	63c1fa30-5905-47e2-9922-3e50406c41e5	848	848
4390	DEBIT	Meetup Fees	-6000	USD	2016-12-27 09:49:39.83-08	2016-12-27 09:49:39.83-08	280	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	648	d59f9559-52ea-4838-86ac-9a89171e4edb	848	848
4392	DEBIT	Meetup Fees	-6000	AUD	2016-12-27 09:54:00.843-08	2016-12-27 09:54:00.843-08	281	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	649	4041ac58-5270-4993-8579-372862540f19	848	848
4394	DEBIT	Meetup Fees	-6000	MXN	2016-12-27 09:57:54.314-08	2016-12-27 09:57:54.314-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	650	3d47c24e-fc5a-4254-80eb-cc221aae8a7e	848	848
7684	DEBIT	Travel stipend to attend the Google I/O 2017 Conference.	-100000	USD	2017-03-31 15:33:59.707-07	2017-03-31 15:33:59.731-07	286	1344	2321	\N	\N	\N	\N	\N	7430	USD	1	-100000	-107430	962	a275cb86-6060-4e20-987b-c9d777f576df	845	848
10131	DEBIT	Leadership meeting	-2989	USD	2017-05-16 14:59:48.206-07	2017-05-16 14:59:48.206-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-2989	-2989	1086	f3f420fc-da24-41e2-ac54-8d18166e5162	847	848
10353	CREDIT	Banner	2000	USD	2016-11-29 14:34:04.252-08	2016-11-29 14:34:04.435-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	c327b4e4-a4ec-412d-a7b6-e393cedaf384	47	848
334	CREDIT	From Deepa	1500	USD	2016-04-12 14:19:00.212-07	2016-04-12 14:19:00.529-07	4	3	\N	2016-04-14 14:19:00.529-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3be9f7b2-c97b-41ac-b2bf-2e8dbd11ca27	848	848
2539	DEBIT	Director t-shirt	-3325	USD	2016-10-17 14:01:02.872-07	2016-10-17 14:01:02.925-07	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3325	\N	73b25042-c1cc-45c6-9089-ec29736609fb	848	848
2240	DEBIT	90/10 split: Beth Laing	-500	USD	2016-10-04 09:06:16.796-07	2016-10-04 09:06:16.796-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	392	0c5e3510-cf16-42de-bde2-147e6ab9a46d	848	848
2241	DEBIT	90/10 split: Syema Ailia	-250	USD	2016-10-04 09:06:23.454-07	2016-10-04 09:06:23.454-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-250	390	3e7d1081-0039-41e3-b36f-4b37b44b3e0c	848	848
2302	DEBIT	Network Stickers	-58590	USD	2016-10-06 09:08:07.615-07	2016-10-06 09:08:07.66-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-58590	\N	b48ad8e6-3729-4d25-be11-03328df1f7b8	848	848
2260	DEBIT	Food at our Sept. monthly event	-11478	USD	2016-10-04 15:07:11.046-07	2016-10-04 15:07:11.615-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11478	\N	bbb5901e-3328-4653-a858-b80c40422cd0	848	848
671	DEBIT	A Small Orange	-12700	USD	2016-02-01 16:00:00-08	2016-06-14 11:14:22.114-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-12700	194	d40ca73f-6c26-4d43-9c22-6e36ab38f02c	848	848
656	DEBIT	Conference Grant	-100000	USD	2016-05-24 12:42:50.307-07	2016-06-14 11:14:22.103-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	189	e8d5c717-1fca-4334-96d2-b8fa8d899ca1	848	848
2426	DEBIT	Engineering (Web) - A Small Orange	-12700	USD	2016-10-11 17:44:30.933-07	2016-10-11 17:44:31.081-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-12700	\N	0f9b2d4b-60a1-4cd9-b233-5569b822348d	848	848
3589	DEBIT	Photos for sponsor gifts	-2104	USD	2016-11-30 08:11:36.238-08	2016-11-30 08:11:36.377-08	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2104	\N	5c8b4fc6-fa71-4ca6-ac8b-984c0d5fa454	848	848
3591	DEBIT	Envelopes for hackathon sponsor prizes	-907	USD	2016-11-30 08:12:35.291-08	2016-11-30 08:12:35.54-08	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-907	\N	eeee1a04-ad18-42e4-8252-db32a174e369	848	848
3613	DEBIT	Leadership Development - Conference Travel Stipend Google I/O	-130000	USD	2016-11-30 13:06:48.939-08	2016-11-30 13:06:49.116-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-130000	\N	6a1fa977-065a-47a6-bf3e-ae8934921597	848	848
3619	DEBIT	Banner	-2000	USD	2016-11-30 13:19:46.014-08	2016-11-30 13:19:46.128-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	549a4d38-14e9-451f-af59-00b70014bc58	848	848
3622	DEBIT	Regional Leadership Director Meeting 	-7500	USD	2016-11-30 13:20:31.263-08	2016-11-30 13:20:31.464-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7500	\N	7e10ae09-c940-4b3e-a151-459585138199	848	848
4256	DEBIT	Meetup Fees	-6000	USD	2016-12-23 09:00:25.987-08	2016-12-23 09:00:25.987-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	617	57853d10-9d39-4960-9921-b48c4b182e12	848	848
4258	DEBIT	Meetup Fees	-4900	GBP	2016-12-23 09:05:41.927-08	2016-12-23 09:05:41.927-08	264	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	618	9a33a7df-c65b-40f9-9207-191220694bc5	848	848
4260	DEBIT	Meetup Fees	-6000	USD	2016-12-23 09:10:34.733-08	2016-12-23 09:10:34.733-08	265	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	619	eb811f1b-7c0b-4d61-9105-9366e6aa84d8	848	848
4262	DEBIT	Meetup Fees	-5700	EUR	2016-12-23 09:15:16.054-08	2016-12-23 09:15:16.054-08	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	620	274351b9-2cc0-438e-8c7d-4a8e7771bb0c	848	848
4264	DEBIT	Meetup Fees	-6000	USD	2016-12-23 09:21:53.018-08	2016-12-23 09:21:53.018-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	621	0446afb9-0ce6-4148-a588-e6ac299a3997	848	848
4268	DEBIT	Meetup Fees	-6000	AUD	2016-12-23 09:42:18.688-08	2016-12-23 09:42:18.688-08	266	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	623	f36420c0-4283-44cb-a9c5-d91eb735988f	848	848
4371	DEBIT	Meetup Fees	-5700	EUR	2016-12-27 08:36:05.296-08	2016-12-27 08:36:05.296-08	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	637	33760db0-25e7-4b85-89df-040f38e22adb	848	848
4373	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:41:27.235-08	2016-12-27 08:41:27.235-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	638	c036838f-9cbc-45c5-935f-9d9b57ea2836	848	848
8237	DEBIT	Meetup Fees	-6000	USD	2017-04-05 07:19:21.293-07	2017-04-05 07:19:21.293-07	295	3	\N	\N	\N	\N	\N	\N	0	USD	1	-6000	-6000	988	87b9bea2-2195-4ea2-b065-d18bc0c3368c	848	848
539	DEBIT	Conference Expense	-8320	USD	2016-05-10 12:19:21.785-07	2016-06-14 11:14:22.042-07	48	3	\N	2016-06-14 11:14:22.515-07	\N	\N	\N	\N	\N	\N	\N	\N	-8320	158	158dcb8d-7226-4bd0-a0c6-601340d5ab84	848	848
377	DEBIT	WePay fee	-125	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-125	95	535a716d-edbd-4914-9b57-78bd671fd49a	848	848
859	DEBIT	Global Development 	-150	USD	2016-06-09 11:38:16.857-07	2016-06-14 11:14:22.175-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	222	33ddf644-201a-470f-b745-de2dece2159b	848	848
674	DEBIT	CONFERENCE GRANT	-50000	USD	2016-05-10 17:00:00-07	2016-06-14 11:14:22.114-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	196	7916b5ad-1d71-481f-b774-1a9d79d2c8e0	848	848
864	DEBIT	Reimburse Caterina Paun for Program Expenses	-9995	USD	2016-02-24 16:00:00-08	2016-06-14 11:14:22.175-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9995	224	9f16d9b5-e350-4ca4-8b8f-59334d6ef9f3	848	848
1580	DEBIT	Drinks for July monthly event	-3316	USD	2016-08-16 07:53:42.013-07	2016-08-16 07:53:42.04-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3316	\N	bc1e4ea6-63a9-41a3-bd5a-a25ff1b41c37	848	848
1627	DEBIT	Event supplies	-1797	USD	2016-08-19 10:24:23.638-07	2016-08-19 10:24:24.362-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1797	\N	aaa90df5-783d-4af5-aadb-848d7da27db0	848	848
1630	DEBIT	Dinner for last night's HackNight	-13526	USD	2016-08-19 13:58:34.342-07	2016-08-19 13:58:34.554-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13526	319	e4f6cb02-9565-4e90-8156-b4b6f7190889	848	848
538	DEBIT	Conference Grant - Sarah Olson	-110000	USD	2016-05-10 12:19:21.785-07	2016-06-14 11:14:22.032-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-110000	156	5b6a81e3-f2e8-4385-b39e-135cb7b5bb85	848	848
2809	DEBIT	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	-48435	USD	2016-10-31 14:08:49.332-07	2016-10-31 14:08:49.517-07	300	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-48435	417	7bfc67b7-3dd7-4f2c-a42e-1fd52bf01230	848	848
3313	DEBIT	Thank you gift to an amazing sponsor!	-1700	USD	2016-11-22 04:31:00.49-08	2016-11-22 04:31:00.691-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1700	501	125a7d4b-8e1c-43c0-af9a-e948de08c5a3	848	848
3949	DEBIT	Post-hackathon shipping supplies + supplies for Women + Tech Holiday Party	-3776	USD	2016-12-13 10:41:20.962-08	2016-12-13 10:41:21.652-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3776	\N	962a1612-7780-4b02-809c-bba5e34b9bf9	848	848
4266	DEBIT	Meetup Fees	-6000	USD	2016-12-23 09:32:55.31-08	2016-12-23 09:32:55.31-08	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	622	f3c80fd2-e51b-4124-a687-69f0abae37d6	848	848
641	DEBIT	05-21-16 AI workshop	-30000	USD	2016-05-22 17:26:36.061-07	2016-06-14 11:14:22.092-07	2	28	\N	2016-06-14 11:14:22.535-07	\N	\N	\N	\N	\N	\N	\N	\N	-30000	186	b1caa950-29a7-4b01-b194-5ad97dade460	694	848
254	DEBIT	WwConnect2016	-1025	USD	2016-03-19 17:00:00-07	2016-06-14 11:14:21.806-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1025	64	f42fde8c-31a0-49b2-ae8e-8a12eca9f4f5	777	848
1403	DEBIT	Transportation for Sandra and Cici to get to meeting location with core team members	-749	USD	2016-08-02 06:39:15.789-07	2016-08-02 06:39:15.797-07	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-749	256	c50bb623-b773-41c6-b71f-c815f6a3394c	777	848
2842	DEBIT	Transportation to get to GeekWire Summit social event 	-729	USD	2016-11-01 09:16:02.625-07	2016-11-01 09:16:02.953-07	14	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-729	402	f0415f03-23e6-4e11-8083-aac5401f4c17	848	848
7083	DEBIT	Leadership Development	-50616	MXN	2017-03-14 11:17:51.969-07	2017-03-14 11:17:51.969-07	282	3	\N	\N	\N	\N	\N	\N	0	MXN	1	-50616	-50616	887	f70817df-a428-4020-8076-87771fd39b1d	848	848
7087	DEBIT	Leadership Development	-14915	MXN	2017-03-14 11:18:46.358-07	2017-03-14 11:18:46.358-07	511	3	\N	\N	\N	\N	\N	\N	0	MXN	1	-14915	-14915	886	1f55f0d6-8cb7-4e26-bbce-64660bfdf8ad	848	848
2934	DEBIT	Cash for Prizes/Bartender	-50000	USD	2016-11-03 12:12:34.941-07	2016-11-03 12:12:35.306-07	2	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	fb9d785b-41ef-4c26-965c-98709813dd5f	848	848
2935	DEBIT	More stickers to give away at events	-18800	USD	2016-11-03 12:14:58.094-07	2016-11-03 12:14:58.245-07	13	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-18800	\N	31e6e55f-79bc-4a6a-800e-81bc4f5aa825	848	848
2940	DEBIT	Stacey Schipper	-2322	USD	2016-11-03 12:45:04.691-07	2016-11-03 12:45:04.691-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2322	\N	29073502-ed37-49ed-a06e-428e9b043bf8	848	848
2939	DEBIT	Event Food	-6471	USD	2016-11-03 12:43:50.827-07	2016-11-03 12:43:51.096-07	59	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6471	377	cf42497b-d717-4d8e-99cc-d12ab8b99170	848	848
10342	DEBIT	\N	-50000	CAD	2017-03-31 16:37:30.819-07	2017-03-31 16:37:30.819-07	848	3	\N	\N	\N	2217	0	0	0	CAD	1	50000	-50000	\N	1445e4fd-3d75-4f97-8049-a515082275e3	291	848
10343	CREDIT	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	4431	USD	2017-02-07 10:40:27.475-08	2017-02-07 10:40:27.96-08	716	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	4431	736	a3847538-c0f2-4fe7-8801-a47ae1b78ae3	59	848
10344	CREDIT	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	9050	USD	2017-02-07 10:40:49.494-08	2017-02-07 10:40:49.852-08	716	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	9050	790	32c59c21-708d-4fe0-81b1-449f40ac83d4	59	848
10345	CREDIT	Domain name for hackathon and study night projects	1798	USD	2017-02-20 12:53:02.864-08	2017-02-20 12:53:02.879-08	716	171	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	1798	497	4b668d76-3dd8-494d-8e76-7592c3fd9c42	59	848
10346	DEBIT	Recurring subscription	-53	USD	2016-07-09 11:31:14.547-07	2016-07-09 11:31:14.585-07	724	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	ad2bec76-5fc6-47fc-ae4f-64f14b60a911	3	848
10347	DEBIT	Recurring subscription	-53	USD	2016-08-09 11:30:50.866-07	2016-08-09 11:30:50.915-07	724	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	22c37363-ef03-4a73-9c71-f4515758a9a0	3	848
10348	DEBIT	Recurring subscription	-53	USD	2016-09-09 11:29:12.276-07	2016-09-09 11:29:12.276-07	724	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	a3f253c2-4d9b-476a-870a-0b3523d38f73	3	848
10349	DEBIT	Recurring subscription	-53	USD	2016-12-09 10:29:17.341-08	2016-12-09 10:29:17.341-08	724	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	826efe4f-9339-473b-8d40-061f4c423f79	3	848
10350	DEBIT	Recurring subscription	-53	USD	2016-10-09 11:36:17.958-07	2016-10-09 11:36:17.958-07	724	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	0b194d3d-4055-4eac-9262-c7fb945b79d8	3	848
10351	DEBIT	Recurring subscription	-798	USD	2016-12-01 15:32:26.764-08	2016-12-01 15:32:26.764-08	740	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	8e6d400d-e65d-4b37-84cc-67c757baa356	2	848
10119	DEBIT	Deposit- We Rise Conference Hosting Location	-500000	USD	2017-05-16 14:51:10.574-07	2017-05-16 14:51:10.574-07	12	3206	\N	\N	\N	\N	\N	\N	0	USD	1	-500000	-500000	1123	6f7e4a95-e8f5-408b-b4a6-c32168791436	690	848
229	DEBIT	Mar 3 hack night	-4951	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.784-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4951	55	3e4baefa-db35-450e-9660-bc4dca4d53fc	694	848
638	DEBIT	May 5 South Hack Night	-5325	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.083-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5325	181	f3cdf43c-6016-4d3f-812c-eedaec5a2fb3	694	848
230	DEBIT	Feb 1, Lightning Talks	-22568	USD	2016-03-20 11:06:09.887-07	2016-03-29 13:37:47.75-07	2	28	\N	2016-03-28 17:00:00-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1408a5bd-a893-4d39-8deb-eb1214cee9f5	694	848
228	DEBIT	Feb 4 hack night	-10284	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.784-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10284	53	2e9e7313-b914-49f1-b17c-14d67569cbf0	694	848
7082	DEBIT	Supplies for Agile workshop (2/26)	-5798	USD	2017-03-14 11:16:43.183-07	2017-03-14 11:16:43.22-07	59	171	2149	\N	\N	\N	\N	\N	198	USD	1	-5798	-5996	858	0f6dbfcd-8b66-44e1-8bfa-82b47855e172	716	848
232	DEBIT	Mar 7 Lightning Talks	-15316	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.794-07	2	28	\N	2016-06-14 11:14:22.455-07	\N	\N	\N	\N	\N	\N	\N	\N	-15316	57	814475bd-7972-4cc2-a22e-fe3da33bf0bf	694	848
231	DEBIT	Feb 1, Lightning Talks	-22568	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.794-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-22568	56	dd78e12f-6874-43c4-aa5e-5b54aff99c4f	694	848
640	DEBIT	May 2 Lightning Talks	-8979	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.092-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-8979	184	761dc700-eac2-44ef-8aa7-a3dc7268e489	694	848
639	DEBIT	April 4 Lightning Talks	-13315	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.091-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13315	183	8cd8612d-8c56-45a4-af58-054b1251d213	694	848
637	DEBIT	April 7 South Hack Night	-5037	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.083-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5037	180	c136a783-1ea9-48e1-aa36-325bc67a6c44	694	848
821	DEBIT	6/2/16 Fireside Chat at Orange Coworking	-20000	USD	2016-06-04 14:37:03.991-07	2016-06-14 11:14:22.145-07	2	28	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	211	ba544502-40c0-46d0-83d2-419108dfee18	694	848
7070	DEBIT	February Lightning Talks food	-10680	USD	2017-03-14 10:17:53.891-07	2017-03-14 10:17:53.957-07	2	28	1893	\N	\N	\N	\N	\N	340	USD	1	-10680	-11020	820	0b174ca7-35b7-4eb0-b540-345b64730630	694	848
10352	DEBIT	monthly recurring subscription	-798	USD	2017-02-14 10:13:04.109-08	2017-02-14 10:13:04.109-08	781	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	-1000	\N	48a774fd-dde1-4c2c-844d-90f82f02d16f	270	848
10356	CREDIT	Order for stickers of our official WWC Boulder/Denver chapter logo	7800	USD	2016-11-03 12:45:23.582-07	2016-11-03 12:45:24.25-07	848	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	7800	48	d199a851-53e8-4988-a6ff-3209f9eb6cbf	15	848
10359	CREDIT	Leadership Development Lodging	64600	USD	2016-11-21 13:26:46.916-08	2016-11-21 13:26:46.916-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	64600	\N	5dee54ad-e2a6-4115-9a94-7a3526836c61	12	848
10364	CREDIT	Conference stipend Elizabeth M.	75000	USD	2016-10-11 09:01:27.317-07	2016-10-11 09:01:28.351-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	02406950-c14d-42aa-a155-296a0fe8079e	195	848
10369	CREDIT	Minimum fee - June	1000	USD	2016-08-16 07:53:58.922-07	2016-08-16 07:53:58.936-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	d7efddaa-bd78-42d9-badc-7d6d95b31607	15	848
10374	CREDIT	STEM Toys for Coding with Kids Event	10212	USD	2016-08-16 07:58:32.03-07	2016-08-16 07:58:32.041-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	10212	293	cbdb0fd1-e535-4450-8e02-3b9462478cad	48	848
10381	CREDIT	Wine	1647	USD	2016-10-31 14:15:06.269-07	2016-10-31 14:15:06.517-07	848	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	1647	\N	3ed1ec08-2e1b-41f0-808a-af087d132344	2	848
10386	CREDIT	Leadership Tshirt Order	2698	USD	2016-12-07 08:51:43.784-08	2016-12-07 08:51:44.214-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2698	\N	1c5875a0-43a0-4692-a036-886eae68dcdb	59	848
10390	CREDIT	June South Hack Night	20568	USD	2016-10-31 14:11:20.573-07	2016-10-31 14:11:20.753-07	848	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	20568	451	a735db98-0b0f-4440-8305-1c99352bc3d8	2	848
10397	CREDIT	Event food	2911	USD	2016-09-15 17:09:43.149-07	2016-09-15 17:09:43.531-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2911	345	4d96b677-cdc7-4c23-a99a-2238f9942b55	59	848
10402	CREDIT	Coding books for our study groups (Humble Bundle -- Joy of Coding)	1500	USD	2016-08-19 13:58:54.527-07	2016-08-19 13:58:54.67-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	318	ea8c2c40-b8a1-4a03-b262-3a4904598382	48	848
10407	CREDIT	Beverage for Denver June meetup	2279	USD	2016-10-04 15:09:25.159-07	2016-10-04 15:09:26.045-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2279	\N	ecad4581-bc9c-4335-b6aa-62ea487cb4fe	15	848
10411	CREDIT	Leadership team dinner - Sondry interview	11757	USD	2016-08-02 06:44:04.201-07	2016-08-02 06:44:04.214-07	777	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	11757	307	58eedda0-41ba-4b39-9bd6-59ca58835530	14	848
10416	CREDIT	Event Food	2077	USD	2016-10-05 09:43:28.448-07	2016-10-05 09:43:28.644-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2077	374	6d45e868-2e51-4960-8d4f-fda140c3bc54	59	848
10421	CREDIT	Conference stipend - Gen A.	102409	GBP	2016-10-07 06:10:14.088-07	2016-10-07 06:10:14.841-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	102409	\N	4b216fcc-ab59-4c7c-ad77-596feae87b22	278	848
10426	CREDIT	lunch ordered at Costco	64978	USD	2016-10-28 14:30:59.537-07	2016-10-28 14:30:59.772-07	848	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	64978	418	c7af0504-33c2-487a-adc2-b24f6155bcc4	300	848
10431	CREDIT	Food (ATXDivHack)	119954	USD	2016-11-18 13:01:43.887-08	2016-11-18 13:01:44.336-08	848	3	1189	\N	\N	\N	\N	\N	\N	\N	\N	\N	119954	466	c8b0985f-1b59-403c-9f12-0306311726a6	2	848
10437	CREDIT	Frames for sponsor gifts	4054	USD	2016-11-30 08:11:18.637-08	2016-11-30 08:11:18.805-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	4054	\N	a012293d-fbf1-45bf-8d55-c19e2358e8b3	2	848
10442	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:59:33.873-08	2016-12-27 08:59:33.873-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	642	cf8b4b62-3e9d-4750-aad8-faeee1b18d04	276	848
10447	CREDIT	Leadership - Planning for 2017 - Afternoon Coffee	1175	USD	2016-12-19 10:42:59.021-08	2016-12-19 10:42:59.545-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1175	601	1cb25c20-9169-420b-a79e-4e3be702adf6	48	848
10452	CREDIT	Meetup Fees	4900	GBP	2016-12-23 10:04:05.755-08	2016-12-23 10:04:05.755-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	624	ec0d4581-6050-4391-bdb6-e7a7b64394f6	267	848
10457	CREDIT	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	6000	GBP	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	713	1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	506	45f745d5-801a-41f3-bf4b-d78cc92563f5	278	848
10462	CREDIT	WwConnect Conference Set Up Day 1	709	USD	2016-03-18 17:00:00-07	2016-06-14 11:14:21.805-07	777	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	709	61	2cbd39f3-4152-44be-92f7-698793427731	14	848
10470	CREDIT	Global Development	100	USD	2016-04-15 10:29:50.291-07	2016-06-14 11:14:21.861-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100	86	f30b11ae-a782-49c2-8fdb-cc87bb8ce422	13	848
10476	CREDIT	Global Development	0	USD	2016-04-12 11:52:16.188-07	2016-04-12 14:19:43.124-07	848	3	\N	2016-04-12 14:19:43.124-07	\N	\N	\N	\N	\N	\N	\N	\N	150	\N	48e68d02-952b-4bc1-a76d-1c2d38650ba5	4	848
10480	CREDIT	Drinks for Happy Hour (ATXDivHack)	5518	USD	2016-10-31 14:13:39.794-07	2016-10-31 14:13:40.146-07	848	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	5518	447	640a6cfb-0f7c-432a-9cbf-17aae925902d	2	848
10485	CREDIT	Conference Grant - Sarah Olson	20000	USD	2016-05-25 09:39:09.882-07	2016-06-14 11:14:22.103-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	190	7734cbea-9791-4493-b24c-71f24b75792e	48	848
10491	CREDIT	WWCode Portland Stickers	31950	USD	2016-10-10 13:12:33.813-07	2016-10-10 13:12:33.813-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	31950	411	51cc5e5c-b2d7-435b-980c-859d5574765b	59	848
10496	CREDIT	Director t-shirt	2898	USD	2016-10-17 13:57:20.051-07	2016-10-17 13:57:20.056-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2898	\N	0ef813b1-8550-4faf-98f7-bc2dc7019e44	3	848
10501	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:50:06.414-08	2016-12-27 08:50:06.414-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	639	1dd6e868-634c-45e3-aac4-b8a2fbf57b63	273	848
10506	CREDIT	Connect 2016 event setup day dinner	6800	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.838-07	746	32	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	6800	72	e643e706-c7e2-4520-9e30-786465329797	14	848
10511	CREDIT	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	21588	USD	2017-03-14 10:22:10.666-07	2017-03-14 10:22:10.681-07	780	70	1893	\N	\N	\N	\N	\N	638	USD	1	-20950	20950	899	fca1ee43-f564-4365-96fd-144b0823adf9	12	848
10517	CREDIT	Monthly core team meeting. Beverages with dinner for six members 	3080	USD	2016-10-31 10:59:53.602-07	2016-10-31 10:59:53.96-07	848	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	3080	401	7ddaa892-9e84-4018-b988-a8f0e9d75a26	14	848
10522	CREDIT	Conference Grant	50000	USD	2016-05-04 14:14:39.136-07	2016-06-14 11:14:22.01-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	145	0dbacdab-0900-48a0-a349-9af7da807119	13	848
10527	CREDIT	Banner	2000	USD	2016-11-30 13:33:38.691-08	2016-11-30 13:33:38.827-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	333383c6-9ad8-4f51-bea2-7c00b6fe5ad0	263	848
10532	CREDIT	T-shirt order - Design Lead	2698	USD	2016-12-06 08:51:54.984-08	2016-12-06 08:51:55.379-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2698	509	716d870a-dff8-48b5-a21c-5f7e1b4e2c0f	59	848
10537	CREDIT	Decorations / Supplies	1379	USD	2016-12-13 10:42:06.408-08	2016-12-13 10:42:07.17-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1379	\N	2190cff0-a98f-44fb-ae8f-89a59fc3d044	59	848
10542	CREDIT	Meetup Fees	6000	USD	2016-12-21 10:53:46.984-08	2016-12-21 10:53:46.984-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	607	99aff2ab-7673-4da0-82b5-8cf2f1ecc1a1	2	848
10547	CREDIT	Meetup Fees	6000	USD	2016-12-23 08:56:04.579-08	2016-12-23 08:56:04.579-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	616	801ec23a-adb7-4817-a44a-4024b0e11390	262	848
10552	CREDIT	Meetup Fees	6000	USD	2016-12-28 07:58:50.078-08	2016-12-28 07:58:50.078-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	662	2e41bb40-58ed-411f-899e-b641519b39ff	241	848
10557	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:16:27.082-08	2016-12-27 08:16:27.082-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	633	4ef6b9d3-0ca6-4045-8ab0-863eee07ea8d	271	848
10561	CREDIT	Meetup Fees	6000	AUD	2016-12-27 09:54:00.843-08	2016-12-27 09:54:00.843-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	649	e4b0c0e5-0eff-45c1-bb36-12b1626211c2	281	848
10566	CREDIT	IWD event -- wine for event	10044	USD	2017-03-14 10:22:31.446-07	2017-03-14 10:22:31.46-07	780	70	1893	\N	\N	\N	\N	\N	312	USD	1	-9732	9732	900	c4c3fb46-2b64-4d89-bd9d-378688a7e99c	12	848
10572	CREDIT	Meetup Fees	6000	USD	2016-12-28 07:53:05.613-08	2016-12-28 07:53:05.613-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	660	16388176-0e6c-49b2-b2a0-8890362dafd8	289	848
10577	CREDIT	CONFERENCE GRANT	34750	USD	2016-05-26 12:05:53.771-07	2016-06-14 11:14:22.123-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34750	197	64292465-4514-4433-9cb1-add256d47539	59	848
10582	CREDIT	Minimum fee - May	1000	USD	2016-08-16 07:54:12.931-07	2016-08-16 07:54:12.95-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	57038e2b-e016-418c-9427-d7f2446509dc	15	848
10586	CREDIT	Conference Grant	120000	USD	2016-05-19 12:07:13.723-07	2016-06-14 11:14:22.074-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	120000	175	bbfb60a1-4db5-4364-80b5-6cc26914cc9c	12	848
10591	DEBIT	Women Techmaker WWCode Partnership Grant	-120000	USD	2016-05-19 12:10:52.797-07	2016-05-19 12:10:54.053-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-120000	\N	3ac52835-05fe-48de-ab0e-f53b25ac8891	12	848
10596	CREDIT	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	88760	GBP	2017-03-27 09:01:27.19-07	2017-03-27 09:01:27.295-07	713	1333	2265	\N	\N	\N	\N	\N	3760	GBP	1	-85000	85000	926	78dc6ccb-dff4-450b-b26e-18e8f4bcb29e	278	848
10601	CREDIT	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	59040	USD	2017-02-07 10:32:48.784-08	2017-02-07 10:32:49.072-08	777	31	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	59040	776	814652f9-b8c8-4bf5-b56b-6bc12c4d2f0d	14	848
10606	CREDIT	Mile High Agile outreach- supplies	1115	USD	2016-04-02 17:00:00-07	2016-06-14 11:14:21.989-07	788	68	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	1115	136	020af23e-1783-4014-b3b7-417296ab47cc	15	848
10611	DEBIT	\N	-300000	USD	2017-05-02 11:43:43.157-07	2017-05-02 11:43:43.157-07	848	3	\N	\N	\N	2676	0	0	0	USD	1	300000	-300000	\N	b198e0ea-3508-4a59-ba86-95665a8366f7	12	848
10616	DEBIT	Donation received via Meetup, less fees	-788	USD	2016-10-04 09:46:13.302-07	2016-10-04 09:46:13.487-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-788	\N	1dbbd566-328b-4b9f-b15c-429888858ba0	12	848
10621	DEBIT	\N	-30000	USD	2017-05-03 10:33:13.688-07	2017-05-03 10:33:13.688-07	848	3	\N	\N	\N	2694	0	0	0	USD	1	30000	-30000	\N	ecc2f5d7-a94e-4fbb-8663-f070882cf063	51	848
10354	CREDIT	test 	0	USD	2016-04-06 10:39:39.954-07	2016-04-06 10:46:25.532-07	848	3	\N	2016-04-06 10:46:25.531-07	\N	\N	\N	\N	\N	\N	\N	\N	100	\N	5e7587df-e1bc-474b-8689-34f5b499eb33	14	848
10362	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:50:16.992-08	2016-12-27 11:50:16.992-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	656	d98664cc-bd6a-4541-8514-e1b2d08461ba	288	848
10367	CREDIT	Global Development	5000	USD	2016-02-21 16:00:00-08	2016-06-14 11:14:22.186-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000	227	109f60a3-c054-4e7b-b65e-95e0d9b770de	59	848
10371	CREDIT	Minimum Fee - June	995	USD	2016-08-16 07:55:14.822-07	2016-08-16 07:55:14.844-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	995	\N	0cf89218-9ce3-49cf-a12e-9c799c546ec0	48	848
10376	CREDIT	Global Development	250	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	250	96	ac58fc26-e304-4329-bbbc-6e75745f7a2a	48	848
10380	CREDIT	Network Budget pre Open Collective	11797	USD	2016-10-11 09:52:07.045-07	2016-10-11 09:52:07.303-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11797	\N	a3998c8d-14ed-4f61-82ab-f7251822b101	59	848
10385	CREDIT	Regional Leadership Director Training	631	USD	2016-11-29 14:38:46.551-08	2016-11-29 14:38:46.748-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	631	\N	d0ea34a2-99f8-4f46-aa5c-c4ecae9c47c1	47	848
10391	CREDIT	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	101200	USD	2017-05-04 12:06:09.002-07	2017-05-04 12:06:09.002-07	848	3	\N	\N	\N	\N	\N	\N	0	USD	1	-101200	101200	1099	6ebe2222-a68c-4681-b788-a1bdf8afaa00	430	848
10396	CREDIT	Reimburse Caterina Paun for supplies and mailing expenses	5504	USD	2015-12-14 16:00:00-08	2016-06-14 11:14:22.175-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5504	225	536e2efc-ba5e-481a-b5dd-7ce1e7832df0	59	848
10400	CREDIT	Pizza for July monthly event.	12555	USD	2016-08-16 07:52:47.781-07	2016-08-16 07:52:47.799-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	12555	\N	740666d8-667f-4e31-bf5e-f90bafd3a2d9	15	848
10404	CREDIT	Event food	3224	USD	2016-09-13 07:57:04.698-07	2016-09-13 07:57:05.111-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	3224	346	9768440a-e4f7-4931-acae-e9850503b586	59	848
10408	CREDIT	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	4351	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	700	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4300	483	27f9fed1-5c25-4a54-bf28-a5f68c42de30	273	848
10413	CREDIT	Google I/O Travel Stipend	100000	USD	2017-05-16 15:00:40.275-07	2017-05-16 15:00:40.275-07	847	142	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	100000	1088	ad95d1ad-0638-4d7a-bfd5-dc8f12547ad6	48	848
10419	CREDIT	Marketing Materials	2475	USD	2016-10-05 09:45:14.357-07	2016-10-05 09:45:14.485-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2475	376	aae8a78a-19e8-48e1-8745-81c5921adc39	59	848
10425	CREDIT	Gift Card for Volunteer	10000	USD	2016-10-27 14:03:46.196-07	2016-10-27 14:03:46.328-07	848	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	c18349a6-3efc-4ba9-a7a3-e679b1904df3	300	848
10430	CREDIT	Conference Travel	53720	USD	2016-11-03 14:27:22.46-07	2016-11-03 14:27:22.847-07	848	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	53720	333	43ec04ae-5e6c-41e7-9a35-d400695a1320	48	848
10435	CREDIT	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	4874	USD	2016-11-22 13:55:10.575-08	2016-11-22 13:55:10.713-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	4874	498	586850f4-debe-4273-9494-b96455bc79bc	59	848
10440	CREDIT	Leadership Event in Sofia	1019	EUR	2016-12-07 13:30:48.339-08	2016-12-07 13:30:48.523-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1019	470	cd486aca-5abd-47a8-8993-17ac88caa09f	301	848
10445	CREDIT	3D Printer & Supplies	30496	USD	2016-12-14 05:03:21.144-08	2016-12-14 05:03:21.949-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	30496	591	31a66f06-358a-4276-97c9-39df2cbed78d	48	848
10450	CREDIT	45 webcam covers + shipping	9685	USD	2016-12-21 07:39:46.852-08	2016-12-21 07:39:47.49-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9685	\N	6c8a1b07-b6ee-43f6-b394-2e86227a829e	59	848
10455	CREDIT	Global Developement	100	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	848	3	\N	2016-06-14 11:14:22.48-07	\N	\N	\N	\N	\N	\N	\N	\N	100	97	d8007195-9b11-4b72-a152-e677584b859b	13	848
10458	CREDIT	European Leadership Development Workshop -- Transportation, Taxi	4400	EUR	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	750	1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4400	493	3b73105f-215c-4420-8189-16b8ce8d8ecc	301	848
10463	CREDIT	travel to NY for bell ringing at NYSE	30000	USD	2017-01-25 10:20:51.642-08	2017-01-25 10:20:54.592-08	780	70	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	30000	743	ca0d9ed1-4811-4888-bf50-ccd6559b7f6f	12	848
10466	CREDIT	Amazon Echo Dot devices for HackNight and first book for our book club.	22137	USD	2017-01-25 10:44:31.311-08	2017-01-25 10:44:33.251-08	847	142	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	22137	725	4550a67b-5941-4b99-8897-4969f2561aca	48	848
10471	CREDIT	 Network budget balance pre Open Collective	4356	USD	2016-10-04 15:37:57.159-07	2016-10-04 15:37:57.359-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4356	\N	bc78692f-523f-4d8d-ac7d-bd8ee2ab00bf	273	848
10475	CREDIT	Global Developement	150	USD	2016-04-12 11:46:49.263-07	2016-06-14 11:14:21.849-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	150	79	8f1b3faf-b691-4afb-9421-fd81a2bad32e	4	848
10481	CREDIT	Almond milk for coffee (ATXDivHack)	1192	USD	2016-10-31 14:13:53.591-07	2016-10-31 14:13:53.747-07	848	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	1192	446	b4afe616-7877-4276-902f-268d8ff528d5	2	848
10486	CREDIT	Photographer: Mike Ross	65000	USD	2016-01-05 16:00:00-08	2016-06-14 11:14:22.114-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	65000	193	956b60b6-c7f3-4854-b6c4-8a37efb1b50a	48	848
10490	CREDIT	Conference stipend Udisha S.	75000	USD	2016-10-06 10:21:09.865-07	2016-10-06 10:21:09.933-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	1bf936c3-63ac-4617-ad50-e941b6b26c39	13	848
10495	CREDIT	Stickers for ATXDivHack 	15300	USD	2016-10-31 14:15:38.727-07	2016-10-31 14:15:38.89-07	848	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	15300	\N	d102e1b6-42fc-428a-94cc-515d41c16a1f	2	848
10500	CREDIT	Monthly team meeting w core six members. Food/pizza	3323	USD	2016-10-31 14:02:15.762-07	2016-10-31 14:02:16.402-07	848	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	3323	400	09a39438-f69d-4c9d-9afe-b09a7531d279	14	848
10504	CREDIT	Installfest	558	USD	2016-12-13 09:30:28.678-08	2016-12-13 09:30:30.347-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	558	\N	faa1e024-cbfe-4c7f-89d0-b504fc771aa9	59	848
10509	CREDIT	Connect Conference video footage review	2948	USD	2016-05-16 17:31:54.682-07	2016-06-14 11:14:22.053-07	777	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	2948	167	dbaf3472-d925-41fc-88e5-85664ea87236	14	848
10514	CREDIT	Supplies for decorating our robots	9777	USD	2017-05-16 15:00:15.557-07	2017-05-16 15:00:15.557-07	847	142	\N	\N	\N	\N	\N	\N	0	USD	1	-9777	9777	1085	1faa746b-150b-4002-83c8-63832b106081	48	848
10519	CREDIT	Fedex - certificate print expense	1962	USD	2016-10-31 14:32:07.365-07	2016-10-31 14:32:07.497-07	848	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	1962	\N	feefe30b-f966-4007-849e-32b86c774518	300	848
10523	CREDIT	Matthews Group - Leadership Development for Seattle team	60000	USD	2016-11-29 13:46:31.384-08	2016-11-29 13:46:31.384-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	60000	464	2a8e8844-f719-4677-8030-9e5ecadf67f1	14	848
10528	CREDIT	Network Budget pre Open Collective	77659	GBP	2016-10-07 07:03:00.623-07	2016-10-07 07:03:00.89-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	77659	\N	16408495-3ef8-4c06-8618-5347e1c870f5	278	848
10533	CREDIT	WWCode Seattle network retreat	6207	USD	2016-12-06 08:57:26.568-08	2016-12-06 08:57:26.935-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	6207	\N	8e08d3ac-6786-48aa-80a2-500b574a8a01	14	848
10538	CREDIT	Event suplies	2198	USD	2016-12-13 10:43:16.329-08	2016-12-13 10:43:17.27-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2198	\N	3cd0597a-a7e7-4b62-a2e0-198d11099819	59	848
10543	CREDIT	Meetup Fees	6000	USD	2016-12-21 10:54:30.839-08	2016-12-21 10:54:30.839-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	608	7dbfa4b7-bfe8-472c-b95b-ca80f1ad1bdb	3	848
10548	CREDIT	Meetup Fees	6000	USD	2016-12-23 11:38:46.818-08	2016-12-23 11:38:46.818-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	626	cb3a73e6-6129-43b0-ac5f-fcf8992718df	268	848
10553	CREDIT	Meetup Fees	6000	CAD	2016-12-28 08:21:52.469-08	2016-12-28 08:21:52.469-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	663	c38b3d80-e4af-4200-a95f-b8d67235714d	291	848
10558	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:23:35.936-08	2016-12-27 08:23:35.936-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	634	c881c238-518f-44e5-9124-cb7534cb6fe0	13	848
10563	CREDIT	Meetup Fees	6000	MXN	2016-12-27 10:01:07.417-08	2016-12-27 10:01:07.417-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	651	b7bd8dae-1cc6-4f57-8e51-5954de05c1bb	10	848
10568	CREDIT	Meetup Fee	6000	USD	2016-12-27 10:35:08.624-08	2016-12-27 10:35:08.624-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	653	6cb0098c-bc3f-4e28-8cf8-f14d87941142	284	848
10573	CREDIT	Meetup Fees	6000	AUD	2016-12-28 07:56:28.934-08	2016-12-28 07:56:28.934-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	661	bc2045dd-d0ce-4414-a053-b1fd476d7384	297	848
10578	CREDIT	Conference Grant	70000	USD	2016-05-19 12:07:13.723-07	2016-06-14 11:14:22.082-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	70000	178	2974460f-e0b6-474d-b79a-1d2ecbd3cfa5	3	848
10583	CREDIT	Monthly Minimum Fee - May	1000	USD	2016-08-16 07:51:38.913-07	2016-08-16 07:51:38.924-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	e04c186e-7a86-4166-b2ab-f314c44af5cd	12	848
10589	CREDIT	Meetup Transaction Fee	163	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	848	3	\N	2016-06-14 11:14:22.458-07	\N	\N	\N	\N	\N	\N	\N	\N	163	82	25af9bac-0dad-40a3-8ebf-5855151329f4	4	848
10594	CREDIT	Google I/O	51480	USD	2017-03-27 10:11:39.25-07	2017-03-27 10:11:39.275-07	709	69	2265	\N	\N	\N	\N	\N	1480	USD	1	-50000	50000	952	7a142983-5aab-4780-b97d-769f89703e5f	12	848
10599	CREDIT	Event supplies for Leads	2439	USD	2017-02-07 10:38:14.3-08	2017-02-07 10:38:15.58-08	716	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	2439	737	bc5bfe5f-dc33-47ea-9464-c73af986d06a	59	848
10604	CREDIT	payment to artists (spoken word) for performance at IWD event	20610	USD	2017-03-27 05:47:25.654-07	2017-03-27 05:47:25.894-07	780	70	2218	\N	\N	\N	\N	\N	610	USD	1	-20000	20000	907	6f7a7b8c-dddd-4413-9aaf-49ca007c2667	12	848
10609	CREDIT	Travel stipend to attend the Google I/O 2017 Conference.	107430	USD	2017-03-31 15:33:59.707-07	2017-03-31 15:33:59.731-07	845	1344	2321	\N	\N	\N	\N	\N	7430	USD	1	-100000	100000	962	f5790ba4-4deb-4746-a9a5-f4c7dec7db9c	286	848
10614	DEBIT	Donation via Meetup	-2036	USD	2016-10-04 09:42:35.996-07	2016-10-04 09:42:36.119-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2036	\N	b9da6cf4-5440-42af-90f4-b437caa8ca74	300	848
10355	CREDIT	Banner	2000	USD	2016-11-30 10:40:24.258-08	2016-11-30 10:40:24.443-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	5acb5dd9-e9fd-4c1e-8e27-b8f1909b5e10	292	848
10363	CREDIT	Cash for Prizes/Bartender (the extra money, $50, was not used for the hackathon)	70000	USD	2016-11-01 08:16:29.544-07	2016-11-01 08:16:30.012-07	848	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	70000	\N	fde75af9-fa13-4104-b31e-9b2b336619e6	2	848
10368	CREDIT	Thank you materials for several events.	6198	USD	2016-08-19 10:31:26.428-07	2016-08-19 10:31:26.891-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	6198	\N	15f6e089-20e5-4ae4-9250-24e4e3b4a336	59	848
10373	CREDIT	STEM Toys for Coding with Kids Event	8496	USD	2016-08-16 07:58:01.764-07	2016-08-16 07:58:01.789-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	8496	294	9c4943cb-db95-4c1c-9093-a011b6438919	48	848
10378	CREDIT	90/10 split: Beth Laing	500	USD	2016-10-04 09:06:09.85-07	2016-10-04 09:06:09.85-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500	391	ab59a80a-3618-4e43-a168-230f35df1bb3	12	848
10384	CREDIT	Director t-shirt	3186	USD	2016-10-17 13:58:31.776-07	2016-10-17 13:58:31.789-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3186	\N	c8551b5b-ca54-4760-ab78-4169ae8f14b6	271	848
10388	CREDIT	Meetup Fee	6000	USD	2016-12-27 08:52:46.242-08	2016-12-27 08:52:46.242-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	640	c93406ed-15db-43e4-98ab-5c25f7ec7bb1	274	848
10392	CREDIT	Meetup Donation Transaction Fee	163	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	163	81	b2bbb39a-8608-4b5a-93c6-c8ee65b328e5	4	848
10394	CREDIT	Conference Grant	50000	MXN	2016-05-16 07:49:37.27-07	2016-06-14 11:14:22.052-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	164	b5c21de5-970c-4e25-a686-3b4d9d79b3aa	10	848
10399	CREDIT	Minimum Fee - June	995	USD	2016-08-16 07:51:24.796-07	2016-08-16 07:51:24.811-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	995	\N	e0049ae1-3848-4a73-a1ef-708be845a9a3	12	848
10405	CREDIT	Two VR headsets for our AR/VR event at Best Buy.	4898	USD	2016-09-27 12:31:43.164-07	2016-09-27 12:31:43.42-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	4898	366	d1d55972-0a82-4bc2-8329-29a398186e98	48	848
10410	CREDIT	Libretas Hackathon	1038000	MXN	2016-02-16 10:56:17.216-08	2016-06-14 11:14:21.738-07	722	7	\N	2016-06-14 11:14:22.435-07	\N	\N	\N	\N	\N	\N	\N	\N	1038000	33	65ffe854-e9e8-4406-aae2-cb74940916d8	10	848
10415	CREDIT	Google I/O: Alicia Carr	10000	USD	2016-10-04 08:44:35.988-07	2016-10-04 08:44:35.988-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	387	2b278233-27b7-4d97-b9db-485eac851a05	12	848
10418	CREDIT	Event Food	7167	USD	2016-10-05 09:44:47.862-07	2016-10-05 09:44:48.013-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	7167	378	b601329a-fe39-4e31-8417-ff38badbaf94	59	848
10423	CREDIT	Snacks and dessert	38874	USD	2016-12-06 09:02:53.61-08	2016-12-06 09:02:54.44-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	38874	\N	d8104ef1-a462-4d65-a983-8d4615a1f2fb	59	848
10428	CREDIT	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	1305	USD	2016-10-31 10:52:11.82-07	2016-10-31 10:52:12.734-07	848	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	1305	427	f9a6c7d8-8117-4b77-99f1-ea322a3cbde2	14	848
10433	CREDIT	Food (ATXDivHack)	339421	USD	2016-11-21 07:23:08.279-08	2016-11-21 07:23:08.279-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	339421	467	a1cf0815-ba07-4224-91ad-c4ffd87d3821	2	848
10438	CREDIT	We Code Hackathon 2016	2374	USD	2016-12-06 08:50:34.842-08	2016-12-06 08:50:35.964-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2374	500	80d44a52-367f-4504-8abe-902fa2725e44	59	848
10443	CREDIT	Meetup Fees	6000	USD	2016-12-27 09:03:23.101-08	2016-12-27 09:03:23.101-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	643	f6c2d014-582a-4aab-abf2-0c51919c7b70	277	848
10448	CREDIT	Leadership - Planning for 2017 - Evening Coffee	875	USD	2016-12-19 10:43:53.809-08	2016-12-19 10:43:54.334-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	875	603	844794fa-8770-42bc-b26e-26e30435a6d6	48	848
10454	CREDIT	Meetup Fees	6000	USD	2016-12-28 08:32:19.412-08	2016-12-28 08:32:19.412-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	667	edb63293-850c-4e8b-8946-80b69ae53125	294	848
10460	CREDIT	WwConnect Conference	658	USD	2016-03-19 17:00:00-07	2016-06-14 11:14:21.806-07	777	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	658	63	62ca267a-4ff5-444c-b371-625715172a9a	14	848
10465	CREDIT	Drinks (La Croix water) for Jan HackNight	2093	USD	2017-01-25 10:41:33.613-08	2017-01-25 10:41:34.163-08	847	142	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	2093	724	d52e83d7-e774-45f6-93d8-a32c8e8861fa	48	848
10468	CREDIT	Test	1000	USD	2016-10-11 09:18:39.252-07	2016-10-11 09:18:39.252-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	413	204cdf50-7331-4e5c-8fcc-a415ae203c3f	195	848
10473	CREDIT	Global Development	150	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	848	3	\N	2016-06-14 11:14:22.479-07	\N	\N	\N	\N	\N	\N	\N	\N	150	93	92caed14-664b-4180-8057-ac5bf929483a	4	848
10479	CREDIT	Gift for organizer	3499	USD	2016-10-31 14:14:38.997-07	2016-10-31 14:14:39.22-07	848	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	3499	\N	8468c247-9b18-44cb-873c-51f7aa33b807	2	848
10484	CREDIT	Conference Grant	15000	USD	2016-05-24 12:42:50.307-07	2016-06-14 11:14:22.103-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000	188	b6c5376f-01ad-4077-8b39-2e61fe900ad1	13	848
10489	CREDIT	Drinks at Sept monthly event	2192	USD	2016-10-04 15:06:33.802-07	2016-10-04 15:06:34.357-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2192	\N	39b19d74-9e8b-48ac-aa42-d4ad25414087	15	848
10494	CREDIT	Director t-shirt	2860	USD	2016-10-17 13:56:00.744-07	2016-10-17 13:56:00.777-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2860	\N	2c3bf048-8461-4a7f-81e9-f3c4fbd16ff9	12	848
10499	CREDIT	Supplies / Gift Bags	4147	USD	2016-12-07 08:50:40.889-08	2016-12-07 08:50:41.383-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	4147	\N	0a95cdb9-ec07-4bb8-9906-06c66aba1f91	59	848
10505	CREDIT	IVA Libretas Hackathon	166080	MXN	2016-02-16 10:58:04.663-08	2016-06-14 11:14:21.738-07	722	7	\N	2016-06-14 11:14:22.436-07	\N	\N	\N	\N	\N	\N	\N	\N	166080	34	b30cf072-9cd5-417a-8de3-bfe3427cfe30	10	848
10510	CREDIT	Nike Dinner	1000	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.805-07	777	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	62	533ba626-50c5-42b7-bc96-6dc972848346	14	848
10515	CREDIT	WWCode Seattle planning lunch with Sara	2700	USD	2016-10-31 10:52:44.962-07	2016-10-31 10:52:45.274-07	848	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	2700	420	519d89d2-813c-4cc5-9c27-20b46c8a4a28	14	848
10520	CREDIT	September Ruby Tuesday	6497	USD	2016-10-31 14:11:36.488-07	2016-10-31 14:11:36.731-07	848	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	6497	450	fb9e0e66-7d9c-4246-992f-bc01d5d4b900	2	848
10525	CREDIT	Network budget pre open collective	55923	USD	2016-11-29 16:18:08.154-08	2016-11-29 16:18:07.832-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	55923	\N	605440b4-c3fe-4e32-8d15-c45b068708ee	285	848
10530	CREDIT	Marketing for IoT Hackathon	1082	USD	2016-12-06 08:50:56.549-08	2016-12-06 08:50:57.046-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1082	502	43307a2f-0435-4bc3-af85-e11b2d78324e	59	848
10535	CREDIT	WWC T-shirt	2798	USD	2016-12-06 08:59:36.33-08	2016-12-06 08:59:36.741-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2798	\N	a31334d7-34c3-4528-9184-11e44d433f18	59	848
10541	CREDIT	Leadership - Planning for 2017 - Dinner	9240	USD	2016-12-19 10:45:09.113-08	2016-12-19 10:45:09.64-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	9240	602	178329b2-a7e4-4def-b418-27152bc2de17	48	848
10546	CREDIT	Meetup Fees	6000	USD	2016-12-23 08:52:20.827-08	2016-12-23 08:52:20.827-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	615	44a221b8-4c84-4c9b-be79-346f011203d3	12	848
10549	CREDIT	Meetup Fees	6000	USD	2016-12-23 11:41:48.315-08	2016-12-23 11:41:48.315-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	627	cbd4c7bf-17eb-4b6c-800d-db48b9d5b42c	269	848
10554	CREDIT	Meetup Fees	6000	USD	2016-12-28 08:25:48.743-08	2016-12-28 08:25:48.743-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	664	a3ce3d6c-aa94-4c0f-b05f-25e344309221	48	848
10559	CREDIT	Meetup Fees	4900	GBP	2016-12-27 09:34:46.469-08	2016-12-27 09:34:46.469-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	647	dbd2e4ea-1a93-4abf-80fc-e906eb0c2565	278	848
10564	CREDIT	Stickers	15084	USD	2017-04-07 05:58:45.517-07	2017-04-07 05:58:45.531-07	702	3419	2321	\N	\N	\N	\N	\N	454	USD	1	-14630	14630	889	8a47e54b-0a26-4614-a40c-4496b56f767b	516	848
10569	CREDIT	Meetup Fees	6000	USD	2016-12-27 10:38:46.887-08	2016-12-27 10:38:46.887-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	654	be82e6e6-42dc-4e9c-ac75-9044722308ea	59	848
10574	CREDIT	Reimburse Caterina for program materials	3798	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.838-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3798	76	22f9934e-8caa-43e7-89bf-a3bd17882578	59	848
10579	CREDIT	Atlanta IWD Event	235699	USD	2017-04-17 12:17:23.032-07	2017-04-17 12:17:23.032-07	848	3	\N	\N	\N	\N	\N	\N	0	USD	1	-235699	235699	998	068a9dfc-0b6d-4ba4-92c9-5f6954d001f2	12	848
10584	CREDIT	Fedex 	3418	USD	2016-10-11 17:43:40.215-07	2016-10-11 17:43:40.344-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3418	\N	854c93e0-80bd-43e0-8df3-a22577056714	48	848
10588	CREDIT	Reimburse Caterina for travel expenses to CONNECT 2016	6500	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.839-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6500	75	1012cb63-a5a6-4fcd-92b2-fd4f492c2be6	59	848
10592	DEBIT	Nike Donation	-50000	USD	2016-06-09 21:08:56.525-07	2016-06-09 21:08:56.991-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	076d2375-e9f4-44b1-9fc9-da873c9ce191	59	848
10597	CREDIT	Event supplies	1601	USD	2017-04-11 12:13:28.544-07	2017-04-11 12:13:28.599-07	716	171	2321	\N	\N	\N	\N	\N	74	USD	1	-1527	1527	1002	3d4f9045-ca5b-43e6-ae71-69e32d90bc07	59	848
10602	CREDIT	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	6100	USD	2017-02-22 07:27:02.607-08	2017-02-22 07:27:02.62-08	777	31	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	6100	774	6eca8e33-f7bf-4170-af73-af3c8477a400	14	848
10607	DEBIT	Recurring subscription	-52	USD	2016-05-01 22:44:10.046-07	2016-05-01 22:44:10.072-07	839	126	93	\N	\N	95	5	10	33	USD	1	100	-100	\N	4f958fa1-a211-417f-b2d5-1030c372b5f1	13	848
10612	DEBIT	Conference Grant: Google/IO Alicia Carr	-10000	USD	2016-10-04 08:25:59.981-07	2016-10-04 08:26:00.186-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	1615ffc1-99e1-4b44-96a2-27a82766ee74	12	848
10617	DEBIT	Network budget balance pre Open Collective	-34240	USD	2016-10-04 14:49:31.268-07	2016-10-04 14:49:31.543-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-34240	\N	6c5d32a4-9fdd-47c9-ada1-6452635645f6	15	848
10622	DEBIT	\N	-75000	USD	2017-05-03 10:44:10.84-07	2017-05-03 10:44:10.84-07	848	3	\N	\N	\N	2696	0	0	0	USD	1	75000	-75000	\N	226e34ac-7dd3-476e-9955-13aa24528489	12	848
10628	DEBIT	Network Development +	-50000	USD	2016-10-07 13:24:13.595-07	2016-10-07 13:24:13.706-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	d8be2ce0-24de-410b-8fef-8bd6bdd318ad	300	848
10357	CREDIT	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	2838	USD	2016-11-03 14:13:31.956-07	2016-11-03 14:13:32.241-07	848	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	2838	409	96e713c6-d5a7-471b-8358-b3662cacd828	12	848
10360	CREDIT	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	8181	USD	2016-11-22 13:54:33.366-08	2016-11-22 13:54:33.644-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	8181	499	66689cef-71db-4130-b44b-230e75f6320c	59	848
10365	CREDIT	Global Development	150	USD	2016-07-08 20:52:40.722-07	2016-07-08 20:52:40.722-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	150	93	69e694b7-78e5-4e8c-9624-96db22895c01	4	848
10370	CREDIT	Minimum Fee - June	1000	USD	2016-08-16 07:55:45.164-07	2016-08-16 07:55:45.179-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	102244bd-0888-4656-b72b-fd15f174c6a3	59	848
10375	CREDIT	Marketing and communications materials for leadership team. 	4264	USD	2016-08-19 10:25:04.062-07	2016-08-19 10:25:04.374-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	4264	\N	e3cc14c1-9a21-48b4-a331-657332183c82	59	848
10379	CREDIT	Career development event w/ Mike Ross	65000	USD	2016-10-11 17:42:04.584-07	2016-10-11 17:42:04.834-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	65000	\N	90630357-ecbf-46fa-9189-1b37cfb5bf02	48	848
10383	CREDIT	05-21-16 AI workshop	30000	USD	2016-10-31 14:16:09.23-07	2016-10-31 14:16:09.38-07	848	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	30000	186	f783aec0-2c0e-4303-8d4d-a30e46df9348	2	848
10389	CREDIT	May AI Workshop	26800	USD	2016-10-31 14:10:54.112-07	2016-10-31 14:10:54.327-07	848	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	26800	452	d08eb7d4-cd69-47d9-b197-8c05d40cdaec	2	848
10395	CREDIT	Leadership Tools (director tees)	2698	USD	2015-12-14 16:00:00-08	2016-06-14 11:14:22.114-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2698	192	85e41ec6-044c-4708-9d29-e4f0a64f7330	48	848
10401	CREDIT	Minimum fee - May	990	USD	2016-08-16 07:53:06.001-07	2016-08-16 07:53:06.015-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	990	\N	4970df2f-0255-485c-bbef-09b65665fd8b	13	848
10406	CREDIT	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	2500	USD	2016-09-27 12:33:54.08-07	2016-09-27 12:33:54.272-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500	367	fe9d15fb-1d22-4ef0-9aac-1a71179164a1	48	848
10412	CREDIT	WWC Stickers	7000	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.998-07	788	68	\N	2016-06-14 11:14:22.481-07	\N	\N	\N	\N	\N	\N	\N	\N	7000	138	a0f91e2e-34f0-45d0-bae2-08921b5ee403	15	848
10417	CREDIT	Event supplies	2715	USD	2016-10-05 09:44:00.394-07	2016-10-05 09:44:00.521-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2715	375	a67a4bcd-81ad-4431-836b-b0c1cc1172df	59	848
10422	CREDIT	Leadership Development - speaking event	25000	USD	2016-11-29 14:39:25.11-08	2016-11-29 14:39:25.31-08	848	3	\N	2016-11-28 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	25000	\N	f34b0ad9-f892-4707-82e1-ec4b7526dac5	47	848
10427	CREDIT	Cash for Prizes/Bartender	50000	USD	2016-11-01 08:15:55.737-07	2016-11-01 08:15:55.892-07	848	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	4bf81126-6369-4a37-bd84-b936e12fee73	2	848
10432	CREDIT	Mathews Group 	60000	USD	2016-11-29 13:45:09.136-08	2016-11-29 13:45:09.136-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	60000	\N	5673f93f-61c1-482d-bb65-85b1068c9b61	14	848
10436	CREDIT	Postage to send hackathon gifts to sponsors	1628	USD	2016-11-30 08:09:00.364-08	2016-11-30 08:09:00.529-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1628	\N	690556d1-8bd7-479d-950b-59deae6a550a	2	848
10441	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:55:07.385-08	2016-12-27 08:55:07.385-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	641	482a475e-72ea-466e-b7b9-da191badd01e	275	848
10446	CREDIT	Robotics: Coding with Your Kids HackNight Supplies	20397	USD	2016-12-19 08:20:39.625-08	2016-12-19 08:20:40.499-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	20397	604	6e9fa4b8-77e9-46ed-816c-e3fabea73082	48	848
10451	CREDIT	Website - Domain Name	2200	USD	2016-12-22 14:19:51.088-08	2016-12-22 14:19:52.143-08	848	3	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	2200	372	42ac589a-ef00-4791-8437-0a60f73ffdc5	48	848
10456	CREDIT	CONFERENCE GRANT	80000	USD	2016-05-31 10:47:01.276-07	2016-06-14 11:14:22.123-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	80000	198	8e8438c5-4f7e-435a-be2b-ac5d17c96feb	13	848
10461	CREDIT	WwConnect planning meeting	4656	USD	2016-03-10 16:00:00-08	2016-06-14 11:14:21.794-07	777	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	4656	59	389bf7e1-a1cd-435f-b02e-0e82124627bc	14	848
10469	CREDIT	Global Development	100	USD	2016-04-26 20:56:08.086-07	2016-06-14 11:14:21.897-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100	101	bed858d0-0278-4b90-a241-9c6d9ebe069b	13	848
10474	CREDIT	Network support - Regional Leadership (thanks VMWare)	370000	USD	2016-10-11 12:51:28.361-07	2016-10-11 12:51:28.677-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	370000	\N	b5bd5cd7-c541-453e-bcea-090c2e4964c4	262	848
10478	CREDIT	Gifts for Organizers	2399	USD	2016-10-31 14:14:19.644-07	2016-10-31 14:14:19.81-07	848	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	2399	\N	f6dea35f-811a-48a9-8764-23f8df06b14b	2	848
10483	CREDIT	Minimum Fee - May	1000	MXN	2016-08-15 12:22:45.367-07	2016-08-15 12:22:45.38-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	02813662-336e-42fc-aceb-67c2d2954c32	10	848
10488	CREDIT	Net budget balance pre-Open Collective	56266	USD	2016-10-04 14:57:44.218-07	2016-10-04 14:57:44.218-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	56266	394	4b855ff6-6866-42d5-86c4-cff845b802c7	2	848
10493	CREDIT	WWCode Director t-shirt	3649	USD	2016-10-17 13:50:53.853-07	2016-10-17 13:50:53.855-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3649	\N	be7a56bc-304c-4968-adc1-eddcc311c486	47	848
10498	CREDIT	Network budget pre Open Collective	230712	USD	2016-10-07 13:01:03.429-07	2016-10-07 13:01:03.535-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	230712	\N	05576e9e-fe10-467f-a4f3-416387807a78	300	848
10503	CREDIT	DJ (ATXDivHack)	35000	USD	2016-10-27 14:08:48.506-07	2016-10-27 14:08:48.71-07	848	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	35000	453	4b205f33-26d1-4d70-ac53-0ce4edaf6600	2	848
10508	CREDIT	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	11500	USD	2017-05-16 14:55:26.725-07	2017-05-16 14:55:26.725-07	746	32	\N	\N	\N	\N	\N	\N	0	USD	1	-11500	11500	1119	ff91a599-88d8-4531-889c-505dea2493e0	14	848
10512	CREDIT	Snacks and batteries for our robots	1554	USD	2017-05-16 15:00:04.449-07	2017-05-16 15:00:04.449-07	847	142	\N	\N	\N	\N	\N	\N	0	USD	1	-1554	1554	1084	ed256248-45c4-4727-a48c-0f571d2ea8ce	48	848
10516	CREDIT	Pizza for our monthly October event	9276	USD	2016-10-31 11:07:11.805-07	2016-10-31 11:07:12.736-07	848	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	9276	\N	266c0a94-5abb-445d-a733-4d646668985b	15	848
10521	CREDIT	Drinks and snacks (ATXDivHack)	75932	USD	2016-10-31 14:13:05.943-07	2016-10-31 14:13:06.106-07	848	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	75932	449	42680b92-59af-49ec-97c9-dd2dc7bcaecd	2	848
10526	CREDIT	Conference Travel Stipend - Google I/O Elese	75000	USD	2016-11-30 13:25:56.197-08	2016-11-30 13:25:56.423-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	16863834-9c27-40a7-8942-b2f80cd0824f	276	848
10531	CREDIT	Supplies	3918	USD	2016-12-06 08:51:20.162-08	2016-12-06 08:51:20.661-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	3918	508	b8f3f7db-8826-4b0f-8bfd-1594bb6bd95a	59	848
10536	CREDIT	Leadership Event in Sofia	6444	EUR	2016-12-07 13:38:07.287-08	2016-12-07 13:38:07.429-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	6444	471	b7294057-2544-4ed4-965e-325c9bcdd02a	301	848
10540	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:53:07.2-08	2016-12-27 11:53:07.2-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	657	447ff0dd-fec3-4aeb-a99d-3bc6796a7a97	14	848
10545	CREDIT	Meetup Fees	6000	USD	2016-12-23 08:49:17.444-08	2016-12-23 08:49:17.444-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	614	ff13e425-2750-4493-a0b6-45e241f3ad50	261	848
10551	CREDIT	Meetup Fees	5700	EUR	2016-12-27 10:11:51.873-08	2016-12-27 10:11:51.873-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	652	95af4d12-0145-4334-87ba-cf5775d745e3	283	848
10555	CREDIT	Meetup Fees	6000	USD	2016-12-28 08:28:15.901-08	2016-12-28 08:28:15.901-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	665	cdf2950a-462c-44ea-b4e9-edcd5073120c	292	848
10560	CREDIT	Meetup Fees	6000	USD	2016-12-27 09:49:39.83-08	2016-12-27 09:49:39.83-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	648	eaa608f5-e6d2-4f07-bca6-ccb2d68fb76f	280	848
10565	CREDIT	To redeem travel stipend to Google I/O	104430	USD	2017-03-20 08:39:23.328-07	2017-03-20 08:39:23.364-07	712	1332	2180	\N	\N	\N	\N	\N	4430	USD	1	-100000	100000	924	131a0034-8420-4473-9066-d6577d1a8155	277	848
10570	CREDIT	Meetup Fees	6000	USD	2016-12-28 07:44:44.222-08	2016-12-28 07:44:44.222-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	658	018779ad-bf4f-42f4-9477-5ffa4cf163e0	4	848
10575	CREDIT	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	11815	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.839-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11815	74	02db1583-ca97-47d7-8c6c-1aade0a47fa3	14	848
10581	CREDIT	Travel Scholarship for WWCode Director	40970	GBP	2017-04-17 15:32:02.724-07	2017-04-17 15:32:02.724-07	848	3	\N	\N	\N	\N	\N	\N	0	GBP	1	-40970	40970	768	6cb1bd99-bc3f-4fd0-b35e-3d89508c6ca0	278	848
10587	CREDIT	Minimum Fee - May	1000	USD	2016-08-16 07:54:57.595-07	2016-08-16 07:54:57.609-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	f9b99474-7280-4e9f-bef8-297fbd5a61e6	48	848
10593	CREDIT	To redeem travel stipend to Google I/O	104430	USD	2017-03-27 10:54:16.729-07	2017-03-27 10:54:16.758-07	696	1331	2266	\N	\N	\N	\N	\N	4430	USD	1	-100000	100000	935	b28c0bd2-4e09-4fb9-b741-930c54a82d59	277	848
10598	CREDIT	Hackathon 2017 planning meeting	3005	USD	2017-04-11 12:15:09.813-07	2017-04-11 12:15:09.826-07	716	171	2321	\N	\N	\N	\N	\N	114	USD	1	-2891	2891	1001	17d50541-f09c-493a-874a-eec40b1ba778	59	848
10603	CREDIT	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	5458	USD	2017-02-22 07:27:45.429-08	2017-02-22 07:27:45.466-08	777	31	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	5458	775	9fa50a59-bdd1-4a7c-a5f7-112a17e431d3	14	848
10608	DEBIT	Recurring subscription	-52	USD	2016-06-01 22:48:36.714-07	2016-06-01 22:48:36.745-07	839	126	93	\N	\N	95	5	10	33	USD	1	100	-100	\N	04872f8b-7ee8-4565-a582-3efb45db46b3	13	848
10358	CREDIT	TShirts	145786	USD	2016-11-21 13:26:37.469-08	2016-11-21 13:26:37.469-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	145786	\N	4d5ecbea-5fa7-42e3-abe2-09c21c08fca3	59	848
10361	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:46:50.958-08	2016-12-27 11:46:50.958-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	655	92a31601-7a54-495e-9191-89c27aa84d46	287	848
10366	CREDIT	FedEx Office	3418	USD	2016-01-24 16:00:00-08	2016-06-14 11:14:22.114-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3418	195	e60b7f4b-04af-4743-a4f8-f072a2d61e80	48	848
10372	CREDIT	Minimum Fee - May	1000	USD	2016-08-16 07:55:31.274-07	2016-08-16 07:55:31.288-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	2fa98863-710e-495c-b28c-57c86f0e8249	59	848
10377	CREDIT	90/10 split: Turner matching donation	500	USD	2016-10-04 09:06:02.036-07	2016-10-04 09:06:02.036-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500	393	16b1a185-ef5c-4a13-8c26-5be8da0f1edc	12	848
10382	CREDIT	Sodas for ATXDivHack 	3871	USD	2016-10-31 14:15:22.809-07	2016-10-31 14:15:22.98-07	848	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	3871	\N	6d801b0a-89ad-442b-af2c-02d723fe87fe	2	848
10387	CREDIT	Conference stipend Olivia F.	39585	GBP	2016-10-07 06:35:08.613-07	2016-10-07 06:35:08.724-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39585	\N	fea06e81-bf86-4215-85af-8796a0328089	278	848
10393	CREDIT	Stacey Schipper Reimbursement	2322	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.873-07	848	3	\N	2016-06-14 11:14:22.471-07	\N	\N	\N	\N	\N	\N	\N	\N	2322	92	e9375c75-7ff2-4da9-af6b-8dae41063a79	15	848
10398	CREDIT	Food for Denver Meetup	9939	USD	2016-08-16 07:52:04.669-07	2016-08-16 07:52:04.682-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	9939	\N	2f1af0a5-137e-477d-9ac8-6976b3ab5c11	15	848
10403	CREDIT	Global Development	10000	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	80	d1371abc-02d6-4d71-8c7b-c29b010e0e08	59	848
10409	CREDIT	Plaques for IWD awards ceremony​ 	56402	USD	2017-03-15 06:57:14.454-07	2017-03-15 06:57:14.471-07	709	69	2149	\N	\N	\N	\N	\N	1619	USD	1	-54783	54783	888	0286a6ed-fa34-4794-b5c2-526c8db33e98	12	848
10414	CREDIT	90/10 split: AT&T Sponsorship (April 2015)	100000	USD	2016-10-04 08:44:28.558-07	2016-10-04 08:44:28.558-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	389	f9b839f5-c2ae-4695-affb-245993fe12fb	12	848
10420	CREDIT	Stickers	62984	USD	2016-10-06 08:49:20.942-07	2016-10-06 08:49:20.967-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	62984	\N	801fa743-b7bb-4aa6-b61d-72a18850b5c2	4	848
10424	CREDIT	Banner	2000	USD	2016-11-29 15:07:29.03-08	2016-11-29 15:07:29.148-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	cd7ff05d-a9d2-4321-9093-ceab99c4faa7	289	848
10429	CREDIT	dinner - downpament	70000	USD	2016-11-03 12:36:06.461-07	2016-11-03 12:36:06.793-07	848	3	1115	\N	\N	\N	\N	\N	\N	\N	\N	\N	70000	\N	33a7a124-611f-4bf6-8590-31e6bf8c3ba2	300	848
10434	CREDIT	DIANA A. SCHOLARSHIP GOOGLE I/O	25000	USD	2016-11-21 14:59:43.764-08	2016-11-21 14:59:43.764-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25000	396	99bc3019-e91b-4e94-9a22-8e3367b78734	272	848
10439	CREDIT	Goodie Bags	1058	USD	2016-12-07 12:49:55.814-08	2016-12-07 12:49:56.33-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1058	573	41fc1e35-65fd-4107-8755-0b113c0317eb	59	848
10444	CREDIT	Meetup Fees	6000	USD	2016-12-27 09:27:09.602-08	2016-12-27 09:27:09.602-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	644	880e4e66-7800-430b-9f2c-6993792da069	279	848
10449	CREDIT	Mugs for WWCode-SV	46419	USD	2016-12-20 10:57:28.399-08	2016-12-20 10:57:28.525-08	848	3	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	46419	605	e159f06a-8cec-4c53-a4ca-b312c2f730f4	300	848
10453	CREDIT	Meetup Fees	6000	CAD	2016-12-28 08:30:16.279-08	2016-12-28 08:30:16.279-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	666	2ff2ae56-e7a2-415e-9b70-280c7f680129	293	848
10459	CREDIT	European Leadership Development Workshop -- Transportation, Flight	4728	EUR	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	750	1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4700	494	6d6350a8-ad66-4041-932f-412415547986	301	848
10464	CREDIT	Order for stickers of our official WWC Boulder/Denver chapter logo	7800	USD	2016-03-17 20:23:34.628-07	2016-06-14 11:14:21.77-07	788	68	\N	2016-06-14 11:14:22.448-07	\N	\N	\N	\N	\N	\N	\N	\N	7800	48	f4878d4e-e4f3-4bfe-9445-f4ad134be5c0	15	848
10467	CREDIT	CONNECT 2016	2452	USD	2016-04-25 17:00:00-07	2016-06-14 11:14:21.896-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2452	99	cd1e18e2-17d1-4498-9b00-3cbe84fe6fba	14	848
10472	CREDIT	Global Development	150	USD	2016-04-27 09:21:00.228-07	2016-06-14 11:14:21.907-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	150	103	1b6ed6d4-d117-4732-9d5e-061f124a4364	48	848
10477	CREDIT	Markers, pens, sticky notes (ATXDivHack)	2108	USD	2016-10-31 14:13:19.592-07	2016-10-31 14:13:19.745-07	848	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	2108	448	5b69c08d-bf69-4069-a862-db217f606752	2	848
10482	CREDIT	Painters tape for signs  	1136	USD	2016-10-31 14:14:51.746-07	2016-10-31 14:14:51.945-07	848	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	1136	445	9e227724-c681-49e2-bad5-c346fe3264ee	2	848
10487	CREDIT	90/10 split: Hackathon donation	32000	USD	2016-10-04 15:05:22.85-07	2016-10-04 15:05:22.85-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32000	395	2e366eca-54b3-4fbf-bbbc-1504008c1e13	15	848
10492	CREDIT	Google I/O stipend	50000	USD	2016-10-11 09:00:21.246-07	2016-10-11 09:00:22.203-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	075ec624-8e3a-4f23-8521-23d99f1d64e1	195	848
10497	CREDIT	WWCode Director shirt	3649	USD	2016-10-17 13:49:16.114-07	2016-10-17 13:49:16.113-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3649	\N	5fa391eb-2ef2-483a-a119-6c9edf3ec22d	282	848
10502	CREDIT	Office Supplies for Hackathon.	10585	USD	2016-12-06 09:00:58.382-08	2016-12-06 09:00:58.806-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	10585	\N	1eea0a9b-cbbb-44b4-a7e9-5fe21f1330de	59	848
10507	CREDIT	Quarterly planning meeting	14000	USD	2016-05-05 17:18:43.265-07	2016-06-14 11:14:22.011-07	746	32	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	14000	147	1414333e-7057-4a14-90ff-a7100148fdee	14	848
10513	CREDIT	Business cards and stickers	11948	USD	2017-05-16 15:00:30.412-07	2017-05-16 15:00:30.412-07	847	142	\N	\N	\N	\N	\N	\N	0	USD	1	-11948	11948	1007	f5291d93-1c83-4717-b90e-7235f329b6f2	48	848
10518	CREDIT	Food for JavaScript Study Night - Oct. 11th	1446	USD	2016-10-31 11:19:11.822-07	2016-10-31 11:19:12.067-07	848	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	1446	419	c120f08f-eec2-44cb-8bad-a671b0e17d37	59	848
10524	CREDIT	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	227646	USD	2016-11-29 13:46:42.259-08	2016-11-29 13:46:42.259-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	227646	474	b2292d48-46f4-4edc-b1c8-1f8cb11e7040	14	848
10529	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:31:58.557-08	2016-12-27 08:31:58.557-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	636	28af1fa3-3db2-4a0c-b2b7-8094cf1bc223	15	848
10534	CREDIT	Hackathon - prizes for winners + goodies for thank you bags for sponsors/speakers/mentors/judges/volunteers	7750	USD	2016-12-06 08:57:59.164-08	2016-12-06 08:57:59.708-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	7750	\N	44476903-6969-40e7-a561-4ca8d406ce22	59	848
10539	CREDIT	Speaker and sponsor meetings (11/18 + 11/28) and event logistics (12/2)	2870	USD	2016-12-13 10:44:23.973-08	2016-12-13 10:44:24.945-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2870	\N	64cc03da-6576-49b5-b50f-f5eddfa460ba	59	848
10544	CREDIT	Meetup Fees	6000	USD	2016-12-23 08:37:59.322-08	2016-12-23 08:37:59.322-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	613	350f939a-976f-4b56-8ebc-e68fa1e73bf5	260	848
10550	CREDIT	Meetup Fees	6000	USD	2016-12-23 11:50:08.539-08	2016-12-23 11:50:08.539-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	628	0a5a45d0-1c41-45a6-9839-3e71c0aa4d5b	270	848
10556	CREDIT	Meetup Fees	6000	MXN	2016-12-27 08:12:26.224-08	2016-12-27 08:12:26.224-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	632	169e9bff-28c3-47cb-9e47-d3e9281cca70	299	848
10562	CREDIT	Meetup Fees	6000	MXN	2016-12-27 09:57:54.314-08	2016-12-27 09:57:54.314-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	650	f204a6e7-2c04-405b-bd88-9fc94231ea89	282	848
10567	CREDIT	Food for March Boulder, CO event	14000	USD	2016-03-17 11:48:54.413-07	2016-06-14 11:14:21.77-07	788	68	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	14000	46	6fe3eaef-1457-4cc9-b0aa-b09316191017	15	848
10571	CREDIT	Meetup Fees	6000	USD	2016-12-28 07:49:16.255-08	2016-12-28 07:49:16.255-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	659	6bbd40c3-f8ae-47d3-b282-a61f5348eb02	300	848
10576	CREDIT	WePay Fee	400	USD	2016-04-10 17:00:00-07	2016-06-14 11:14:21.907-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	400	104	2b2f3ab0-f10b-4a30-b425-33cef229261e	48	848
10580	CREDIT	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	100000	USD	2017-04-17 15:12:22.995-07	2017-04-17 15:12:22.995-07	848	3	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	100000	1027	9169f742-c8d7-4a0f-b5e1-36273de69b07	270	848
10585	CREDIT	Regional Leadership Director Training	13031	USD	2016-11-29 14:35:21.354-08	2016-11-29 14:35:21.522-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13031	\N	8ce1a6d6-6ba6-4859-8942-8cc8e442cc58	47	848
10590	CREDIT	500 gift cards, 19.62 printed awards	51962	USD	2016-10-31 14:09:11.281-07	2016-10-31 14:09:11.484-07	848	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	51962	416	55316de7-7f72-47cb-afa6-6bd4354543b3	300	848
10595	CREDIT	Google I/O ticket	38618	USD	2017-03-27 10:12:00.118-07	2017-03-27 10:12:00.138-07	709	69	2265	\N	\N	\N	\N	\N	1118	USD	1	-37500	37500	949	2faa2e9a-5c71-4573-b7e4-f12386466ec9	12	848
10600	CREDIT	Regional Leadership Event: Barcelona	19398	EUR	2017-05-16 14:49:07.885-07	2017-05-16 14:49:07.885-07	750	1378	\N	\N	\N	\N	\N	\N	0	EUR	1	-19398	19398	1122	7b453290-8b54-4ee4-aa25-e4ae37da35ad	301	848
10605	CREDIT	WWC Boulder- April event's food	14100	USD	2016-04-06 17:00:00-07	2016-06-14 11:14:21.989-07	788	68	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	14100	137	8e6f24ff-773e-44bb-ac4e-84c4ffa24298	15	848
10610	CREDIT	Leadership meeting	2989	USD	2017-05-16 14:59:48.206-07	2017-05-16 14:59:48.206-07	847	142	\N	\N	\N	\N	\N	\N	0	USD	1	-2989	2989	1086	799b963e-ce10-4f0f-8538-8b0c79f764ff	48	848
10615	DEBIT	Donation via Meetup	-1203	USD	2016-10-04 09:46:07.882-07	2016-10-04 09:46:07.993-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1203	\N	c1990c28-89be-40e6-8a43-82e3bd137224	13	848
10620	DEBIT	Network Development: Three Year Bonus:)	-50000	USD	2016-10-04 14:52:32.839-07	2016-10-04 14:52:32.962-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	a66e35e0-adcd-4142-b38c-075fba809d0f	2	848
10625	DEBIT	Network budget pre Open Collective 	-406519	USD	2016-10-06 11:36:30.275-07	2016-10-06 11:36:30.298-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-406519	\N	971e2f64-2a54-457c-a715-e0893d873e1a	13	848
10630	DEBIT	Network Development	-10000	USD	2016-10-11 09:52:38.277-07	2016-10-11 09:52:38.455-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	3a50a862-fe79-4c58-a235-020d11371878	59	848
10613	DEBIT	Donation Pamela V.	-4500	USD	2016-10-06 11:09:54.319-07	2016-10-06 11:09:54.357-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4500	\N	9d5d5fe4-a9b5-4aaf-a095-d7d057d1d3e9	13	848
10619	DEBIT	Network Development	-10000	USD	2016-10-04 14:50:13.582-07	2016-10-04 14:50:13.787-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	3c7c25ec-5141-4315-9dad-6a1f95b8c57e	15	848
10624	DEBIT	Network Development (Stickers)	-62984	USD	2016-10-06 08:49:44.329-07	2016-10-06 08:49:44.472-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-62984	\N	8d59baeb-9b8c-4169-8ac1-99eb44356466	4	848
10629	DEBIT	Network budget pre Open Collective 	-162598	USD	2016-10-11 22:01:43.648-07	2016-10-11 22:01:43.828-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-162598	\N	3665b32e-57f1-4ace-983c-0f73946ddfbb	264	848
10634	DEBIT	Director t-shirt	-3325	USD	2016-10-17 14:00:51.295-07	2016-10-17 14:00:51.425-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3325	\N	a556aaed-7cd1-463e-8e64-addbfa34f4fd	298	848
10639	DEBIT	Women Who Code Atlanta &amp; DevNexus Soirée - fees + global	-10875	USD	2017-03-13 10:05:28.744-07	2017-03-13 10:05:31.582-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10875	\N	2e203791-0863-4c01-910a-c518e28a4e3f	12	848
10644	DEBIT	Travel Stipend for CONNECT	0	USD	2017-04-03 13:24:58.616-07	2017-04-03 13:24:58.879-07	848	3	\N	2017-04-02 17:00:00-07	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	34283895-0d76-41e8-a996-5f6860c0f96d	511	848
10650	DEBIT	Turner Matching Donation	-5000	USD	2016-10-04 08:46:59.013-07	2016-10-04 08:46:59.134-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5000	\N	44d48a93-2310-4274-ab8b-1aaa52f5774e	12	848
10654	DEBIT	monthly recurring subscription	-53	USD	2017-03-09 10:29:18.778-08	2017-03-09 10:29:18.778-08	724	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	705a1cc0-4121-42d1-b88c-1aef2de8f2cc	3	848
10659	DEBIT	Donation to WWCode San Francisco	-53	USD	2016-06-21 09:05:01.251-07	2016-06-21 09:05:01.296-07	768	642	431	\N	\N	360	5	10	32	USD	1	100	-100	\N	fceb0e1f-e6b5-4a0e-aca1-7a83c8103288	4	848
10664	DEBIT	Donation via meetup	-2363	USD	2016-10-04 15:14:59.695-07	2016-10-04 15:14:59.884-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2363	\N	aae0cb7b-3256-4ac4-af01-7c56a550e0bc	272	848
10669	DEBIT	Course Hero Hackathon Support	-315000	USD	2016-10-07 07:39:15.069-07	2016-10-07 07:39:15.23-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-315000	\N	41130703-4fd0-4274-ae28-ad4d582ce38b	300	848
10674	DEBIT	Hackbright support for hackathon	-45000	USD	2016-10-07 13:04:15.299-07	2016-10-07 13:04:15.435-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-45000	\N	44da62d6-6808-4075-95a1-7770c8345699	300	848
10679	DEBIT	Network Development	-20000	USD	2016-11-29 14:43:53.719-08	2016-11-29 14:43:53.971-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	2d3a4e56-a34c-4758-8fb8-e979096be805	286	848
10684	DEBIT	Network Development	-20000	USD	2016-11-30 10:40:15.233-08	2016-11-30 10:40:15.446-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	af204510-0745-4283-98a1-bef73adaaceb	292	848
10689	DEBIT	Banner	-2000	USD	2016-11-30 13:19:37.017-08	2016-11-30 13:19:37.251-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	e656b658-8a07-45d5-bdbc-afee22fdb4ab	269	848
10694	DEBIT	Global Development for Meetup Fee	-5700	EUR	2016-12-23 09:13:39.369-08	2016-12-23 09:13:39.507-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	\N	63dce1fa-184e-4494-84d2-9ac0316edec7	301	848
10699	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:38:50.944-08	2016-12-27 08:38:51.039-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	84bb3a11-a520-417a-a241-8e417317ca58	272	848
10704	DEBIT	Global Development for Meetup Fee	-4900	GBP	2016-12-27 09:32:02.798-08	2016-12-27 09:32:02.918-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	\N	d818d480-e4e3-49c5-93ae-1c2061bee43c	278	848
10708	DEBIT	Global Development for Meetup Fee	-4900	GBP	2016-12-23 09:55:42.091-08	2016-12-23 09:55:42.249-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	\N	5ac59aa5-ba85-4040-a66b-3c0c65cf4ea6	267	848
10713	DEBIT	Donation to WWCode Austin	-26100	USD	2016-02-18 11:54:08.531-08	2016-04-16 13:40:58.717-07	730	108	71	\N	\N	15	0	3000	900	USD	1	30000	-30000	\N	d3d3ada8-cd95-414d-9d1a-8582acb1407e	2	848
10719	DEBIT	Google I/O stipend	-75000	USD	2016-10-11 09:01:42.326-07	2016-10-11 09:01:43.286-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	94877d0c-2c26-4e6d-8cf0-64f2f2ea2a8e	195	848
10724	DEBIT	From Lucas in honor of Rachel M. She learned Python and HTML/CSS	-2250	USD	2016-10-11 12:13:57.013-07	2016-10-11 12:13:57.265-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2250	\N	7d1b4670-a2b1-4f85-9570-96d27fb5b916	279	848
10729	DEBIT	Network Development	-17500	USD	2016-10-11 12:35:59.115-07	2016-10-11 12:35:59.305-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-17500	\N	6790f707-846c-4169-b862-c4dddbdc2274	301	848
10735	DEBIT	Network Development	-20000	USD	2016-10-11 13:03:19.884-07	2016-10-11 13:03:20.084-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	37aa58cd-65c8-488f-99ae-6ea191901018	271	848
10740	DEBIT	Proceeds from teespring	-10022	USD	2016-05-26 11:38:50.077-07	2016-05-26 11:38:48.41-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10022	\N	f9809d4a-a521-4e9b-8ea1-a30c853ac646	48	848
10745	DEBIT	Donation: Syema Ailia	-2500	USD	2016-10-04 08:47:46.468-07	2016-10-04 08:47:46.624-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2500	\N	721c40e9-5639-4bba-a2d9-b59a1ae9645c	12	848
10751	DEBIT	Google I/O scholarship	-75000	USD	2016-10-06 10:21:27.384-07	2016-10-06 10:21:27.396-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	d87e1b33-7892-4cf1-925b-9b59ce0ff0a3	13	848
10756	DEBIT	Donation to WWCode Austin	-123120	USD	2016-06-06 12:04:37.186-07	2016-06-06 12:04:37.308-07	762	551	377	\N	\N	312	7500	15000	4380	USD	1	150000	-150000	\N	2037d452-6d7b-4b9b-abd2-4996c553fa50	2	848
10765	DEBIT	Donation from Adane	-450	USD	2016-10-04 15:56:11.881-07	2016-10-04 15:56:13.02-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-450	\N	60d7cdbb-59d5-4163-a40b-c576ae1e9d3a	260	848
10769	DEBIT	Network Development	-18200	USD	2016-10-11 10:02:51.621-07	2016-10-11 10:02:51.839-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-18200	\N	865639bb-c351-4fac-87e2-eb42f4a89bc4	291	848
10775	DEBIT	Women Techmaker WWCode Partnership Grant	-20000	USD	2016-05-25 09:45:53.797-07	2016-05-25 09:45:54.045-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	56970915-27e4-4779-b126-473c799a61f2	48	848
10780	DEBIT	donation - fees and global development	-798	USD	2017-01-05 06:48:24.355-08	2017-01-05 06:48:26.734-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-798	\N	61d249de-1e44-4898-a833-e656cb38d460	241	848
10785	DEBIT	$5000 Intel Hackathon support - global development	-450000	USD	2016-11-17 10:23:08.268-08	2016-11-17 10:23:08.461-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-450000	\N	6da71a7d-a737-4e5d-809f-6f26a1e332a0	59	848
10790	DEBIT	Global Development	-15600	USD	2016-11-29 14:08:18.065-08	2016-11-29 14:08:18.213-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15600	\N	8a94a79e-122b-43a2-b02a-5a699ce5f76b	241	848
10795	DEBIT	Network Development	-2500	USD	2016-11-29 14:29:22.958-08	2016-11-29 14:29:23.167-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2500	\N	138e4354-27bb-4701-86b8-cc390c1754a2	282	848
10800	DEBIT	Donation via Meetup	-775	USD	2016-11-29 15:39:08.069-08	2016-11-29 15:39:08.263-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-775	\N	cc0ecd56-a752-4b1a-87d9-7c302ee286c4	300	848
10805	DEBIT	Global Development - Thanks VMWare	-50000	USD	2016-11-30 13:34:00.324-08	2016-11-30 13:34:01.658-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	04f4bc3b-dd5d-4fe3-9bd8-490e304c0738	263	848
10810	DEBIT	\N	-16300	USD	2017-04-04 12:51:04.916-07	2017-04-04 12:51:04.916-07	707	3999	2438	\N	\N	2332	1000	2000	700	USD	1	20000	-20000	\N	35883f66-a8e7-4d31-9362-c5eb95199f33	2	848
10815	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:48:41.246-08	2016-12-27 11:48:41.318-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	33da5a2f-d102-426a-ba78-892cb5604ab7	288	848
10820	DEBIT	VMWare foundation Donation - global development (Ramya V., Swathi U. and Anonymous) 	0	USD	2017-04-07 09:43:42.261-07	2017-04-07 09:43:42.673-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-24750	\N	d5f0379b-a704-4733-bc71-6ef292c71202	262	848
10825	DEBIT	Global Development for Meetup Fees	-6000	USD	2016-12-23 08:54:04.928-08	2016-12-23 08:54:05.055-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	bbf69ecd-cb1d-4833-83fa-60542f7689ed	262	848
10830	DEBIT	Global Development for Meetup Fee	-6000	JPY	2016-12-28 08:00:53.27-08	2016-12-28 08:00:49.939-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	02fb3ffc-0968-46e1-9dfb-0807b17561a2	295	848
10836	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:22:09.234-08	2016-12-27 08:22:09.351-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	82326aab-510e-48fb-b4ff-728f61d98114	13	848
10842	DEBIT	Global Development for Meetup Fee	-6000	MXN	2016-12-27 09:59:52.939-08	2016-12-27 09:59:53.047-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	9a14be6b-ce48-4d20-b2bf-17d67e986985	10	848
10847	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 07:51:42.465-08	2016-12-28 07:51:38.84-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	23807c29-11af-4e71-a334-43bca74494e3	289	848
10852	DEBIT	Leadership Development: Google I/O grant for Luisa M.	-100000	USD	2017-03-22 10:56:10.528-07	2017-03-22 10:56:10.804-07	848	3	\N	\N	\N	\N	\N	\N	\N	USD	1	\N	-100000	\N	9944099f-8eeb-4982-b948-895cf168ed51	3	848
10857	DEBIT	WWCode t-shirt sales	-4742	USD	2017-01-17 19:31:50.631-08	2017-01-17 19:31:50.774-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4742	\N	207bbae5-ef64-419e-9beb-64a087e4f7fd	2	848
10862	DEBIT	\N	-20670	USD	2017-04-10 18:09:50.621-07	2017-04-10 18:09:50.621-07	701	4153	2535	\N	\N	2421	1250	2500	580	USD	1	25000	-25000	\N	0a1b14ae-c6f9-4e23-b396-df5740013608	13	848
10868	DEBIT	Donation via meetup	-775	USD	2017-01-17 19:48:10.558-08	2017-01-17 19:48:10.699-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-775	\N	96228ea9-cd09-40a6-98fc-f58356f57fb6	272	848
10873	DEBIT	Gitlab - transaction and global development	-414	USD	2017-02-06 14:12:42.534-08	2017-02-06 14:12:42.684-08	848	3	\N	2017-02-05 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	-41400	\N	680d4d52-0339-481e-8f9a-4931a116d372	48	848
10878	DEBIT	Leadership Development: Google I/O travel grant for Gen A. 	-85000	USD	2017-03-27 06:25:14.008-07	2017-03-27 06:25:14.169-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-85000	\N	998117ee-e84a-4311-933a-ac505c7c5f42	278	848
10883	DEBIT	\N	-100000	USD	2017-03-27 10:52:38.123-07	2017-03-27 10:52:38.123-07	848	3	\N	\N	\N	2153	0	0	0	USD	1	100000	-100000	\N	3bfd10c6-74fe-4092-933a-52b143de8670	277	848
10887	DEBIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	-34750	USD	2016-05-26 13:50:28.413-07	2016-05-26 13:50:28.721-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-34750	\N	8a397828-a5dc-4a6b-87d8-f512f161818e	59	848
10892	DEBIT	\N	-100000	USD	2017-04-17 13:41:37.627-07	2017-04-17 13:41:37.627-07	848	3	\N	\N	\N	2472	0	0	0	USD	1	100000	-100000	\N	58456415-9eb1-4fd2-adb9-43fba8043b05	517	848
10618	DEBIT	Blurb donation	-54000	USD	2016-10-06 09:06:35.799-07	2016-10-06 09:06:36.235-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-54000	\N	69a80059-414c-49b5-b7b6-e6b1608c9244	3	848
10623	DEBIT	\N	-15000	USD	2017-05-03 10:44:48.715-07	2017-05-03 10:44:48.715-07	848	3	\N	\N	\N	2697	0	0	0	USD	1	15000	-15000	\N	406b34e3-94f6-4f0d-a388-111029bfbe6a	51	848
10627	DEBIT	\N	-2175	USD	2017-05-03 17:12:19.814-07	2017-05-03 17:12:19.814-07	848	3	\N	\N	\N	2702	0	0	0	USD	1	2175	-2175	\N	7459641c-b982-48a2-80a9-6c8beb0b08d3	259	848
10632	DEBIT	Director t-shirt	-2860	USD	2016-10-17 13:55:47.647-07	2016-10-17 13:55:47.671-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2860	\N	bfc029db-34aa-419f-a51c-e20440a1336e	12	848
10637	DEBIT	from Code2040	-90000	USD	2016-10-17 08:43:12.71-07	2016-10-17 08:43:13.113-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-90000	\N	b89a1321-f6f1-4397-b231-0c31c5aff6ce	2	848
10642	DEBIT	\N	-2175	USD	2017-05-04 09:21:53.684-07	2017-05-04 09:21:53.684-07	848	3	\N	\N	\N	2710	0	0	0	USD	1	2175	-2175	\N	12184c14-2ed4-44c7-a5de-73e68fa762fe	276	848
10647	DEBIT	Network Development	-10000	USD	2016-10-04 14:44:54.4-07	2016-10-04 14:44:54.58-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	b4211408-f6b7-429c-8ed7-ac4e7c0c179d	2	848
10653	DEBIT	Recurring subscription	0	MXN	2016-03-15 13:05:22.15-07	2016-04-01 07:32:17.381-07	722	7	64	2016-04-07 07:32:17.381-07	\N	83	5	\N	\N	\N	\N	\N	-100	\N	b9b54ede-63e2-4b96-8628-6df7af47173e	10	848
10657	DEBIT	monthly recurring subscription	-798	USD	2017-04-01 16:32:24.254-07	2017-04-01 16:32:24.254-07	740	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	2e3d568e-796f-4f33-9375-a20550108043	2	848
10662	DEBIT	\N	-4938	USD	2017-03-09 10:29:55.496-08	2017-03-09 10:29:55.496-08	789	3442	2104	\N	\N	2003	300	600	162	USD	1	6000	-6000	\N	bf20b1a5-a708-4ebe-a73a-1a777b055350	259	848
10667	DEBIT	Diana A. Scholarship Google I/O	-25000	USD	2016-10-04 15:19:06.989-07	2016-10-04 15:19:07.108-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-25000	\N	7e53d182-f9c0-4e49-9ef9-19bf59c3bc70	272	848
10672	DEBIT	Google I/O conference stipend	-102409	GBP	2016-10-07 06:10:42.97-07	2016-10-07 06:10:43.753-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-102409	\N	e03bcdb5-c960-4a51-90a4-50d35e8399b0	278	848
10677	DEBIT	Network Development (Thanks Atlassian) 	-20000	USD	2016-10-11 22:06:05.058-07	2016-10-11 22:06:05.202-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	3481d6f8-1dbb-431c-a54f-b0128924cdc3	266	848
10682	DEBIT	CONNECT 2016	-4536939	USD	2016-11-29 13:44:20.041-08	2016-11-29 13:44:20.185-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4536939	\N	1933a18f-64e0-4a0c-889c-584cf20bbcd0	14	848
10687	DEBIT	Leadership development - conference stipend Google I/O	-130000	USD	2016-11-30 13:07:12.142-08	2016-11-30 13:07:12.419-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-130000	\N	aeda2485-22f6-4ddc-8a22-0ef4dbd89664	241	848
10692	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 08:59:24.039-08	2016-12-23 08:59:24.291-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	562f9ccb-8837-46e1-b09e-fce7ea454f6f	263	848
10697	DEBIT	Global Development for Meetup Fee	-6000	AUD	2016-12-23 09:41:14.029-08	2016-12-23 09:41:14.193-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	e2e6219e-7b8e-4c9f-9173-fffab6d00ba2	266	848
10702	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 09:02:32.71-08	2016-12-27 09:02:32.843-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	8fe2fcc9-bd10-46fa-aa2e-157c75a2539d	277	848
10707	DEBIT	Donation via meetup - fees and global development	-775	USD	2016-12-13 12:20:15.375-08	2016-12-13 12:20:15.714-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-775	\N	c624e726-7a0e-43c3-a9f4-8199b09a5840	13	848
10712	DEBIT	Recurring subscription	-52	USD	2016-03-02 15:01:26.771-08	2016-04-16 13:40:58.719-07	724	8	45	\N	\N	71	5	10	33	USD	1	100	-100	\N	0c73f7d4-dea1-413c-9417-94299395fd86	14	848
10717	DEBIT	WWCode t-shirt sales	-1599	USD	2017-01-17 19:21:50.791-08	2017-01-17 19:21:50.964-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1599	\N	aba6fca8-94eb-41db-a6d6-801cccc342c5	271	848
10722	DEBIT	From Deepa	-1500	USD	2016-04-12 14:18:56.547-07	2016-04-16 13:40:58.847-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1500	\N	c59ae9b9-581d-4316-9e94-7fd7d0f989a4	4	848
10727	DEBIT	Donation from Biotti	-403	USD	2016-10-11 12:32:58.956-07	2016-10-11 12:32:59.265-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-403	\N	a4c39600-be95-4208-9ef9-de4deb1522c3	301	848
10732	DEBIT	Network Development	-15400	USD	2016-10-04 15:39:26.796-07	2016-10-04 15:39:26.9-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15400	\N	b1f4adec-c870-4713-a010-db02e60732af	273	848
10738	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-21 10:49:47.667-08	2016-12-21 10:49:47.892-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	3a19b08a-9939-4417-964e-038fc284029c	2	848
10743	DEBIT	Donation from MondoRobot & Avery Brewing Company: Hackathon Proceeds	-320247	USD	2016-06-29 11:42:31.848-07	2016-06-29 11:42:32.517-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-320247	\N	d1facef3-cf55-45a2-80b2-2345b6c1f412	15	848
10749	DEBIT	Network development	-6000	USD	2016-10-06 09:01:48.321-07	2016-10-06 09:01:48.667-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	f61b60a5-9639-4eb6-92a7-ec8aa5fe33bd	4	848
10754	DEBIT	Donation to WWCode Washington DC	-41020	USD	2016-04-29 06:51:19.1-07	2016-04-29 06:51:19.15-07	735	303	216	\N	\N	183	2500	5000	1480	USD	1	50000	-50000	\N	3968f33e-d498-4456-b6a1-8015cbc68297	13	848
10758	DEBIT	Recurring subscription	0	MXN	2016-04-02 13:10:38.206-07	2016-04-02 13:10:38.242-07	775	80	42	2016-04-07 13:10:38.206-07	\N	68	\N	\N	\N	\N	\N	\N	-500	\N	a2f397ee-1a7a-41c9-8851-85be3ee54561	10	848
10761	DEBIT	Leadership Development	-50616	MXN	2017-03-07 05:01:15.044-08	2017-03-07 05:01:15.192-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50616	\N	76b2a0a4-2a39-4f5b-b3f5-60884039bc74	282	848
10766	DEBIT	Network Development	-13286	USD	2016-10-04 15:57:17.136-07	2016-10-04 15:57:17.293-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13286	\N	5ae86e89-413c-4a84-9718-4e8d8db14b71	260	848
10771	DEBIT	Director t-shirt	-2898	USD	2016-10-17 13:57:08.514-07	2016-10-17 13:57:08.533-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2898	\N	2ab4faa8-583f-4502-95b7-9bfb2a7c2ffa	3	848
10776	DEBIT	Global Development for Meetup Fee	-5700	EUR	2016-12-27 08:34:45.59-08	2016-12-27 08:34:45.771-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	\N	cec482e9-bd3e-4df2-b659-3c54907d1326	298	848
10782	DEBIT	T-shirt payout	-1092	USD	2016-11-17 10:03:13.726-08	2016-11-17 10:03:13.862-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1092	\N	ca4a9577-deab-406c-9882-107ce49c49d5	59	848
10787	DEBIT	International Women's Day Atlanta	0	USD	2017-03-28 11:28:28.77-07	2017-03-28 11:28:28.938-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10350	\N	f0e2f369-4b1c-4863-bd3c-71de7d7d6d24	51	848
10792	DEBIT	Erica S. donation - fees	-450	USD	2016-11-29 14:12:36.336-08	2016-11-29 14:12:36.503-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-450	\N	f3469329-c69b-487a-beed-45999f21f193	287	848
10797	DEBIT	Regional Leadership Director Training 	-13031	USD	2016-11-29 14:35:05.252-08	2016-11-29 14:35:05.379-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13031	\N	d06ab440-7034-4ea7-bb77-804ff93f0d18	47	848
10802	DEBIT	Network Development	-20000	USD	2016-11-29 16:23:24.87-08	2016-11-29 16:23:24.511-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	960e236c-7987-4268-b444-581494bc864f	285	848
10808	DEBIT	Global Development	-80000	GBP	2016-11-29 13:14:00.118-08	2016-11-29 13:14:01.107-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-80000	\N	3660058a-de9d-4d59-b62a-0aec57f5a113	278	848
10813	DEBIT	\N	-10320	USD	2016-10-06 11:36:38.382-07	2016-10-06 11:36:38.382-07	830	1438	880	\N	\N	808	625	1250	305	USD	1	12500	-12500	\N	52106be7-5aaf-4d8d-9e3b-909d57fb2798	2	848
10818	DEBIT	\N	-20000	USD	2017-04-07 05:25:51.09-07	2017-04-07 05:25:51.09-07	848	3	\N	\N	\N	2393	0	0	0	USD	1	20000	-20000	\N	c64b7e19-542b-4d1c-879a-9126e6c13399	516	848
10823	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 08:45:15.022-08	2016-12-23 08:45:15.147-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	762507c2-27be-4053-b92a-cfd476e0f090	261	848
10829	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 11:48:39.526-08	2016-12-23 11:48:39.685-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	67380d5f-063d-4809-9722-7716a670e338	270	848
10835	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:14:47.836-08	2016-12-27 08:14:47.951-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	0239ce60-711c-49e7-ab44-1c4b5e79ff6a	271	848
10840	DEBIT	Global Development for Meetup Fee	-6000	AUD	2016-12-27 09:52:16.09-08	2016-12-27 09:52:16.167-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	7de1e241-ecf1-4d84-92d6-5cbc4e5ba25e	281	848
10845	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 10:37:31.611-08	2016-12-27 10:37:31.721-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	a9ce2047-efc3-454c-b270-a7b86a978d05	59	848
10850	DEBIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	-50000	USD	2016-05-26 13:48:43.015-07	2016-05-26 13:48:43.336-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	f6b873e0-edc5-415a-abe4-df7682fbcf43	59	848
10855	DEBIT	WWCode t-shirt sales	-982	USD	2017-01-17 19:30:10.748-08	2017-01-17 19:30:10.906-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-982	\N	d4b93789-1fe4-4c0b-9b5c-5010c9b31ed9	259	848
10860	DEBIT	WWCode t-shirt sales	-7570	USD	2017-01-17 19:34:31.424-08	2017-01-17 19:34:31.75-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7570	\N	df4d7999-7792-464e-b8e3-10bbb907c7df	300	848
10865	DEBIT	monthly recurring subscription	-798	USD	2017-04-09 21:43:06.965-07	2017-04-09 21:43:06.965-07	806	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	0bda9112-0d9d-432c-88a4-d70959b0c2df	241	848
10870	DEBIT	Taipei Donation - fees and global development	-8	USD	2017-02-06 12:11:26.406-08	2017-02-06 12:11:26.522-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-800	\N	9de500da-313a-4bb0-b65c-21c3b1800219	241	848
10875	DEBIT	Donations via meetup - fees	-12	USD	2017-02-06 14:58:38.922-08	2017-02-06 14:58:39.29-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1200	\N	109cb4f4-2ca9-482b-b607-2b7dd981af0e	13	848
10880	DEBIT	\N	-50000	USD	2017-03-27 10:10:04.622-07	2017-03-27 10:10:04.622-07	848	3	\N	\N	\N	2151	0	0	0	USD	1	50000	-50000	\N	4f402aa7-d655-43b4-a93b-54704f8ec616	12	848
10885	DEBIT	\N	-100000	USD	2017-03-27 10:53:48.539-07	2017-03-27 10:53:48.539-07	848	3	\N	\N	\N	2154	0	0	0	USD	1	100000	-100000	\N	5515d977-6c1f-410a-8bc5-57fff7ae1dfd	277	848
10890	DEBIT	\N	-4000	GBP	2017-04-17 12:31:52.919-07	2017-04-17 12:31:52.919-07	848	3	\N	\N	\N	2470	0	0	0	GBP	1	4000	-4000	\N	76e4f140-5a56-4a1d-a65e-c193254c8209	267	848
10626	DEBIT	Donations via Meetup	-3937	USD	2016-10-06 11:41:35.464-07	2016-10-06 11:41:35.487-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3937	\N	92415981-78ea-412e-8367-de9f9128dc02	13	848
10631	DEBIT	WWCode Director t-shirt	-3649	USD	2016-10-17 13:50:42.245-07	2016-10-17 13:50:42.273-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3649	\N	eb81c2c9-1521-461c-a9df-3ea3fcfcd714	47	848
10636	DEBIT	WWCode DC t-shirts sales	-9524	USD	2016-11-17 10:37:58.038-08	2016-11-17 10:37:58.232-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9524	\N	b70ec084-fb3e-422c-a8ff-9ee4e3ac0f2a	13	848
10641	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 09:08:24.515-08	2016-12-23 09:08:24.709-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	24ce277e-0d6f-4354-be83-bff0d0db3aa4	265	848
10646	DEBIT	Women Techmaker/WWCode Partnership Grant	-50000	USD	2016-05-16 13:01:14.238-07	2016-05-16 13:01:14.49-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	9dc3bfdd-1fae-4f31-9a33-f1baaf03fdf9	10	848
10651	DEBIT	Sponsorship: AT&T Hackathon Prize	-1000000	USD	2016-10-04 08:40:37.72-07	2016-10-04 08:40:37.853-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000000	\N	86d359e8-844f-4023-b3ca-2300a88e2efc	12	848
10656	DEBIT	Recurring subscription	-53	USD	2016-11-09 10:29:23.967-08	2016-11-09 10:29:23.967-08	724	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	17df829e-05dd-432d-adac-682eb0147da7	3	848
10661	DEBIT	Recurring subscription	-8250	USD	2016-08-03 10:47:25.319-07	2016-08-03 10:47:25.429-07	784	896	571	\N	\N	498	500	1000	250	USD	1	10000	-10000	\N	df4e8160-a01e-46b4-a839-750868f7a71c	4	848
10666	DEBIT	I am an active member and WWC has taken my career in tech to the next level. All the support and lessons from the WWC DC chapter are instrumental in me remaining in this field.	-2250	USD	2016-10-06 10:23:39.409-07	2016-10-06 10:23:39.459-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2250	\N	3719b1a9-c24b-4d4a-b90f-fc613cd58111	13	848
10671	DEBIT	Network Development	-19100	USD	2016-10-11 17:28:02.718-07	2016-10-11 17:28:03.121-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-19100	\N	020dca7e-0318-42a2-bae8-bfab29e57f53	284	848
10675	DEBIT	Donation from Shugo	-450	USD	2016-10-11 21:30:15.825-07	2016-10-11 21:30:15.896-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-450	\N	5a5b75a3-52b5-4899-b9d0-4b887ba9ae97	295	848
10680	DEBIT	Banner	-2000	USD	2016-11-29 15:07:15.153-08	2016-11-29 15:07:15.39-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	39286217-aca4-4cbe-92d4-342b464f2eb6	289	848
10685	DEBIT	Banner	-2000	USD	2016-11-30 10:40:32.021-08	2016-11-30 10:40:32.139-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	fc2534f7-cc94-4c4b-a0c3-6709f5abe4c9	292	848
10690	DEBIT	Regional Leadership Director Meeting 	-7500	USD	2016-11-30 13:20:06.733-08	2016-11-30 13:20:15.577-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7500	\N	9d9cf336-d7e2-4773-97e4-5938dd531076	269	848
10696	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 09:31:16.26-08	2016-12-23 09:31:16.392-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	8bcccf94-77d1-4b57-8e40-38b3fd824811	195	848
10701	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:58:32.613-08	2016-12-27 08:58:32.719-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	0f0d44e7-10dd-45a0-ae54-4c3f6054f508	276	848
10706	DEBIT	Donation via Meetup - fees + Global Development	-1187	USD	2016-12-13 12:17:57.936-08	2016-12-13 12:17:58.19-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1187	\N	01f1d6d3-a9d9-4f47-b498-267f092bab4e	272	848
10711	DEBIT	Donation to WWCode Seattle	-52	USD	2016-02-02 13:46:44.866-08	2016-04-16 13:40:58.7-07	724	8	45	\N	\N	71	5	10	33	USD	1	100	-100	\N	f0e333d5-d2b3-455d-96bb-080f529c487a	14	848
10716	DEBIT	WWCode t-shirt sales	-4397	USD	2017-01-17 19:20:52.226-08	2017-01-17 19:20:52.436-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4397	\N	28c8358d-3e29-46d5-988f-141587f458ac	273	848
10721	DEBIT	Leslie Mollner: Thank you very much for all the help I've received from WWCode -TC so far. -Leslie	-2250	USD	2016-04-06 11:17:07.204-07	2016-04-16 13:40:58.818-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2250	\N	49c389f7-d2e6-4cf0-b934-82d0528c20a3	48	848
10726	DEBIT	Network development - thanks Atlassian	-50000	USD	2016-10-11 12:30:14.934-07	2016-10-11 12:30:15.155-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	ed60bf82-e3d2-4450-99b9-a4deb4d590c9	297	848
10731	DEBIT	Donation Hannah B.	-9000	USD	2016-10-04 15:35:46.967-07	2016-10-04 15:35:47.153-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9000	\N	7a265f17-7242-4c4b-85dd-5c89f7e436e5	273	848
10736	DEBIT	Network Development (Thanks Zendesk)	-16129	USD	2016-10-11 13:26:22.964-07	2016-10-11 13:26:23.172-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-16129	\N	5b342603-0f5b-4f65-adc7-93ca5a91ddbc	298	848
10741	DEBIT	Global Development for Meetup Fee	-6000	MXN	2016-12-27 08:10:30.416-08	2016-12-27 08:10:30.529-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	8457881e-f258-4408-8ea3-b28aac063cd4	299	848
10746	DEBIT	Reverse duplicate transaction	-500	USD	2016-10-04 09:12:26.671-07	2016-10-04 09:12:26.903-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	\N	78903a91-666a-4aa1-b611-2173f2a4eb4c	12	848
10750	DEBIT	Network Development	-20000	USD	2016-10-11 09:02:18.108-07	2016-10-11 09:02:19.138-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	17ed5750-f9b9-4938-bb8f-9ac752777854	195	848
10755	DEBIT	Donation to WWCode Austin	-26100	USD	2016-03-25 08:11:04.684-07	2016-04-16 13:40:58.812-07	738	192	152	\N	\N	64	0	3000	900	USD	1	30000	-30000	\N	c08f7b2a-9d2b-482f-a5ba-6b6b5e6d4aa3	2	848
10760	DEBIT	Recurring subscription	-52	USD	2016-04-02 08:43:33.706-07	2016-04-16 13:40:58.808-07	839	126	93	\N	\N	95	5	10	33	USD	1	100	-100	\N	4b518029-cf72-4a59-9b4e-80803e46d59e	13	848
10763	DEBIT	WWCode t-shirt sales	-3563	USD	2017-01-17 19:28:29.874-08	2017-01-17 19:28:30.096-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3563	\N	f3e75600-09b5-45b0-8d90-4b04b01feef7	290	848
10770	DEBIT	Donation Scott Z. in honor of his sister	-1800	USD	2016-10-11 10:01:23.313-07	2016-10-11 10:01:23.731-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1800	\N	d3998640-edce-4e8a-9278-34586fb124cd	291	848
10774	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:53:55.856-08	2016-12-27 08:53:55.969-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	918e6577-ff6b-4740-a731-981e5119b8e2	275	848
10779	DEBIT	Donation - fees + global development	-1187	USD	2017-01-05 06:58:39.771-08	2017-01-05 06:58:42.205-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1187	\N	5ffd7a2b-f51c-4806-8bed-64a9ce9f0958	13	848
10784	DEBIT	$1000 Mozilla hackathon support - Global Development	-90000	USD	2016-11-17 10:21:06.154-08	2016-11-17 10:21:07.268-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-90000	\N	3db2af64-341d-4f9c-b056-9e258fd55500	59	848
10789	DEBIT	Network Development - 10k member bonus	-100000	USD	2016-11-29 13:58:23.625-08	2016-11-29 13:58:23.799-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	\N	c136932c-8b5a-4985-ab59-5860e332a0c5	4	848
10794	DEBIT	Network Budget Balance Pre Open Collective	-17475	USD	2016-11-29 14:28:03.065-08	2016-11-29 14:28:03.231-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-17475	\N	b29fa60e-202d-4460-a0d8-a081d1141243	282	848
10799	DEBIT	Donation from Margaret - fees	-2012	USD	2016-11-29 15:37:14.82-08	2016-11-29 15:37:15.082-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2012	\N	bd6eab38-53e6-4359-ae7f-25f4df8bce60	272	848
10804	DEBIT	Banner	-2000	USD	2016-11-30 13:33:30.25-08	2016-11-30 13:33:30.386-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	1025c78f-e3e4-4400-8142-2491c8573524	263	848
10809	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:52:05.93-08	2016-12-27 08:52:06.061-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	b8cbb8a2-aac0-40bc-b35c-28694e86655b	274	848
10814	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:44:22.123-08	2016-12-27 11:44:22.207-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	34253591-cc24-46d5-9c02-771507f3509b	287	848
10819	DEBIT	Global Development for Meetup fee	-6000	USD	2016-12-21 10:49:53.054-08	2016-12-21 10:49:53.302-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	62550c5e-568d-4749-b1d1-4aa057172284	3	848
10824	DEBIT	Global Development for Meetup Fees	-6000	USD	2016-12-23 08:50:35.869-08	2016-12-23 08:50:36.131-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	462e1f0b-a0a9-4294-9b17-ba46f28aa306	12	848
10828	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 11:40:51.309-08	2016-12-23 11:40:51.479-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	4478316a-80ea-4ada-946e-bf6b3e220177	269	848
10834	DEBIT	Global Development for Meetup Fees	-6000	USD	2016-12-27 10:40:49.86-08	2016-12-27 10:40:49.921-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	75a3d375-9f62-4474-8b6a-30823cda4c00	286	848
10839	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 09:48:49.207-08	2016-12-27 09:48:49.297-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	9caaadc4-a39b-4d13-949a-ba3b19b36786	280	848
10844	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 10:33:56.275-08	2016-12-27 10:33:56.372-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	8da2fa4c-b43f-4ece-a826-2119b2854dd5	284	848
10849	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 07:57:55.359-08	2016-12-28 07:57:51.831-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	90fbb435-1241-466a-aa23-fd3431b55434	241	848
10854	DEBIT	WWCode t-shirt sales	-1964	USD	2017-01-17 19:29:40.155-08	2017-01-17 19:29:40.284-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1964	\N	e07c6bfd-9844-4aa4-bd7a-31dc885df510	273	848
10859	DEBIT	WWCode t-shirt sales	-2371	USD	2017-01-17 19:33:30.061-08	2017-01-17 19:33:30.587-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2371	\N	9c359a4f-029e-4ee2-9a5b-2b7c510f70a8	271	848
10864	DEBIT	Recurring subscription	-798	USD	2017-01-01 15:32:21.416-08	2017-01-01 15:32:21.416-08	740	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	599c6b85-8552-46b9-bf1c-77f225dd4157	2	848
10869	DEBIT	Donations - Fees 	-173	USD	2017-02-06 12:06:15.502-08	2017-02-06 12:06:15.622-08	848	3	\N	2017-02-05 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	-17328	\N	31114b22-4209-4442-b9dc-5d8aed5c6c29	2	848
10874	DEBIT	Donations via meetup - fees/global development	-20	USD	2017-02-06 14:56:24.306-08	2017-02-06 14:56:24.52-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	7c62218a-8a31-4700-b311-98b007753ded	272	848
10879	DEBIT	\N	-90000	USD	2017-05-11 09:41:16.759-07	2017-05-11 09:41:16.759-07	848	3	\N	\N	\N	2794	0	0	0	USD	1	90000	-90000	\N	16762cb4-3721-48c9-9d18-4255f2dc59c9	59	848
10884	DEBIT	Quotient Hackathon support	-90000	USD	2016-10-07 12:52:59.206-07	2016-10-07 12:52:59.391-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-90000	\N	b9e7e703-b5e0-472c-951e-7d08edac21f1	300	848
1585	DEBIT	Minimum Fee - May	-1000	USD	2016-08-16 07:55:31.274-07	2016-08-16 07:55:31.288-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	17d4be5b-521f-499f-8753-2dbc163f2ec4	848	848
10633	DEBIT	Director t-shirt	-3186	USD	2016-10-17 13:58:21.952-07	2016-10-17 13:58:22.083-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3186	\N	47f675fa-f0b1-464a-86b2-2115be1c0e4c	271	848
10638	DEBIT	WWCode shirt Grisel	-3649	USD	2016-10-17 13:48:59.282-07	2016-10-17 13:48:59.313-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3649	\N	44ec18ea-0466-4528-be68-4cac74ad0ea4	282	848
10643	DEBIT	\N	-1200	USD	2017-05-04 11:58:24.9-07	2017-05-04 11:58:24.9-07	848	3	\N	\N	\N	2713	0	0	0	USD	1	1200	-1200	\N	216c10ab-7af1-4c38-85f8-6bf84ee14439	430	848
10648	DEBIT	Mary Griffus	-1000	USD	2016-04-26 21:41:38.126-07	2016-04-26 21:41:38.474-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	a945ccf1-4ebf-4458-883a-149eae710dae	13	848
10652	DEBIT	\N	-136	USD	2017-04-30 18:40:30.232-07	2017-04-30 18:40:30.232-07	702	3419	2749	\N	\N	2636	10	20	34	USD	1	200	-200	\N	bb064346-6eb6-464f-ac9a-4ab4eec2dca8	516	848
10658	DEBIT	\N	-41370	USD	2016-09-12 21:15:04.709-07	2016-09-12 21:15:04.709-07	755	1178	737	\N	\N	653	2500	5000	1130	USD	1	50000	-50000	\N	9f095666-1769-4670-a88d-8c51910aee6b	2	848
10663	DEBIT	monthly recurring subscription	-798	USD	2017-03-09 20:43:47.943-08	2017-03-09 20:43:47.943-08	806	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	3cf0cf06-5522-41f2-b1e3-dfded1d018ca	241	848
10668	DEBIT	Donation from Marie W.	-900	USD	2016-10-11 17:26:47.2-07	2016-10-11 17:26:47.59-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-900	\N	287e2987-e68f-4382-b9d2-9f48c5f2c0b0	284	848
10673	DEBIT	Network Development (100%)	-10000	USD	2016-10-07 13:05:13.011-07	2016-10-07 13:05:13.112-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	4e2afc2e-e068-46e4-8428-89e9a3d79558	300	848
10678	DEBIT	Regional Leadership Director Training	-631	USD	2016-11-29 14:38:57.006-08	2016-11-29 14:38:57.13-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-631	\N	3b036de9-c725-417d-b210-0d242072fc7f	47	848
10683	DEBIT	Donation from PB - fees 	-1187	USD	2016-11-29 15:33:50.04-08	2016-11-29 15:33:50.206-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1187	\N	a730b07f-831b-469e-b55d-8110058394c5	4	848
10688	DEBIT	Global Development	-20000	USD	2016-11-30 13:11:00.067-08	2016-11-30 13:11:00.307-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	e9abdd06-aea3-4c23-9513-cc51438ff61b	294	848
10693	DEBIT	Global Development for Meetup Fee	-4900	GBP	2016-12-23 09:02:53.836-08	2016-12-23 09:02:53.991-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	\N	e8f37b5f-d7dd-4cb6-8aba-19513ca2b1ec	264	848
10698	DEBIT	Google I/O stipend	-39585	GBP	2016-10-07 06:35:45.945-07	2016-10-07 06:35:46.151-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-39585	\N	a50d47c8-741d-4a31-8369-1876fdb32762	278	848
10703	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 09:24:55.371-08	2016-12-27 09:24:55.632-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	baa07816-c73e-4a81-958b-b3ef1ff04de0	279	848
10709	DEBIT	Global Development for Meetup Fee	-6000	CAD	2016-12-28 08:29:31.983-08	2016-12-28 08:29:28.409-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	e64aaec7-903a-4453-a422-6c25631cf34b	293	848
10714	DEBIT	Donation to WWCode Washington DC	-52	USD	2016-03-01 20:41:59.916-08	2016-04-16 13:40:58.728-07	839	126	93	\N	\N	95	5	10	33	USD	1	100	-100	\N	27f117d3-9ac1-43cb-a37e-0175a56a93b7	13	848
10718	DEBIT	Women Techmaker/WWCode partnership grant	-50000	USD	2016-05-04 14:17:27.653-07	2016-05-04 14:17:27.886-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	fe75cc9a-ec13-4472-b5a7-4d3ba56926fd	13	848
10723	DEBIT	Dalia donated to WWCode SF	-1500	USD	2016-06-09 11:40:21.124-07	2016-06-09 11:40:21.833-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1500	\N	b25d767f-4f62-4879-9b5d-49ff258812e6	4	848
10728	DEBIT	Andrea S	-1500	USD	2016-04-27 13:05:44.711-07	2016-04-27 13:05:44.974-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1500	\N	5757da9c-8c6d-41bc-998e-cc704b6d642a	48	848
10733	DEBIT	Network support - thanks VMWare	-200000	USD	2016-10-11 12:50:00.045-07	2016-10-11 12:50:00.312-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-200000	\N	e0a0afb0-c326-45dd-8f15-88bfb2babcc2	262	848
10737	DEBIT	Donation Elizabeth B.	-9000	USD	2016-10-11 17:22:08.455-07	2016-10-11 17:22:08.557-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9000	\N	8b02ce67-9c18-466d-930d-270450524033	288	848
10742	DEBIT	\N	-60000	USD	2017-05-02 11:45:44.253-07	2017-05-02 11:45:44.253-07	848	3	\N	\N	\N	2677	0	0	0	USD	1	60000	-60000	\N	58ce4dcc-88ba-42d2-a5ff-ec810721fd1f	51	848
10747	DEBIT	Donations made via Meetup as of Jan 2016, less transaction fees	-9212	USD	2016-10-04 08:46:17.845-07	2016-10-04 08:46:18.02-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9212	\N	64a7629c-7078-41c3-84f0-280f62dcd6f4	12	848
10752	DEBIT	Leadership Development 	-14915	MXN	2017-03-07 04:55:53.128-08	2017-03-07 04:55:53.3-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14915	\N	e22fbb22-1803-4bc8-9e98-bd1a36e0e44e	511	848
10757	DEBIT	Recurring subscription	-125	MXN	2016-03-02 10:06:23.743-08	2016-04-16 13:40:58.731-07	775	80	42	\N	\N	68	2	3	16	USD	17.8570999999999991	28	-500	\N	1afc63f3-0bd3-4be5-a67d-9bd1ab4db3e8	10	848
10764	DEBIT	Network budget pre Open Collective	-6264	USD	2016-10-04 15:51:25.324-07	2016-10-04 15:51:26.129-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6264	\N	3a063dad-9ea5-4dbb-b8d3-52f54631c589	260	848
10767	DEBIT	Network Development (100%)	-10000	USD	2016-10-06 11:42:47.682-07	2016-10-06 11:42:47.71-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	881305f8-0d1a-4551-b39f-a56617365ab1	13	848
10772	DEBIT	Stephen	-450	USD	2016-11-29 14:55:31.534-08	2016-11-29 14:55:31.727-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-450	\N	280ea8db-fed7-4791-be6f-c719269f276f	273	848
10777	DEBIT	Women Techmaker WWCode Partnership Grant	-15000	USD	2016-05-24 13:12:34.913-07	2016-05-24 13:12:35.226-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15000	\N	27a2f23a-0d55-47d4-a265-86f4a175b456	13	848
10781	DEBIT	Donation from Cameron - fees and global development	-4350	USD	2017-01-04 12:33:36.359-08	2017-01-04 12:33:37.475-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4350	\N	ed86314a-fd1c-4511-8c46-5495fce0bde3	259	848
10786	DEBIT	$3500 Course Hero Hackathon support - transaction & global development	-304500	USD	2016-11-17 10:27:12.528-08	2016-11-17 10:27:12.742-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-304500	\N	d17822b3-2ab9-4894-9ee0-56386205eaac	59	848
10791	DEBIT	Erica S. donation - fees	-450	USD	2016-11-29 14:11:37.922-08	2016-11-29 14:11:38.131-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-450	\N	277c0bf6-d07d-47aa-9721-6c3100016c39	287	848
10796	DEBIT	Banner	-2000	USD	2016-11-29 14:34:22.96-08	2016-11-29 14:34:23.085-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	204a77e7-26d4-4f22-a5f1-ccc871cc1671	47	848
10801	DEBIT	Donation via meetup	-775	USD	2016-11-29 15:39:42.382-08	2016-11-29 15:39:42.512-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-775	\N	e3bfafa1-4cc8-42e3-a4ea-d6e6bdb76680	13	848
10806	DEBIT	WTM Google I/O Travel Stipend	-50000	USD	2017-03-17 07:09:18.868-07	2017-03-17 07:09:18.344-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	78f11965-507b-45f0-8783-a001e237091b	195	848
10811	DEBIT	Recurring subscription	-798	USD	2016-10-01 16:35:17.911-07	2016-10-01 16:35:17.911-07	740	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	b0d8b2ec-140b-4901-98bc-b40c1abc1286	2	848
10816	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:51:47.92-08	2016-12-27 11:51:48.117-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	51fcdd6d-ab77-4e49-9008-a47769fdd6ce	14	848
10821	DEBIT	Travel Stipend for Google I/O	-100000	USD	2017-03-20 08:17:43.622-07	2017-03-20 08:17:42.994-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	\N	4eac6438-cc06-49f7-8b75-13f2356bc508	277	848
10827	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 11:37:32.49-08	2016-12-23 11:37:32.668-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	fd382943-3530-48a7-bff1-6550b010ec25	268	848
10832	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 08:24:49.292-08	2016-12-28 08:24:45.838-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	3f27ab4e-48ae-4365-984f-50947bbd454b	48	848
10837	DEBIT	Global Development for Meetup Fee	-6000	INR	2016-12-27 08:24:37.915-08	2016-12-27 08:24:38.038-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	95773b4c-92be-4578-9168-39d65ce65757	47	848
10841	DEBIT	Global Development for Meetup Fee	-6000	MXN	2016-12-27 09:56:03.911-08	2016-12-27 09:56:03.985-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	383d4f52-a307-4789-a6fe-89cac8b59ed9	282	848
10846	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 07:46:26.348-08	2016-12-28 07:46:22.824-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	01b84829-3723-4b24-aa85-40f2083cda69	300	848
10851	DEBIT	\N	-16563	EUR	2017-05-08 08:30:18.585-07	2017-05-08 08:30:18.585-07	848	3	\N	\N	\N	2741	0	0	0	EUR	1	16563	-16563	\N	d2c21494-176f-4db0-be07-fb819c0f786f	301	848
10856	DEBIT	WWCode t-shirt sales	-2778	USD	2017-01-17 19:30:54.132-08	2017-01-17 19:30:54.465-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2778	\N	f41052a0-6100-4fa0-a1a8-7b53f34b8851	3	848
10861	DEBIT	\N	-69522	USD	2017-05-09 11:14:23.283-07	2017-05-09 11:14:23.283-07	697	4720	2860	\N	\N	2755	4200	8400	1878	USD	1	84000	-84000	\N	66f4488b-3a36-4580-a76b-1a85ca020389	2	848
10866	DEBIT	Recurring subscription	-798	USD	2017-01-09 20:43:19.956-08	2017-01-09 20:43:19.956-08	806	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	afae7bb4-6444-45fc-9991-167335789f99	241	848
10871	DEBIT	Global Network Development	-500000	USD	2017-01-25 10:27:46.907-08	2017-01-25 10:27:47.421-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500000	\N	9a6633aa-b7ab-410e-993b-0c751c31b0ff	51	848
10877	DEBIT	\N	-154800	USD	2017-05-01 11:02:20.511-07	2017-05-01 11:02:20.511-07	848	3	\N	\N	\N	2649	0	0	0	USD	1	154800	-154800	\N	245c1ee4-bd8f-42ac-84c2-c6bfab6ee0b1	13	848
10882	DEBIT	\N	-20000	USD	2017-03-27 10:45:17.58-07	2017-03-27 10:45:17.58-07	848	3	\N	\N	\N	2152	0	0	0	USD	1	20000	-20000	\N	1433ab5d-564d-4cf2-bac2-3ea5ceb562ab	59	848
10888	DEBIT	Women Techmaker WWcode Partnership Grant	-100000	USD	2016-05-24 13:23:16.28-07	2016-05-24 13:23:16.552-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	\N	cdeb6d5c-4e6a-48c8-ab5a-91fed5d01f86	3	848
10893	DEBIT	\N	-5000	USD	2017-04-17 13:41:53.602-07	2017-04-17 13:41:53.602-07	848	3	\N	\N	\N	2473	0	0	0	USD	1	5000	-5000	\N	2c2f2daa-b250-4d65-821d-14d820ad4386	517	848
10898	DEBIT	\N	-25000	MXN	2017-04-17 15:34:32.259-07	2017-04-17 15:34:32.259-07	848	3	\N	\N	\N	2487	0	0	0	MXN	1	25000	-25000	\N	8e7d4c00-fc6c-4c08-991e-c4f79069565f	511	848
10902	DEBIT	VMWare Network Support	-195000	USD	2016-10-07 12:55:50.273-07	2016-10-07 12:55:50.509-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-195000	\N	5fd17fb0-f27d-4130-a035-292858ed8127	300	848
10635	DEBIT	$500 OpenGov hackathon support - transaction and global development	-43500	USD	2016-11-17 10:36:48.896-08	2016-11-17 10:36:49.046-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-43500	\N	24e33296-f03b-41b1-9133-0318ee528b1b	59	848
10640	DEBIT	Women Who Code Atlanta &amp; DevNexus Soirée global networks support	-1450	USD	2017-03-13 10:06:48.459-07	2017-03-13 10:06:51.099-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1450	\N	9994638f-5a97-4867-aa69-5bd2a0ae64b8	51	848
10645	DEBIT	WOMEN TECHMAKER/WWCODE PARTNERSHIP GRANT	-110000	USD	2016-05-10 14:15:06.327-07	2016-05-10 14:15:06.677-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-110000	\N	baeb1c66-a68c-475d-ae33-6076795750e8	48	848
10649	DEBIT	Jasna Rodulfa	-1000	USD	2016-04-15 07:17:21.126-07	2016-04-16 13:40:58.829-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	763f502d-dc44-42db-ad6b-162f87f26caa	13	848
10655	DEBIT	Donation to WWCode Mexico City	0	MXN	2016-02-15 10:46:05.92-08	2016-04-01 07:32:17.223-07	722	7	64	2016-04-07 07:32:17.381-07	\N	83	\N	\N	\N	\N	\N	\N	-100	\N	e30b2419-e22c-468d-a77d-1a231f806f73	10	848
10660	DEBIT	Donation to WWCode Austin	-61125	USD	2016-06-22 13:09:46.403-07	2016-06-22 13:09:46.432-07	772	646	435	\N	\N	364	3750	7500	2625	USD	1	75000	-75000	\N	1a08e0e7-56cc-40ca-8446-3efc1ae53a1b	2	848
10665	DEBIT	Network Development	-17375	USD	2016-10-04 15:15:45.133-07	2016-10-04 15:15:45.269-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-17375	\N	9ec15269-0b17-4317-9832-1157e3280cc8	272	848
10670	DEBIT	Hackathon Support Open Gov	-45000	USD	2016-10-07 07:41:08.315-07	2016-10-07 07:41:08.391-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-45000	\N	f133e50e-fbcc-4a72-b95b-bede40c5ba95	300	848
10676	DEBIT	Network Development	-19550	USD	2016-10-11 21:30:34.678-07	2016-10-11 21:30:34.772-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-19550	\N	7b9f692a-f8e4-4aee-b72c-bd896a1c7115	295	848
10681	DEBIT	Global Development - thanks VMWare	-50000	USD	2016-11-29 15:07:50.964-08	2016-11-29 15:07:51.154-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	f8e4326f-1d26-438a-9116-b97c2ac8f30f	289	848
10686	DEBIT	Network Development	-20000	USD	2016-11-30 12:59:29.087-08	2016-11-30 12:59:29.921-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	9f0bacc6-ce76-4cfd-a8c9-1b446a6f42ac	280	848
10691	DEBIT	Regional Leadership Director Meeting 	-7500	USD	2016-11-30 13:20:12.669-08	2016-11-30 13:20:16.148-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7500	\N	7b25e2af-cbe3-499a-923c-f4ab67a12870	269	848
10695	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 09:20:13.429-08	2016-12-23 09:20:13.545-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	5af90536-a333-4be5-98ff-43489fadd5b9	259	848
10700	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:48:52.922-08	2016-12-27 08:48:53-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	1ec5d227-29f6-4429-9a7e-30cd064b8ea8	273	848
10705	DEBIT	Priyanka - IOT Hackathon donation - fees and global development 	-2175	USD	2016-12-13 12:08:29.218-08	2016-12-13 12:08:29.464-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2175	\N	3b7a9153-4462-40c4-b1ef-210c801d3e9d	59	848
10710	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 08:31:33.43-08	2016-12-28 08:31:29.837-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	9d44498c-6807-47b7-963b-f02b0f714507	294	848
10715	DEBIT	WWCode Boston t-shirt sales	-1964	USD	2017-01-17 19:19:47.816-08	2017-01-17 19:19:48.024-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1964	\N	d18a1fd7-f094-476c-804f-1a351e95634c	195	848
10720	DEBIT	From:\tThao Le	-1500	USD	2016-04-12 11:49:06.645-07	2016-04-16 13:40:58.815-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1500	\N	e56029c9-6100-409a-b160-5fc22c2e9765	4	848
10725	DEBIT	Network Development	-17750	USD	2016-10-11 12:17:21.991-07	2016-10-11 12:17:22.199-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-17750	\N	cd5ddb0f-7bf3-426d-ba5a-349ea9b77d7d	279	848
10730	DEBIT	Donation Ailia S.	-9000	USD	2016-10-11 12:44:42.807-07	2016-10-11 12:44:43.161-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9000	\N	4e233e0f-4164-4a66-9b4c-5650fe50a177	270	848
10734	DEBIT	Network support - Regional Leadership (thanks VMWare)	-370000	USD	2016-10-11 12:51:45.723-07	2016-10-11 12:51:45.897-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-370000	\N	03510ce5-20c5-4a41-873b-2e282fc0fca5	262	848
10739	DEBIT	Generous donation from Target to support WWCode Twin Cities	-500000	USD	2016-05-26 11:37:24.922-07	2016-05-26 11:37:23.286-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500000	\N	2ab2dc39-038b-462e-b0eb-504d0373a0e5	48	848
10744	DEBIT	Donation: Beth Laing	-5000	USD	2016-10-04 08:47:24.058-07	2016-10-04 08:47:24.175-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5000	\N	1015a297-bf7b-48d4-bad8-d060f5d93f2e	12	848
10748	DEBIT	Donations via Meetup	-2823	USD	2016-10-06 08:53:38.156-07	2016-10-06 08:53:38.231-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2823	\N	2720e8c0-f268-44b0-a41c-7c7c703a1b4c	4	848
10753	DEBIT	Recurring subscription	-52	USD	2016-05-02 15:49:03.545-07	2016-05-02 15:49:03.612-07	724	8	45	\N	\N	71	5	10	33	USD	1	100	-100	\N	be56fc27-afc9-4110-a167-0d504b9cb2c1	14	848
10759	DEBIT	Donation to WWCode Washington DC	-82070	USD	2016-06-06 17:53:47.603-07	2016-06-06 17:53:47.649-07	801	555	381	\N	\N	316	5000	10000	2930	USD	1	100000	-100000	\N	e37fc15c-bcba-43b2-9fcd-01cc22b9a9bb	13	848
10762	DEBIT	\N	-150000	USD	2017-05-03 10:32:39.653-07	2017-05-03 10:32:39.653-07	848	3	\N	\N	\N	2693	0	0	0	USD	1	150000	-150000	\N	14c55ba7-d068-4f31-9758-bc4ba9721b49	12	848
10768	DEBIT	Conference stipend Heidi H.	-50000	USD	2016-10-11 08:59:30.363-07	2016-10-11 08:59:31.524-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	a7ab39bc-f6da-4684-8c35-b853d41b5735	195	848
10773	DEBIT	Portland t-shirt proceeds	-6915	USD	2016-11-17 10:01:32.1-08	2016-11-17 10:01:32.49-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6915	\N	e9c43c79-f3a3-477d-b6dd-6616e7cde7e3	59	848
10778	DEBIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	-80000	USD	2016-05-31 11:01:08.532-07	2016-05-31 11:01:07.064-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-80000	\N	9ce96c5e-32b7-4a59-89c6-14edc6d7c52c	13	848
10783	DEBIT	$1000 CDK Global event support - transaction and global development	-87000	USD	2016-11-17 10:18:40.107-08	2016-11-17 10:18:40.436-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-87000	\N	f661ba8e-c30f-4b4c-851c-ced6e468d9d8	59	848
10788	DEBIT	Global Development	-20000	USD	2016-11-29 13:56:45.442-08	2016-11-29 13:56:45.713-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	d9fe1e1b-d151-46d6-a3d2-34b13a9e5c31	290	848
10793	DEBIT	Global Development	-19100	USD	2016-11-29 14:17:18.389-08	2016-11-29 14:17:18.558-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-19100	\N	92ce5032-8bcc-43eb-838a-38a2e15eaecc	287	848
10798	DEBIT	Global Development	-20000	USD	2016-11-29 15:34:32.59-08	2016-11-29 15:34:32.817-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	686aefad-2ba6-4f71-ae79-d54ca5d1dea9	259	848
10803	DEBIT	Conference Travel Stipend - Google I/O Elese	-75000	USD	2016-11-30 13:25:31.161-08	2016-11-30 13:25:41.165-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	0b6912ce-7f37-4c45-ab10-4ca1b994187c	276	848
10807	DEBIT	Network Development	-15755	GBP	2016-10-07 07:03:54.031-07	2016-10-07 07:03:54.119-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15755	\N	8f64cf8e-88bc-4969-b8b3-127fd409c717	278	848
10812	DEBIT	Donation to WWCode Mexico City	-148	MXN	2016-02-02 08:52:02.237-08	2016-04-16 13:40:58.703-07	775	80	42	\N	\N	68	1	2	16	USD	18.5100000000000016	27	-500	\N	0be296dc-1175-4015-9847-8cae6d914385	10	848
10817	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:54:51.439-08	2016-12-27 11:54:51.679-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	d9a0320c-1e18-4907-96c3-80d015ee5b12	4	848
10822	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 08:32:00.456-08	2016-12-23 08:32:00.622-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	e737d576-9f5c-4f6f-9791-de10c1c01f6f	260	848
10826	DEBIT	Paypal Fees for Travel Stipend	-3000	USD	2017-03-20 08:38:54.453-07	2017-03-20 08:38:53.749-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3000	\N	cb473f3d-5c5c-4c89-ae06-f807672e5585	277	848
10831	DEBIT	Global Development for Meetup Fee	-6000	CAD	2016-12-28 08:21:14.024-08	2016-12-28 08:21:10.449-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	2bfec26b-02e0-4f2e-9f56-8b357de9b070	291	848
10833	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 08:27:36.9-08	2016-12-28 08:27:33.309-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	1ebaab71-e307-4af7-a981-6ce6f47755a3	292	848
10838	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:30:02.12-08	2016-12-27 08:30:02.272-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	79deaafb-a63c-4cb1-9436-d6b91bea0b66	15	848
10843	DEBIT	Global Development for Meetup Fee	-5700	EUR	2016-12-27 10:10:14.864-08	2016-12-27 10:10:14.928-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	\N	e2d07d7e-86d9-4bb2-8678-67055607c027	283	848
10848	DEBIT	Global Development for Meetup Fee	-6000	AUD	2016-12-28 07:55:25.022-08	2016-12-28 07:55:21.475-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	e50e5643-9b16-465c-a3a5-f0b8878fb76b	297	848
10853	DEBIT	WWCode t-shirt sales	-1106	USD	2017-01-17 19:29:09.407-08	2017-01-17 19:29:09.561-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1106	\N	41a157fe-e058-4784-a2b6-2343e8d8e38a	14	848
10858	DEBIT	WWCode t-shirt sales	-1389	USD	2017-01-17 19:32:30.654-08	2017-01-17 19:32:30.825-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1389	\N	e9ac5f9d-7567-4fcc-a572-8df28f64606c	15	848
10863	DEBIT	Recurring subscription	-52	USD	2016-06-09 10:28:30.802-07	2016-06-09 10:28:30.841-07	724	8	385	\N	\N	320	5	10	33	USD	1	100	-100	\N	d05dfd39-ed89-4b99-a55e-d4ed7618c111	3	848
10867	DEBIT	\N	-798	USD	2017-05-08 22:59:15.573-07	2017-05-08 22:59:15.573-07	832	4711	2855	\N	\N	2750	50	100	52	USD	1	1000	-1000	\N	b8a1bff4-8365-4401-a820-76a19fba25b0	517	848
10872	DEBIT	Donation - fees	-8	USD	2017-02-06 14:10:44.604-08	2017-02-06 14:10:44.763-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-800	\N	40ee7453-5ff5-41c6-8251-f1e3fe7cdbe4	270	848
10876	DEBIT	Macy's donation - fees and global development	-435000	USD	2017-02-13 16:21:10.361-08	2017-02-13 16:21:10.558-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-435000	\N	8588fcd6-efd2-42f0-844a-a08406aa6e1f	12	848
10881	DEBIT	Event sponsorship - transaction fees and global development 	-856500	USD	2017-03-01 22:00:43.46-08	2017-03-01 22:00:44.182-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-856500	\N	74b7526f-0b03-45ef-b103-ea093ced1554	12	848
10886	DEBIT	Women Techmaker WWCode Partnership Grant	-70000	USD	2016-05-19 12:17:47.24-07	2016-05-19 12:17:48.401-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	\N	4733a8a7-ee90-40e0-9117-370cfe2b046f	3	848
10891	DEBIT	\N	-9000	USD	2017-04-17 12:41:07.659-07	2017-04-17 12:41:07.659-07	848	3	\N	\N	\N	2471	0	0	0	USD	1	9000	-9000	\N	3ea1b2d4-a1b6-4723-bbb1-e1c3f7759d71	277	848
10889	DEBIT	International Women's Day Celebrations - Global	-51750	USD	2017-03-28 11:27:16.525-07	2017-03-28 11:27:16.748-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-51750	\N	3be8844f-33e3-4a57-ba69-fe33dd7dbc8f	12	848
10894	DEBIT	\N	-85000	GBP	2017-04-17 14:05:15.067-07	2017-04-17 14:05:15.067-07	848	3	\N	\N	\N	2474	0	0	0	GBP	1	85000	-85000	\N	7b5b48f4-3eef-47c5-9257-d1eb2386b98c	278	848
10899	DEBIT	\N	-18800	MXN	2017-04-17 15:35:06.093-07	2017-04-17 15:35:06.093-07	848	3	\N	\N	\N	2488	0	0	0	MXN	1	18800	-18800	\N	0f2addd0-48c2-42e0-873b-8765f7db9234	511	848
10904	DEBIT	\N	-1198	USD	2017-04-18 17:19:14.321-07	2017-04-18 17:19:14.321-07	848	3	\N	\N	\N	2505	0	0	0	USD	1	1198	-1198	\N	5af45ce8-15cd-4b32-a4f5-79ddc303a56f	12	848
10909	DEBIT	\N	-1480	USD	2017-04-18 17:39:23.15-07	2017-04-18 17:39:23.15-07	848	3	\N	\N	\N	2508	0	0	0	USD	1	1480	-1480	\N	ba2085f8-9566-45a7-a5e3-46f2a5d4d80a	14	848
10914	DEBIT	\N	-7500	USD	2017-03-31 15:52:45.079-07	2017-03-31 15:52:45.079-07	848	3	\N	\N	\N	2215	0	0	0	USD	1	7500	-7500	\N	6a321c0c-d782-4552-9fc1-34d7c172e811	286	848
10918	DEBIT	\N	-384	USD	2017-05-01 10:13:34.851-07	2017-05-01 10:13:34.851-07	758	4550	2757	\N	\N	2644	25	50	41	USD	1	500	-500	\N	b8385bd0-395d-4c63-8911-4b0de1a188d2	516	848
10923	DEBIT	\N	-1190	USD	2017-04-19 11:26:58.997-07	2017-04-19 11:26:58.997-07	848	3	\N	\N	\N	2521	0	0	0	USD	1	1190	-1190	\N	2295bbfd-ef4a-418b-89ab-4c6fd4248fa0	3	848
10928	DEBIT	AJUG - Global and fees	0	USD	2017-04-20 14:39:17.741-07	2017-04-20 14:39:18.323-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-26250	\N	64a7aad5-79be-4ee3-9047-eb73b6c9ff53	12	848
10933	DEBIT	Donation to WWCode Washington DC	-41020	USD	2016-04-28 08:01:17.801-07	2016-04-28 08:01:17.846-07	719	283	213	\N	\N	181	2500	5000	1480	USD	1	50000	-50000	\N	be2de792-815e-428f-ab38-ca9e536ce041	13	848
10937	DEBIT	Donation to WWCode Austin	-122250	USD	2016-08-05 13:48:08.414-07	2016-08-05 13:48:08.458-07	738	192	589	\N	\N	513	7500	15000	5250	USD	1	150000	-150000	\N	32703948-9de0-4077-864e-e4f597a0d8c5	2	848
10942	DEBIT	Recurring subscription	-798	USD	2016-11-01 16:32:30.439-07	2016-11-01 16:32:30.439-07	740	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	07b9c083-6029-406e-b3aa-67bf5fa9810c	2	848
10947	DEBIT	Donation to WWCode Atlanta	-53	USD	2016-06-21 09:02:56.072-07	2016-06-21 09:02:56.13-07	768	642	430	\N	\N	359	5	10	32	USD	1	100	-100	\N	dfe7487a-f6fd-4079-8ee5-c8c03acd30f6	12	848
10952	DEBIT	Recurring subscription	-798	USD	2016-11-09 20:43:57.271-08	2016-11-09 20:43:57.271-08	806	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	50322f58-573e-49cf-9fd8-c7095f0178a2	241	848
10956	DEBIT	\N	-16530	USD	2016-11-30 08:11:42.049-08	2016-11-30 08:11:42.049-08	833	1957	1296	\N	\N	1215	1000	2000	470	USD	1	20000	-20000	\N	ca440bf1-86d2-4bbb-b4d4-082f0a5d8743	2	848
10962	DEBIT	WWCode t-shirt sales	-1229	USD	2017-01-17 19:23:59.112-08	2017-01-17 19:23:59.247-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1229	\N	40eb5b47-8951-4dbb-b6ca-053411d376d7	48	848
10967	CREDIT	Food at our Sept. monthly event	11478	USD	2016-10-04 15:07:11.046-07	2016-10-04 15:07:11.615-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	11478	\N	9b158709-1d5f-47a4-baac-762b6327669b	15	848
10970	CREDIT	Engineering (Web) - A Small Orange	12700	USD	2016-10-11 17:44:30.933-07	2016-10-11 17:44:31.081-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12700	\N	67984d24-2398-42e0-b74b-0c203fe9f57e	48	848
10975	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 13:20:31.263-08	2016-11-30 13:20:31.464-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500	\N	c060c6d6-4429-4254-8e04-1c1ee91aedb1	269	848
10980	CREDIT	Meetup Fees	6000	USD	2016-12-23 09:21:53.018-08	2016-12-23 09:21:53.018-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	621	5a2faf1a-659f-4fcc-b03a-2c7efb6615ac	259	848
10985	CREDIT	Conference Expense	8320	USD	2016-05-10 12:19:21.785-07	2016-06-14 11:14:22.042-07	848	3	\N	2016-06-14 11:14:22.515-07	\N	\N	\N	\N	\N	\N	\N	\N	8320	158	792a8d0b-52da-4b9b-85e2-796d5ccad774	48	848
10990	CREDIT	Drinks for July monthly event	3316	USD	2016-08-16 07:53:42.013-07	2016-08-16 07:53:42.04-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	3316	\N	d9b6b47b-31ec-4b4c-813b-0832986a2c0c	15	848
10995	CREDIT	Thank you gift to an amazing sponsor!	1700	USD	2016-11-22 04:31:00.49-08	2016-11-22 04:31:00.691-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1700	501	38cf4023-ba84-4b54-a9f3-438c5eec63f0	59	848
11000	DEBIT	Recurring subscription	-53	USD	2017-01-09 10:28:29.701-08	2017-01-09 10:28:29.701-08	724	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	5ea7ef7c-28f7-42d5-a0a7-527a21978e4b	3	848
11005	CREDIT	WwConnect2016	1025	USD	2016-03-19 17:00:00-07	2016-06-14 11:14:21.806-07	777	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	1025	64	c07325a8-67fc-4a5a-a52b-cff558d1f941	14	848
11011	DEBIT	\N	-2040	USD	2016-12-18 17:42:01.104-08	2016-12-18 17:42:01.104-08	844	2220	1472	2016-12-27 16:00:00-08	\N	1389	125	250	85	USD	1	2500	-2500	\N	8fed56d0-4610-4585-b8c8-e303ef91bd74	259	848
11017	CREDIT	More stickers to give away at events	18800	USD	2016-11-03 12:14:58.094-07	2016-11-03 12:14:58.245-07	848	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	18800	\N	306bde04-d43c-4981-a375-b8502b1c7647	13	848
11021	DEBIT	Donation to WWCode Washington DC	-52	USD	2016-02-02 15:09:05.702-08	2016-04-16 13:40:58.699-07	688	2	46	\N	\N	72	5	10	33	USD	1	100	-100	\N	7b61547b-b271-4a73-a724-ecaab6c9ffb0	13	848
11025	DEBIT	Donation to WWCode Mexico City	-380	USD	2016-01-18 15:54:06.439-08	2016-04-16 13:40:58.672-07	688	2	34	\N	\N	65	25	50	45	USD	1	500	-500	\N	b43a847a-cce2-40f3-aef4-f5bceffce329	10	848
11030	DEBIT	Donation to WWCode Atlanta	-891	USD	2016-01-29 14:23:53.315-08	2016-04-16 13:40:58.701-07	691	30	39	\N	\N	13	0	50	59	USD	1	1000	-1000	\N	be61ab16-401b-44a9-a992-ff14990d5c30	12	848
11035	DEBIT	Donation to WWCode Washington DC	-52	USD	2016-02-02 09:04:56.247-08	2016-04-16 13:40:58.698-07	691	30	43	\N	\N	69	5	10	33	USD	1	100	-100	\N	f1297e30-a969-43f1-b1ae-6537e99c31ea	13	848
11040	CREDIT	Deposit- We Rise Conference Hosting Location	500000	USD	2017-05-16 14:51:10.574-07	2017-05-16 14:51:10.574-07	690	3206	\N	\N	\N	\N	\N	\N	0	USD	1	-500000	500000	1123	169a4209-391b-4235-9273-654e449c4689	12	848
11045	DEBIT	\N	-2040	USD	2017-04-11 19:05:36.032-07	2017-04-11 19:05:36.032-07	693	4173	2546	\N	\N	2430	125	250	85	USD	1	2500	-2500	\N	c70e27a7-6d21-4930-8630-f420b4d97f8b	13	848
11050	CREDIT	Supplies for Agile workshop (2/26)	5996	USD	2017-03-14 11:16:43.183-07	2017-03-14 11:16:43.22-07	716	171	2149	\N	\N	\N	\N	\N	198	USD	1	-5798	5798	858	b3b3cd17-f639-4638-a6bd-f2fce45fb06e	59	848
11056	CREDIT	April 7 South Hack Night	5037	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.083-07	694	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	5037	180	cc73b3a8-e5a6-41ec-94a8-651c25d47ec0	2	848
11062	CREDIT	Food for October Hack Night.	7773	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	700	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7700	484	5a8d6590-597e-4d1f-b45a-4a83faff91db	273	848
11071	CREDIT	WwConnect Planning Meeting	2519	USD	2016-03-10 16:00:00-08	2016-06-14 11:14:21.794-07	777	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	2519	60	d00814bc-6339-4484-9f93-dbf0b6b63972	14	848
10895	DEBIT	\N	-4250	GBP	2017-04-17 14:06:54.803-07	2017-04-17 14:06:54.803-07	848	3	\N	\N	\N	2475	0	0	0	GBP	1	4250	-4250	\N	65d16139-0ace-42bf-8589-549526a99c9c	278	848
10900	DEBIT	\N	-2200	MXN	2017-04-17 15:35:55.014-07	2017-04-17 15:35:55.014-07	848	3	\N	\N	\N	2489	0	0	0	MXN	1	2200	-2200	\N	21f5b2ff-d71f-4621-8852-d21ed5e016fb	511	848
10905	DEBIT	\N	-1480	USD	2017-04-18 17:20:11.527-07	2017-04-18 17:20:11.527-07	848	3	\N	\N	\N	2506	0	0	0	USD	1	1480	-1480	\N	21dcc6b1-0bbb-486a-8586-51a36c50b18f	12	848
10910	DEBIT	\N	-80500	GBP	2017-03-31 10:54:33.461-07	2017-03-31 10:54:33.461-07	848	3	\N	\N	\N	2208	0	0	0	GBP	1	80500	-80500	\N	f83b2fea-adf5-4cd8-b24f-71297841a139	278	848
10915	DEBIT	\N	-26301	CAD	2017-02-27 16:25:20.325-08	2017-02-27 16:25:20.325-08	706	3301	2030	\N	\N	1935	1121	1120	523	USD	1.33832976445396001	22416	-30000	\N	229b6b70-fbdd-4b07-9874-af504d718339	522	848
10920	DEBIT	monthly recurring subscription	-798	USD	2017-05-09 21:43:13.462-07	2017-05-09 21:43:13.462-07	806	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	23024468-91f9-4d33-b605-334e5f451cbf	241	848
10925	DEBIT	\N	-2930	USD	2017-05-01 17:33:45.73-07	2017-05-01 17:33:45.73-07	848	3	\N	\N	\N	2662	0	0	0	USD	1	2930	-2930	\N	e185eaec-042a-491d-8d69-2949a126c128	3	848
10930	DEBIT	From Deepa	0	USD	2016-04-12 14:19:00.212-07	2016-04-12 14:19:00.529-07	848	3	\N	2016-04-14 14:19:00.529-07	\N	\N	\N	\N	\N	\N	\N	\N	-1500	\N	cbe65146-89f4-4ec7-9be0-ff7e37e07e04	4	848
10935	DEBIT	Recurring subscription	-52	USD	2016-04-02 19:02:46.616-07	2016-04-16 13:40:58.82-07	724	8	45	\N	\N	71	5	10	33	USD	1	100	-100	\N	da661271-751d-45b6-913c-a153ef77dc1a	14	848
10940	DEBIT	Recurring subscription	-798	USD	2016-08-01 16:35:39.219-07	2016-08-01 16:35:39.244-07	740	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	8a026a59-309a-4408-8ed3-dbf080332d01	2	848
10946	DEBIT	Donation to WWCode Twin Cities	-53	USD	2016-06-21 09:06:05.517-07	2016-06-21 09:06:05.626-07	768	642	432	\N	\N	361	5	10	32	USD	1	100	-100	\N	9cd2770d-b411-45ec-8999-acee87e12894	48	848
10951	DEBIT	Recurring subscription	-798	USD	2016-10-09 21:49:33.558-07	2016-10-09 21:49:33.558-07	806	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	3f2803c5-476f-471e-b90a-bbc0ead9b053	241	848
10957	DEBIT	\N	-2040	USD	2016-10-07 09:49:19.978-07	2016-10-07 09:49:19.978-07	831	1446	884	\N	\N	812	125	250	85	USD	1	2500	-2500	\N	7d25f36e-b49a-447c-aaf5-699882058d9c	241	848
10961	DEBIT	\N	-2040	USD	2016-12-18 17:41:29.006-08	2016-12-18 17:41:29.006-08	844	2220	1471	\N	\N	1388	125	250	85	USD	1	2500	-2500	\N	9f1c90c0-86f2-4c5e-b243-10ec033b0ba4	259	848
10966	CREDIT	Network Stickers	58590	USD	2016-10-06 09:08:07.615-07	2016-10-06 09:08:07.66-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	58590	\N	8f1cea18-287f-485b-a23d-8937b6be38ad	3	848
10968	CREDIT	Conference Grant	100000	USD	2016-05-24 12:42:50.307-07	2016-06-14 11:14:22.103-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	189	2e94f95d-47bd-4131-a87b-f3e907e58fdc	3	848
10974	CREDIT	Banner	2000	USD	2016-11-30 13:19:46.014-08	2016-11-30 13:19:46.128-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	81cc4f8e-6852-4bfa-9a24-84ddd0e2539a	269	848
10979	CREDIT	Meetup Fees	5700	EUR	2016-12-23 09:15:16.054-08	2016-12-23 09:15:16.054-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	620	1c3b9c88-dbf8-49d2-bb03-a8478d364b72	301	848
10984	CREDIT	Meetup Fees	6000	USD	2017-04-05 07:19:21.293-07	2017-04-05 07:19:21.293-07	848	3	\N	\N	\N	\N	\N	\N	0	USD	1	-6000	6000	988	9520203b-152e-4c9f-8834-8bbb9889acb3	295	848
10989	CREDIT	Reimburse Caterina Paun for Program Expenses	9995	USD	2016-02-24 16:00:00-08	2016-06-14 11:14:22.175-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9995	224	f44a7bfc-727a-4eda-8ff8-5897a29ce615	59	848
10994	CREDIT	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	48435	USD	2016-10-31 14:08:49.332-07	2016-10-31 14:08:49.517-07	848	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	48435	417	f0109a76-004a-4e27-979b-ecae764e293d	300	848
10999	DEBIT	\N	-69722	USD	2017-02-10 08:47:34.349-08	2017-02-10 08:47:34.349-08	705	3053	1890	\N	\N	1801	4212	8424	1883	USD	1	84241	-84241	\N	d637d098-5bad-41a8-bbac-dba94bb7206f	15	848
11004	DEBIT	\N	-20670	USD	2017-03-01 14:51:20.759-08	2017-03-01 14:51:20.759-08	752	1263	2048	\N	\N	1953	1250	2500	580	USD	1	25000	-25000	\N	020a9c82-a175-45cb-8e08-95d203cee5ee	59	848
11010	DEBIT	\N	-41370	USD	2017-01-16 10:03:56.108-08	2017-01-16 10:03:56.108-08	843	2561	1622	\N	\N	1537	2500	5000	1130	USD	1	50000	-50000	\N	87117073-5bbb-412d-ba18-55a04d781516	48	848
11016	CREDIT	Cash for Prizes/Bartender	50000	USD	2016-11-03 12:12:34.941-07	2016-11-03 12:12:35.306-07	848	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	92eff214-5f81-4ab7-9fb2-9903b3dda1f4	2	848
11020	DEBIT	Recurring subscription	-52	USD	2016-03-02 16:24:57.083-08	2016-04-16 13:40:58.834-07	688	2	46	\N	\N	72	5	10	33	USD	1	100	-100	\N	acc6d144-541a-440c-9fa6-fd3e7bca7e39	13	848
11026	DEBIT	Recurring subscription	-52	USD	2016-05-02 17:15:49.65-07	2016-05-02 17:15:49.711-07	688	2	46	\N	\N	72	5	10	33	USD	1	100	-100	\N	ba951e6c-8127-43cb-91cd-db970cc25b36	13	848
11032	DEBIT	Recurring subscription	-52	USD	2016-04-02 11:13:51.122-07	2016-04-16 13:40:58.81-07	691	30	43	\N	\N	69	5	10	33	USD	1	100	-100	\N	a6a28186-987b-440f-a543-c38f2e7094ed	13	848
11037	DEBIT	Donation to WWCode Seattle	-52	USD	2016-02-02 08:36:38.327-08	2016-04-16 13:40:58.702-07	691	30	41	\N	\N	67	5	10	33	USD	1	100	-100	\N	c469a433-b260-4e82-b958-0b9b300e20ad	14	848
11042	DEBIT	monthly recurring subscription	-2040	USD	2017-05-01 11:32:00.085-07	2017-05-01 11:32:00.085-07	692	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	-2500	\N	cb1948a0-146f-4f5e-92c3-5e37467d2ebd	271	848
11047	CREDIT	May 5 South Hack Night	5325	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.083-07	694	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	5325	181	359e019f-8923-45f3-88c6-7355b4eaa618	2	848
11052	CREDIT	Feb 1, Lightning Talks	22568	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.794-07	694	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	22568	56	77a20f62-6cd1-4597-9f69-3998df4c8c4a	2	848
11058	CREDIT	February Lightning Talks food	11020	USD	2017-03-14 10:17:53.891-07	2017-03-14 10:17:53.957-07	694	28	1893	\N	\N	\N	\N	\N	340	USD	1	-10680	10680	820	85b18727-3b91-430c-87c0-e3d7a9e520e4	2	848
11063	CREDIT	Food/Drinks for Anniversary Reception with guest WWCode Directors!	4444	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	700	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4400	486	96b61fda-ea42-4924-881b-5a5a0b4e8f4c	273	848
11066	CREDIT	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	4000	GBP	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	713	1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000	507	a41128d4-5a7b-4f45-8176-a943598eb8c8	278	848
11070	CREDIT	Wearable Clothing Workshop	34411	USD	2017-03-14 11:00:11.436-07	2017-03-14 11:00:11.448-07	847	142	2149	\N	\N	\N	\N	\N	999	USD	1	-33412	33412	815	e97bc5ba-fa11-4c65-8a68-a5d1f5132120	48	848
10896	DEBIT	\N	-100000	USD	2017-04-17 15:09:42.57-07	2017-04-17 15:09:42.57-07	848	3	\N	\N	\N	2477	0	0	0	USD	1	100000	-100000	\N	b8095abc-053c-42ca-a932-1cccb431b93d	270	848
10901	DEBIT	\N	-100000	USD	2017-04-17 15:40:40.357-07	2017-04-17 15:40:40.357-07	848	3	\N	\N	\N	2490	0	0	0	USD	1	100000	-100000	\N	033296b2-bf1b-4e01-b378-16acd479ee98	430	848
10906	DEBIT	\N	-1400	USD	2017-04-18 17:31:31.942-07	2017-04-18 17:31:31.942-07	848	3	\N	\N	\N	2507	0	0	0	USD	1	1400	-1400	\N	1d69add0-555d-46c3-bd66-16087e04fc12	195	848
10911	DEBIT	\N	-39800	GBP	2017-03-31 11:01:48.418-07	2017-03-31 11:01:48.418-07	848	3	\N	\N	\N	2209	0	0	0	GBP	1	39800	-39800	\N	e382b515-f790-448e-a7d2-583009cab430	278	848
10916	DEBIT	\N	-18600	USD	2017-02-01 07:16:20.999-08	2017-02-01 07:16:20.999-08	742	2898	1801	\N	\N	1709	1125	2250	525	USD	1	22500	-22500	\N	9d0b2f50-cbd0-4b4c-a6d0-a819229f52c4	48	848
10921	DEBIT	\N	-1480	USD	2017-04-19 11:18:19.043-07	2017-04-19 11:18:19.043-07	848	3	\N	\N	\N	2519	0	0	0	USD	1	1480	-1480	\N	803cc813-f671-421d-9f97-4c4a316ce035	2	848
10926	DEBIT	Network development (stickers)	-58590	USD	2016-10-06 09:08:20.916-07	2016-10-06 09:08:21.09-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-58590	\N	64438648-22d3-477c-8bfa-490a5132bcb6	3	848
10931	DEBIT	\N	-8150	USD	2017-04-20 03:17:23.286-07	2017-04-20 03:17:23.286-07	703	4348	2643	\N	\N	2532	500	1000	350	USD	1	10000	-10000	\N	3f1fd70f-a75d-499f-9279-a296182faa42	59	848
10936	DEBIT	\N	-3282	USD	2016-11-28 07:33:14.428-08	2016-11-28 07:33:14.428-08	733	1890	1249	\N	\N	1167	200	400	118	USD	1	4000	-4000	\N	e0c51580-fcd3-4572-974e-2d8344864a4d	2	848
10941	DEBIT	Recurring subscription	-798	USD	2016-09-01 16:32:42.475-07	2016-09-01 16:32:42.475-07	740	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	094e823d-9f6f-447d-92f1-0397b41ecf4b	2	848
10945	DEBIT	\N	-15485	USD	2016-09-28 14:47:18.302-07	2016-09-28 14:47:18.302-07	748	1299	842	\N	\N	768	950	1900	665	USD	1	19000	-19000	\N	0b937208-da37-4168-8870-3316883eaa2e	2	848
10950	DEBIT	Recurring subscription	-798	USD	2016-09-09 20:42:56.392-07	2016-09-09 20:42:56.392-07	806	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	e43bb60d-5e73-48bf-9ad4-32025fe321d8	241	848
10955	DEBIT	Donation to WWCode Austin	-41020	USD	2016-05-19 12:24:43.134-07	2016-05-19 12:24:43.182-07	825	392	288	\N	\N	246	2500	5000	1480	USD	1	50000	-50000	\N	56d86f11-fdfb-415b-a0ce-0c7302b60abf	2	848
10960	DEBIT	\N	-24450	USD	2016-11-22 07:22:39.097-08	2016-11-22 07:22:39.097-08	842	1846	1211	\N	\N	1129	1500	3000	1050	USD	1	30000	-30000	\N	8c49231c-17e5-45b9-a1fd-78f09e0cc416	59	848
10965	CREDIT	90/10 split: Syema Ailia	250	USD	2016-10-04 09:06:23.454-07	2016-10-04 09:06:23.454-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	250	390	a1748906-9589-46a8-aeef-ac6820ed8075	12	848
10969	CREDIT	A Small Orange	12700	USD	2016-02-01 16:00:00-08	2016-06-14 11:14:22.114-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12700	194	9711c19c-93f5-4d71-a263-804a3f15474e	48	848
10973	CREDIT	Leadership Development - Conference Travel Stipend Google I/O	130000	USD	2016-11-30 13:06:48.939-08	2016-11-30 13:06:49.116-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	130000	\N	171bcffa-02f0-439c-ab83-9459f0fdc52a	241	848
10978	CREDIT	Meetup Fees	6000	USD	2016-12-23 09:10:34.733-08	2016-12-23 09:10:34.733-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	619	4f211db4-fd35-48d8-a0c9-a9b2952dad30	265	848
10983	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:41:27.235-08	2016-12-27 08:41:27.235-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	638	c764a86a-2253-46bd-a43c-fc61d345e837	272	848
10988	CREDIT	CONFERENCE GRANT	50000	USD	2016-05-10 17:00:00-07	2016-06-14 11:14:22.114-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	196	2c5a15ca-d90e-4faa-9a8d-cf016cacbac0	59	848
10993	CREDIT	Conference Grant - Sarah Olson	110000	USD	2016-05-10 12:19:21.785-07	2016-06-14 11:14:22.032-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	110000	156	6482d283-495d-405f-a9df-8e839bd4f364	48	848
10998	CREDIT	05-21-16 AI workshop	30000	USD	2016-05-22 17:26:36.061-07	2016-06-14 11:14:22.092-07	694	28	\N	2016-06-14 11:14:22.535-07	\N	\N	\N	\N	\N	\N	\N	\N	30000	186	8634ee37-0c6b-4c2b-a99a-4657b65fa1cb	2	848
11003	DEBIT	monthly recurring subscription	-798	USD	2017-02-01 15:34:44.326-08	2017-02-01 15:34:44.326-08	740	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	840c70fc-1c48-41c2-b2ae-b0a7c9aab15b	2	848
11008	DEBIT	monthly recurring subscription	-798	USD	2017-02-09 20:43:49.515-08	2017-02-09 20:43:49.515-08	806	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	94701f0f-f1cb-4160-9cfa-bc58b7c5ea50	241	848
11014	CREDIT	Leadership Development	50616	MXN	2017-03-14 11:17:51.969-07	2017-03-14 11:17:51.969-07	848	3	\N	\N	\N	\N	\N	\N	0	MXN	1	-50616	50616	887	212e091d-e2f9-4794-a437-24d569bf4f3e	282	848
11022	DEBIT	Recurring subscription	-380	USD	2016-02-18 17:11:10.784-08	2016-04-16 13:40:58.716-07	688	2	34	\N	\N	65	25	50	45	USD	1	500	-500	\N	e6c20d7c-f3c0-4901-bef2-824da0574aa6	10	848
11028	DEBIT	Recurring subscription	-52	USD	2016-03-02 10:26:05.731-08	2016-04-16 13:40:58.833-07	691	30	44	\N	\N	70	5	10	33	USD	1	100	-100	\N	91b8304c-7670-4796-ba01-e79eb65256d8	13	848
11034	DEBIT	Recurring subscription	-52	USD	2016-04-02 12:27:54.641-07	2016-04-16 13:40:58.809-07	691	30	44	\N	\N	70	5	10	33	USD	1	100	-100	\N	239e0341-c385-428d-b90a-d97527558d2e	13	848
11039	DEBIT	Recurring subscription	-52	USD	2016-05-02 11:15:35.25-07	2016-05-02 11:15:35.307-07	691	30	44	\N	\N	70	5	10	33	USD	1	100	-100	\N	dcc5d29a-28c8-4f04-a00d-28b814ef0316	13	848
11044	DEBIT	monthly recurring subscription	-2040	USD	2017-03-01 10:37:53.591-08	2017-03-01 10:37:53.591-08	692	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	-2500	\N	04698b1b-9174-4bc8-8f87-1ee1f17e65fd	271	848
11049	CREDIT	Feb 4 hack night	10284	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.784-07	694	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	10284	53	be90069e-575f-4e25-bd33-761fb65d0718	2	848
11054	CREDIT	May 2 Lightning Talks	8979	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.092-07	694	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	8979	184	5312b72b-2ab5-44fe-a66d-704884a9a565	2	848
11059	CREDIT	Mar 7 Lightning Talks	15790	USD	2017-03-14 10:21:29.296-07	2017-03-14 10:21:29.332-07	694	28	1893	\N	\N	\N	\N	\N	474	USD	1	-15316	15316	57	0f9c3916-e422-4677-8279-598344d418a4	2	848
11067	CREDIT	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	10294	USD	2016-08-02 06:38:05.215-07	2016-08-02 06:38:05.831-07	777	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	10294	255	76a443ca-ca9e-4b98-a466-155f4577c1f8	14	848
7688	CREDIT	\N	50000	CAD	2017-03-31 16:37:30.819-07	2017-03-31 16:37:30.819-07	291	3	\N	\N	\N	2217	0	0	0	CAD	1	50000	50000	\N	5c191b8e-cc26-4f14-9ad4-bc6c7f3e1f05	848	848
1174	CREDIT	Recurring subscription	100	USD	2016-07-09 11:31:14.547-07	2016-07-09 11:31:14.585-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	321662c1-bd0e-45c1-a83b-15734580a904	724	848
1498	CREDIT	Recurring subscription	100	USD	2016-08-09 11:30:50.866-07	2016-08-09 11:30:50.915-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	8a688e20-988b-4f55-b69d-bb6632da3ece	724	848
1876	CREDIT	Recurring subscription	100	USD	2016-09-09 11:29:12.276-07	2016-09-09 11:29:12.276-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	0883360f-716b-4be8-a920-9ab0f71e399b	724	848
2360	CREDIT	Recurring subscription	100	USD	2016-10-09 11:36:17.958-07	2016-10-09 11:36:17.958-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	53835d40-3ec2-48e7-8d85-8f9381ef368c	724	848
3876	CREDIT	Recurring subscription	100	USD	2016-12-09 10:29:17.341-08	2016-12-09 10:29:17.341-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	77717eed-fb45-4bf8-a43d-45391bee0f68	724	848
3669	CREDIT	Recurring subscription	1000	USD	2016-12-01 15:32:26.764-08	2016-12-01 15:32:26.764-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	d7a57bda-4dda-46e1-badb-2dc573225d85	740	848
5969	CREDIT	monthly recurring subscription	1000	USD	2017-02-14 10:13:04.109-08	2017-02-14 10:13:04.109-08	270	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	798	\N	41a806dd-fae3-47ec-8291-293cc822ae9b	781	848
612	CREDIT	Women Techmaker WWCode Partnership Grant	120000	USD	2016-05-19 12:10:52.797-07	2016-05-19 12:10:54.053-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	120000	\N	9615350f-4370-4c3b-bfab-2f2c48fe511c	848	848
866	CREDIT	Nike Donation	50000	USD	2016-06-09 21:08:56.525-07	2016-06-09 21:08:56.991-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	6187d107-e599-47d8-8ca5-8ad365ac9df8	848	848
466	CREDIT	Recurring subscription	100	USD	2016-05-01 22:44:10.046-07	2016-05-01 22:44:10.072-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	21f38ce7-f977-4526-92c4-f488bc43b39d	839	848
726	CREDIT	Recurring subscription	100	USD	2016-06-01 22:48:36.714-07	2016-06-01 22:48:36.745-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	23ced910-fe09-4e51-b681-2c4a67ec8eac	839	848
9658	CREDIT	\N	300000	USD	2017-05-02 11:43:43.157-07	2017-05-02 11:43:43.157-07	12	3	\N	\N	\N	2676	0	0	0	USD	1	300000	300000	\N	5e069863-b163-4534-a856-d24c10ad1c67	848	848
2230	CREDIT	Conference Grant: Google/IO Alicia Carr	10000	USD	2016-10-04 08:25:59.981-07	2016-10-04 08:26:00.186-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	382ee140-1ddc-4000-b079-00cd1f595da2	848	848
2307	CREDIT	Donation Pamela V.	4500	USD	2016-10-06 11:09:54.319-07	2016-10-06 11:09:54.357-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500	\N	20459f3e-47a2-42c8-8f77-9bdc17072479	848	848
2243	CREDIT	Donation via Meetup	2036	USD	2016-10-04 09:42:35.996-07	2016-10-04 09:42:36.119-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2036	\N	ed01102f-16a4-4587-97a7-eb6ba81c5728	848	848
2244	CREDIT	Donation via Meetup	1203	USD	2016-10-04 09:46:07.882-07	2016-10-04 09:46:07.993-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1203	\N	bbbc1082-58db-4cc2-b14d-7cadc2caabe8	848	848
10897	DEBIT	\N	-41000	GBP	2017-04-17 15:31:52.729-07	2017-04-17 15:31:52.729-07	848	3	\N	\N	\N	2486	0	0	0	GBP	1	41000	-41000	\N	c0d03bd2-db39-47bf-a522-77e9350f2684	278	848
10903	DEBIT	\N	-3562	GBP	2017-04-18 12:41:30.286-07	2017-04-18 12:41:30.286-07	848	3	\N	\N	\N	2503	0	0	0	GBP	1	3562	-3562	\N	fc377d27-2e71-4bbf-8226-f45ad28d974c	278	848
10908	DEBIT	\N	-79600	GBP	2017-03-31 10:20:23.917-07	2017-03-31 10:20:23.917-07	848	3	\N	\N	\N	2206	0	0	0	GBP	1	79600	-79600	\N	f7d475aa-729b-4c8e-813c-e4b20a824fff	267	848
10913	DEBIT	\N	-20000	USD	2017-03-31 15:50:23.915-07	2017-03-31 15:50:23.915-07	848	3	\N	\N	\N	2214	0	0	0	USD	1	20000	-20000	\N	936b2939-43e1-43d9-a7fb-97c7321d33f4	286	848
10919	DEBIT	\N	-786	CAD	2017-05-10 16:45:46.737-07	2017-05-10 16:45:46.737-07	796	4749	2888	\N	\N	2783	36	71	46	USD	1.39860139860140009	715	-1000	\N	803d5c98-de68-4dfc-8b4c-644265467604	522	848
10924	DEBIT	\N	-610	USD	2017-04-19 11:35:03.04-07	2017-04-19 11:35:03.04-07	848	3	\N	\N	\N	2522	0	0	0	USD	1	610	-610	\N	5fbcbeef-59a6-4f7b-a9ed-a08efaed9d16	59	848
10929	DEBIT	Intel Donation	-100000	USD	2016-04-12 13:32:35.997-07	2016-04-16 13:40:58.826-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	\N	8186703d-b804-4f0a-8724-5f03637f376d	59	848
10934	DEBIT	Donation to WWCode Austin	-16390	USD	2016-04-13 09:46:10.463-07	2016-04-16 13:40:58.845-07	723	224	173	\N	\N	153	1000	2000	610	USD	1	20000	-20000	\N	aeb60ad8-4ab7-4c91-ba08-e37e63517092	2	848
10939	DEBIT	Recurring subscription	-798	USD	2016-07-01 15:38:37.594-07	2016-07-01 15:38:37.617-07	740	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	ec5fcb89-6570-41bb-95f3-c11ba8a3b46f	2	848
10944	DEBIT	\N	-20670	USD	2016-09-22 18:07:09.492-07	2016-09-22 18:07:09.492-07	752	1263	790	\N	\N	700	1250	2500	580	USD	1	25000	-25000	\N	f7b1ea7a-bfd7-41cc-b48e-58578daf2fb1	59	848
10949	DEBIT	Donation to WWCode Austin	-41020	USD	2016-05-23 13:27:28.524-07	2016-05-23 13:27:28.599-07	802	426	306	\N	\N	258	2500	5000	1480	USD	1	50000	-50000	\N	d5a84a88-51ad-475f-82ca-f1a04d8a6787	2	848
10954	DEBIT	\N	-165570	USD	2016-09-01 07:41:36.24-07	2016-09-01 07:41:36.24-07	805	1094	707	\N	\N	622	10000	20000	4430	USD	1	200000	-200000	\N	50cb7226-b3b4-4c17-b473-126736ed984b	2	848
10959	DEBIT	\N	-20375	EUR	2016-11-29 02:03:23.71-08	2016-11-29 02:03:23.71-08	836	1908	1257	\N	\N	1175	1301	2601	910	USD	0.961057932572174978	26013	-25000	\N	57e019f0-5520-45ae-977c-07a48bb244d9	301	848
10964	CREDIT	90/10 split: Beth Laing	500	USD	2016-10-04 09:06:16.796-07	2016-10-04 09:06:16.796-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500	392	8674dd08-6a1f-4422-8c54-c590cbd5e351	12	848
10972	CREDIT	Envelopes for hackathon sponsor prizes	907	USD	2016-11-30 08:12:35.291-08	2016-11-30 08:12:35.54-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	907	\N	57bb35d7-a318-4e15-89b8-be433a1e1fb7	2	848
10976	CREDIT	Meetup Fees	6000	USD	2016-12-23 09:00:25.987-08	2016-12-23 09:00:25.987-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	617	5e358293-f329-44d6-a344-d91d855dbbfa	263	848
10981	CREDIT	Meetup Fees	6000	AUD	2016-12-23 09:42:18.688-08	2016-12-23 09:42:18.688-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	623	47fffe7f-5f4d-4754-a9bc-a0ca7bea271f	266	848
10986	CREDIT	WePay fee	125	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	125	95	cd844166-61ff-409b-a7fa-b637d292e744	13	848
10991	CREDIT	Event supplies	1797	USD	2016-08-19 10:24:23.638-07	2016-08-19 10:24:24.362-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1797	\N	13999fe0-70bf-4daf-9c9a-4f483e0be990	59	848
10996	CREDIT	Post-hackathon shipping supplies + supplies for Women + Tech Holiday Party	3776	USD	2016-12-13 10:41:20.962-08	2016-12-13 10:41:21.652-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	3776	\N	6500a50e-b7a8-4372-acb1-00cc72003c30	59	848
11001	DEBIT	monthly recurring subscription	-53	USD	2017-02-09 10:29:30.017-08	2017-02-09 10:29:30.017-08	724	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	5a16f9a7-b63b-4d50-93f6-1bf2765aecf6	3	848
11006	CREDIT	Transportation for Sandra and Cici to get to meeting location with core team members	749	USD	2016-08-02 06:39:15.789-07	2016-08-02 06:39:15.797-07	777	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	749	256	f5daaedf-8750-46e8-b3ab-a5da82724a50	14	848
11007	DEBIT	Recurring subscription	-798	USD	2017-01-14 09:12:01.244-08	2017-01-14 09:12:01.244-08	781	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	-1000	\N	1c1d3bc0-f640-49dd-811d-17edbace5f65	270	848
11012	DEBIT	\N	-8250	USD	2017-01-18 05:54:50.597-08	2017-01-18 05:54:50.597-08	846	2594	1647	\N	\N	1557	500	1000	250	USD	1	10000	-10000	\N	78940d99-c3cb-486e-958a-5e62ff0a7430	48	848
11013	CREDIT	Transportation to get to GeekWire Summit social event 	729	USD	2016-11-01 09:16:02.625-07	2016-11-01 09:16:02.953-07	848	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	729	402	15a8793b-8ece-464e-ad85-eba11d958f43	14	848
11018	CREDIT	Stacey Schipper	2322	USD	2016-11-03 12:45:04.691-07	2016-11-03 12:45:04.691-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2322	\N	b228796e-2416-46b4-b169-76df4eb88480	15	848
11023	DEBIT	Recurring subscription	-52	USD	2016-04-02 18:49:19.352-07	2016-04-16 13:40:58.819-07	688	2	46	\N	\N	72	5	10	33	USD	1	100	-100	\N	f37bbb28-9d0e-4863-b4f2-e96ccb80c648	13	848
11027	DEBIT	Recurring subscription	-52	USD	2016-05-02 10:46:41.832-07	2016-05-02 10:46:41.894-07	691	30	41	\N	\N	67	5	10	33	USD	1	100	-100	\N	500e47d0-ca49-4ef0-838b-f10e09e14c00	14	848
11031	DEBIT	Recurring subscription	-52	USD	2016-03-02 10:19:33.362-08	2016-04-16 13:40:58.737-07	691	30	43	\N	\N	69	5	10	33	USD	1	100	-100	\N	ecf48936-27be-4dff-a701-904524214ece	13	848
11036	DEBIT	Recurring subscription	-52	USD	2016-03-02 09:53:54.346-08	2016-04-16 13:40:58.736-07	691	30	41	\N	\N	67	5	10	33	USD	1	100	-100	\N	4954dd99-accb-400d-b9f8-098f8c7ba49b	14	848
11041	DEBIT	monthly recurring subscription	-2040	USD	2017-04-01 11:31:19.231-07	2017-04-01 11:31:19.231-07	692	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	-2500	\N	ab2d4976-ef9f-4b72-b11d-c56d0055d8dc	271	848
11046	CREDIT	Mar 3 hack night	4951	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.784-07	694	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	4951	55	397d9ee6-7e76-4ca8-9fce-d0aead559584	2	848
11051	DEBIT	monthly recurring subscription	-53	USD	2017-04-09 11:28:49.104-07	2017-04-09 11:28:49.104-07	724	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	ad68c230-b1a9-4ae1-af4a-c1fe1a96d5fa	3	848
11055	CREDIT	April 4 Lightning Talks	13315	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.091-07	694	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	13315	183	09aa8122-a84e-4766-9ec4-ddda3f4437c2	2	848
11060	CREDIT	3/30/16 Python Gameathon prize - Udemy course	2400	USD	2016-06-04 14:37:03.991-07	2016-06-14 11:14:22.155-07	694	28	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	2400	213	c327231f-d20f-4e24-b07a-377bbbf37e0b	2	848
11064	CREDIT	Food for Anniversary Reception	713	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	700	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	700	492	63fedbbc-1df7-42b7-b68a-f832e4f68539	273	848
11068	CREDIT	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	5161	USD	2016-06-06 17:21:31.531-07	2016-06-14 11:14:22.165-07	777	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	5161	218	f4d69fd7-6c8d-4fac-a152-a12bad516604	14	848
3291	DEBIT	TShirts	-145786	USD	2016-11-21 13:26:37.469-08	2016-11-21 13:26:37.469-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-145786	\N	c9204456-a67b-4951-a271-157ab6819d8b	848	848
3292	DEBIT	Leadership Development Lodging	-64600	USD	2016-11-21 13:26:46.916-08	2016-11-21 13:26:46.916-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-64600	\N	96bf91be-3e65-4ccc-932d-61631b570de0	848	848
3331	DEBIT	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	-8181	USD	2016-11-22 13:54:33.366-08	2016-11-22 13:54:33.644-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-8181	499	bf974271-bd1f-43fd-b113-f1c26a528e73	848	848
4406	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:46:50.958-08	2016-12-27 11:46:50.958-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	655	b66b4d98-0d80-41e7-8f34-1092f16b136c	848	848
4408	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:50:16.992-08	2016-12-27 11:50:16.992-08	288	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	656	70608aa8-79be-468e-a263-d28237b8531a	848	848
2840	DEBIT	Cash for Prizes/Bartender (the extra money, $50, was not used for the hackathon)	-70000	USD	2016-11-01 08:16:29.544-07	2016-11-01 08:16:30.012-07	2	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	\N	be4916cc-ebfc-4a00-8c1f-6fdec9dad74c	848	848
2396	DEBIT	Conference stipend Elizabeth M.	-75000	USD	2016-10-11 09:01:27.317-07	2016-10-11 09:01:28.351-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	6b335f4d-a920-4cfc-90a9-6dfe40dfef58	848	848
1170	DEBIT	Global Development	-150	USD	2016-07-08 20:52:40.722-07	2016-07-08 20:52:40.722-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	93	88b9402f-6888-45e1-b572-0f7b29199c39	848	848
670	DEBIT	FedEx Office	-3418	USD	2016-01-24 16:00:00-08	2016-06-14 11:14:22.114-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3418	195	2b7ba22c-916e-45dc-842c-8f7137976c4f	848	848
867	DEBIT	Global Development	-5000	USD	2016-02-21 16:00:00-08	2016-06-14 11:14:22.186-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5000	227	6b865d7e-c324-4c7a-85cd-1ba0aefb8303	848	848
1629	DEBIT	Thank you materials for several events.	-6198	USD	2016-08-19 10:31:26.428-07	2016-08-19 10:31:26.891-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6198	\N	0b7f4317-3b95-47d5-89f9-245314e16769	848	848
1581	DEBIT	Minimum fee - June	-1000	USD	2016-08-16 07:53:58.922-07	2016-08-16 07:53:58.936-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	92e56306-3684-425f-b356-b67d306a0ae2	848	848
1586	DEBIT	Minimum Fee - June	-1000	USD	2016-08-16 07:55:45.164-07	2016-08-16 07:55:45.179-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	2ed495af-5080-42ac-b381-905d29be571e	848	848
1584	DEBIT	Minimum Fee - June	-995	USD	2016-08-16 07:55:14.822-07	2016-08-16 07:55:14.844-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-995	\N	e344373f-1e6d-416d-be2b-9ac1ce4866f4	848	848
10907	DEBIT	\N	-50000	USD	2017-03-31 10:17:51.695-07	2017-03-31 10:17:51.695-07	848	3	\N	\N	\N	2204	0	0	0	USD	1	50000	-50000	\N	28510e17-1be9-4ebc-9d76-e50a19500fe1	2	848
10912	DEBIT	\N	-100000	USD	2017-03-31 15:32:34.123-07	2017-03-31 15:32:34.123-07	848	3	\N	\N	\N	2212	0	0	0	USD	1	100000	-100000	\N	18b15a91-8b55-4e7e-a9e4-abd6ea1d6c6a	286	848
10917	DEBIT	\N	-16530	USD	2017-05-15 05:07:59.63-07	2017-05-15 05:07:59.63-07	744	4834	2922	\N	\N	2817	1000	2000	470	USD	1	20000	-20000	\N	a1b6da52-592e-4308-a977-585f19da49e4	14	848
10922	DEBIT	\N	-40000	USD	2017-04-19 11:26:01.228-07	2017-04-19 11:26:01.228-07	848	3	\N	\N	\N	2520	0	0	0	USD	1	40000	-40000	\N	ceb1f533-33a1-418d-8940-ac12d323b3c5	3	848
10927	CREDIT	Director t-shirt	3325	USD	2016-10-17 14:01:02.872-07	2016-10-17 14:01:02.925-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3325	\N	a319053f-94cd-4a9c-9cb9-fbb16e658263	298	848
10932	DEBIT	Donation to WWCode Austin	-124170	USD	2016-08-01 08:54:14.382-07	2016-08-01 08:54:14.468-07	704	883	561	\N	\N	488	7500	15000	3330	USD	1	150000	-150000	\N	6067a371-0a6b-4dae-af06-dd4ecced8d7e	2	848
10938	DEBIT	monthly recurring subscription	-798	USD	2017-05-01 16:34:11.708-07	2017-05-01 16:34:11.708-07	740	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	c7a85c5f-7c26-48ac-8a6e-74e770fe53d7	2	848
10943	DEBIT	Donation to WWCode Austin	-123120	USD	2016-05-03 06:07:28.39-07	2016-05-03 06:07:28.452-07	745	308	230	\N	\N	191	7500	15000	4380	USD	1	150000	-150000	\N	82c87e04-376c-4563-aefa-16dac909950c	2	848
10948	DEBIT	Donation to WWCode Austin	-16530	USD	2016-08-01 08:55:27.083-07	2016-08-01 08:55:27.184-07	793	884	562	\N	\N	489	1000	2000	470	USD	1	20000	-20000	\N	a490eaaf-04e4-45e9-acf9-73cd0e7ef237	2	848
10953	DEBIT	Recurring subscription	-798	USD	2016-12-09 20:43:00.244-08	2016-12-09 20:43:00.244-08	806	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	29bac696-839e-425e-a571-f1c21ec0a242	241	848
10958	DEBIT	\N	-41370	USD	2016-11-17 09:43:29.797-08	2016-11-17 09:43:29.797-08	835	1808	1179	\N	\N	1098	2500	5000	1130	USD	1	50000	-50000	\N	c26ac99d-efe0-4cfc-888e-ffb4fc777088	59	848
10963	DEBIT	WWCode t-shirt sales	-982	USD	2017-01-17 19:24:31.362-08	2017-01-17 19:24:31.504-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-982	\N	a53209fb-1f74-4053-9924-628c60c45fd1	13	848
10971	CREDIT	Photos for sponsor gifts	2104	USD	2016-11-30 08:11:36.238-08	2016-11-30 08:11:36.377-08	848	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2104	\N	07058241-d6d0-47fd-90fc-e3e613f582ba	2	848
10977	CREDIT	Meetup Fees	4900	GBP	2016-12-23 09:05:41.927-08	2016-12-23 09:05:41.927-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	618	93db222f-0cd9-4284-99f4-c2853ba51605	264	848
10982	CREDIT	Meetup Fees	5700	EUR	2016-12-27 08:36:05.296-08	2016-12-27 08:36:05.296-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	637	a56e3752-9261-4238-8ca4-c25ece610489	298	848
10987	CREDIT	Global Development 	150	USD	2016-06-09 11:38:16.857-07	2016-06-14 11:14:22.175-07	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	150	222	bd75621a-086f-44ba-9b3d-1b951ed4cd90	4	848
10992	CREDIT	Dinner for last night's HackNight	13526	USD	2016-08-19 13:58:34.342-07	2016-08-19 13:58:34.554-07	848	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	13526	319	f05e8728-346e-4b6a-8ff2-3047f5f6bf80	48	848
10997	CREDIT	Meetup Fees	6000	USD	2016-12-23 09:32:55.31-08	2016-12-23 09:32:55.31-08	848	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	622	6a5c90ee-e3af-4af2-85bd-2da56f8f52e0	195	848
11002	DEBIT	monthly recurring subscription	-798	USD	2017-03-01 15:40:00.024-08	2017-03-01 15:40:00.024-08	740	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	931b765d-e9ca-444c-b618-11363d27d94b	2	848
11009	DEBIT	\N	-16530	USD	2017-01-03 12:59:37.749-08	2017-01-03 12:59:37.749-08	834	2416	1553	\N	\N	1466	1000	2000	470	USD	1	20000	-20000	\N	65a5f955-1775-4eea-ab67-4aaf7adcdf54	2	848
11015	CREDIT	Leadership Development	14915	MXN	2017-03-14 11:18:46.358-07	2017-03-14 11:18:46.358-07	848	3	\N	\N	\N	\N	\N	\N	0	MXN	1	-14915	14915	886	a46660a4-1d6b-4226-8979-01315314674a	511	848
11019	CREDIT	Event Food	6471	USD	2016-11-03 12:43:50.827-07	2016-11-03 12:43:51.096-07	848	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	6471	377	07cd1cf2-a6ac-4b41-8f16-05556c4a68af	59	848
11024	DEBIT	Donation to WWCode Austin	-26100	USD	2016-03-02 13:31:50.516-08	2016-04-16 13:40:58.67-07	689	129	94	\N	\N	25	0	3000	900	USD	1	30000	-30000	\N	a9c263a4-d9e3-4ae5-8bae-8aacacf06fcf	2	848
11029	DEBIT	Donation to WWCode Washington DC	-52	USD	2016-02-02 09:09:22.069-08	2016-04-16 13:40:58.697-07	691	30	44	\N	\N	70	5	10	33	USD	1	100	-100	\N	7d8af873-0d53-4315-8f55-0fb463275f54	13	848
11033	DEBIT	Recurring subscription	-52	USD	2016-04-02 12:09:44.502-07	2016-04-16 13:40:58.811-07	691	30	41	\N	\N	67	5	10	33	USD	1	100	-100	\N	38dfee22-14be-436a-b29d-9bc78628d9cd	14	848
11038	DEBIT	Recurring subscription	-52	USD	2016-05-02 11:10:42.774-07	2016-05-02 11:10:42.847-07	691	30	43	\N	\N	69	5	10	33	USD	1	100	-100	\N	9d9a2af6-d949-49ec-b386-6b3174941d75	13	848
11043	DEBIT	\N	-2040	USD	2017-02-01 09:30:48.467-08	2017-02-01 09:30:48.467-08	692	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	-2500	\N	caee9396-fff8-4ef8-9b6a-e92a71a8c53d	271	848
11048	CREDIT	Feb 1, Lightning Talks	0	USD	2016-03-20 11:06:09.887-07	2016-03-29 13:37:47.75-07	694	28	\N	2016-03-28 17:00:00-07	\N	\N	\N	\N	\N	\N	\N	\N	22568	\N	fbfc08b1-f979-42dc-a890-554f8a26f3c2	2	848
11053	CREDIT	Mar 7 Lightning Talks	15316	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.794-07	694	28	\N	2016-06-14 11:14:22.455-07	\N	\N	\N	\N	\N	\N	\N	\N	15316	57	16d4f880-5932-486a-8a8b-91880af7b990	2	848
11057	CREDIT	6/2/16 Fireside Chat at Orange Coworking	20000	USD	2016-06-04 14:37:03.991-07	2016-06-14 11:14:22.145-07	694	28	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	211	519b845a-89eb-46a2-8f41-417f08244835	2	848
11061	CREDIT	October Hack Night Drinks/Food.	1106	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	700	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1100	485	053402ab-a3c8-4bc5-b997-1e117520daf7	273	848
11065	CREDIT	WWCode CONNECT Conference Travel Stipend	88760	GBP	2017-04-17 14:18:35.523-07	2017-04-17 14:18:35.581-07	713	1333	2602	\N	\N	\N	\N	\N	3760	GBP	1	-85000	85000	1016	f9932cd0-87ab-4b90-989a-ad0e2a065cc2	278	848
11069	CREDIT	Movie screening for "She Started It"	26475	USD	2017-03-14 10:59:53.142-07	2017-03-14 10:59:53.153-07	847	142	2149	\N	\N	\N	\N	\N	775	USD	1	-25700	25700	814	d0c4511b-9416-464e-8463-8da059d2719d	48	848
2245	CREDIT	Donation received via Meetup, less fees	788	USD	2016-10-04 09:46:13.302-07	2016-10-04 09:46:13.487-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	788	\N	c144fa0c-6234-4fa9-ad5e-e1e1137cdb08	848	848
2254	CREDIT	Network budget balance pre Open Collective	34240	USD	2016-10-04 14:49:31.268-07	2016-10-04 14:49:31.543-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34240	\N	ea63f818-0bf1-4576-acd3-559644fa6d35	848	848
2301	CREDIT	Blurb donation	54000	USD	2016-10-06 09:06:35.799-07	2016-10-06 09:06:36.235-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	54000	\N	634f797f-873a-43f3-9ce9-3df9e5244c4d	848	848
2255	CREDIT	Network Development	10000	USD	2016-10-04 14:50:13.582-07	2016-10-04 14:50:13.787-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	42761f67-0665-4e8b-bf08-83f8d2d853dc	848	848
2256	CREDIT	Network Development: Three Year Bonus:)	50000	USD	2016-10-04 14:52:32.839-07	2016-10-04 14:52:32.962-07	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	e2c9207b-a9aa-48e5-9d97-78fd589d86c9	848	848
9696	CREDIT	\N	30000	USD	2017-05-03 10:33:13.688-07	2017-05-03 10:33:13.688-07	51	3	\N	\N	\N	2694	0	0	0	USD	1	30000	30000	\N	bb0ff0a8-b5fd-44c9-ab0b-bf65a00eabbe	848	848
9698	CREDIT	\N	75000	USD	2017-05-03 10:44:10.84-07	2017-05-03 10:44:10.84-07	12	3	\N	\N	\N	2696	0	0	0	USD	1	75000	75000	\N	0d740b6b-249c-4c33-97ec-a5767b5a5799	848	848
9699	CREDIT	\N	15000	USD	2017-05-03 10:44:48.715-07	2017-05-03 10:44:48.715-07	51	3	\N	\N	\N	2697	0	0	0	USD	1	15000	15000	\N	0bbb8fb9-a8dc-4ee6-8a86-2bee0302b879	848	848
2298	CREDIT	Network Development (Stickers)	62984	USD	2016-10-06 08:49:44.329-07	2016-10-06 08:49:44.472-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	62984	\N	6f7df12e-1d15-40b9-8987-ae637eede1ee	848	848
2309	CREDIT	Network budget pre Open Collective 	406519	USD	2016-10-06 11:36:30.275-07	2016-10-06 11:36:30.298-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	406519	\N	6404bfb0-eb77-4649-a55a-6fbb57c82691	848	848
2311	CREDIT	Donations via Meetup	3937	USD	2016-10-06 11:41:35.464-07	2016-10-06 11:41:35.487-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3937	\N	5b67f243-796f-46e5-b77c-c13405674c39	848	848
9714	CREDIT	\N	2175	USD	2017-05-03 17:12:19.814-07	2017-05-03 17:12:19.814-07	259	3	\N	\N	\N	2702	0	0	0	USD	1	2175	2175	\N	e7f2e24e-6899-46c4-919d-dd1cb2d3838c	848	848
2342	CREDIT	Network Development +	50000	USD	2016-10-07 13:24:13.595-07	2016-10-07 13:24:13.706-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	b12c8806-5c99-46cf-8ae9-9f338888f266	848	848
2430	CREDIT	Network budget pre Open Collective 	162598	USD	2016-10-11 22:01:43.648-07	2016-10-11 22:01:43.828-07	264	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	162598	\N	4ec8f1b9-f12f-4ec8-962e-29aa026ead03	848	848
2404	CREDIT	Network Development	10000	USD	2016-10-11 09:52:38.277-07	2016-10-11 09:52:38.455-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	9c530187-e104-440b-ab25-54418876db12	848	848
2530	CREDIT	WWCode Director t-shirt	3649	USD	2016-10-17 13:50:42.245-07	2016-10-17 13:50:42.273-07	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3649	\N	b8eabdbe-fc85-4747-a409-0b5a0c49f817	848	848
2532	CREDIT	Director t-shirt	2860	USD	2016-10-17 13:55:47.647-07	2016-10-17 13:55:47.671-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2860	\N	e973ee0b-ec29-44b5-b658-5e1585b44f89	848	848
2536	CREDIT	Director t-shirt	3186	USD	2016-10-17 13:58:21.952-07	2016-10-17 13:58:22.083-07	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3186	\N	ab3a189e-8523-443a-bd54-f8824c3498dc	848	848
2538	CREDIT	Director t-shirt	3325	USD	2016-10-17 14:00:51.295-07	2016-10-17 14:00:51.425-07	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3325	\N	7b58a48c-ec76-4fd4-b285-daf541fdd4c4	848	848
3207	CREDIT	$500 OpenGov hackathon support - transaction and global development	43500	USD	2016-11-17 10:36:48.896-08	2016-11-17 10:36:49.046-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43500	\N	3726c26f-142a-4030-9306-3dbaad9081f0	848	848
3208	CREDIT	WWCode DC t-shirts sales	9524	USD	2016-11-17 10:37:58.038-08	2016-11-17 10:37:58.232-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9524	\N	36e90498-a765-4be3-b2d7-490d8776e07c	848	848
2522	CREDIT	from Code2040	90000	USD	2016-10-17 08:43:12.71-07	2016-10-17 08:43:13.113-07	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90000	\N	d37c6e91-1aa2-45bd-b13d-a4d3a6e32102	848	848
2528	CREDIT	WWCode shirt Grisel	3649	USD	2016-10-17 13:48:59.282-07	2016-10-17 13:48:59.313-07	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3649	\N	cdb75283-fd2d-49da-81ca-b7887f3bb44b	848	848
7042	CREDIT	Women Who Code Atlanta &amp; DevNexus Soirée - fees + global	10875	USD	2017-03-13 10:05:28.744-07	2017-03-13 10:05:31.582-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10875	\N	c188572e-6d9c-4795-8540-7fd3bcea20bf	848	848
7043	CREDIT	Women Who Code Atlanta &amp; DevNexus Soirée global networks support	1450	USD	2017-03-13 10:06:48.459-07	2017-03-13 10:06:51.099-07	51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1450	\N	e2b2b401-0472-40e8-8d1c-84e5ad37b555	848	848
4259	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 09:08:24.515-08	2016-12-23 09:08:24.709-08	265	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	8106fc14-9b21-49e9-bd3c-a25e7e6d64ea	848	848
9738	CREDIT	\N	2175	USD	2017-05-04 09:21:53.684-07	2017-05-04 09:21:53.684-07	276	3	\N	\N	\N	2710	0	0	0	USD	1	2175	2175	\N	5b429ca7-afd8-4d37-a3ad-51ca7ae6bd82	848	848
9746	CREDIT	\N	1200	USD	2017-05-04 11:58:24.9-07	2017-05-04 11:58:24.9-07	430	3	\N	\N	\N	2713	0	0	0	USD	1	1200	1200	\N	48c218d5-3e53-4a1f-88b4-485b930a9a99	848	848
8175	CREDIT	Travel Stipend for CONNECT	50000	USD	2017-04-03 13:24:58.616-07	2017-04-03 13:24:58.879-07	511	3	\N	2017-04-02 17:00:00-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	d8baca94-1547-4dd9-ae1b-b3bdddeac823	848	848
537	CREDIT	WOMEN TECHMAKER/WWCODE PARTNERSHIP GRANT	110000	USD	2016-05-10 14:15:06.327-07	2016-05-10 14:15:06.677-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	110000	\N	84415409-2268-45c1-a28e-42bbe8a9dedf	848	848
568	CREDIT	Women Techmaker/WWCode Partnership Grant	50000	USD	2016-05-16 13:01:14.238-07	2016-05-16 13:01:14.49-07	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	fcdb2afd-4ee1-44a6-95fb-9e1619286c8d	848	848
2253	CREDIT	Network Development	10000	USD	2016-10-04 14:44:54.4-07	2016-10-04 14:44:54.58-07	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	c7d7a0f0-4ac1-4169-9368-4b6d19c4680b	848	848
407	CREDIT	Mary Griffus	1000	USD	2016-04-26 21:41:38.126-07	2016-04-26 21:41:38.474-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	980ba0b0-ae38-48a2-9488-013c6634622b	848	848
349	CREDIT	Jasna Rodulfa	1000	USD	2016-04-15 07:17:21.126-07	2016-04-16 13:40:58.829-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	4cb4c4ab-f5d6-4d63-a937-8af026b8759d	848	848
2235	CREDIT	Turner Matching Donation	5000	USD	2016-10-04 08:46:59.013-07	2016-10-04 08:46:59.134-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000	\N	f900d59d-399a-4087-8a99-d5dc330e4483	848	848
2231	CREDIT	Sponsorship: AT&T Hackathon Prize	1000000	USD	2016-10-04 08:40:37.72-07	2016-10-04 08:40:37.853-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000000	\N	4b8d36db-e5cf-4fd1-8128-a699de20993f	848	848
9042	CREDIT	\N	200	USD	2017-04-30 18:40:30.232-07	2017-04-30 18:40:30.232-07	516	3419	2749	\N	\N	2636	10	20	34	USD	1	200	136	\N	8c5b057c-7596-4791-a13a-fc2a64303098	702	848
202	CREDIT	Recurring subscription	100	MXN	2016-03-15 13:05:22.15-07	2016-04-01 07:32:17.381-07	10	7	64	2016-04-07 07:32:17.381-07	\N	83	5	\N	\N	\N	\N	\N	\N	\N	d1d87139-4731-4474-a1a3-965cce286ed3	722	848
96	CREDIT	Donation to WWCode Mexico City	100	MXN	2016-02-15 10:46:05.92-08	2016-04-01 07:32:17.223-07	10	7	64	2016-04-07 07:32:17.381-07	\N	83	\N	\N	\N	\N	\N	\N	\N	\N	eb1ff5a0-1e75-4d49-8c64-69e64f1b9d6f	722	848
6930	CREDIT	monthly recurring subscription	100	USD	2017-03-09 10:29:18.778-08	2017-03-09 10:29:18.778-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	97fbe8b4-4c66-46ec-bc2f-3432ad3db065	724	848
3047	CREDIT	Recurring subscription	100	USD	2016-11-09 10:29:23.967-08	2016-11-09 10:29:23.967-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	c416f18a-645f-4ba1-bc60-7f6ef6291cf5	724	848
8038	CREDIT	monthly recurring subscription	1000	USD	2017-04-01 16:32:24.254-07	2017-04-01 16:32:24.254-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	b1060810-1e00-4118-b7b9-6cc529fca54a	740	848
1918	CREDIT	\N	50000	USD	2016-09-12 21:15:04.709-07	2016-09-12 21:15:04.709-07	2	1178	737	\N	\N	653	2500	5000	1130	USD	1	50000	41370	\N	578ab4ce-f187-4636-ad60-c3b5760ac10c	755	848
985	CREDIT	Donation to WWCode San Francisco	100	USD	2016-06-21 09:05:01.251-07	2016-06-21 09:05:01.296-07	4	642	431	\N	\N	360	5	10	32	USD	1	100	53	\N	2db86e58-3d86-4dc5-80ff-58f5fc7984a7	768	848
995	CREDIT	Donation to WWCode Austin	75000	USD	2016-06-22 13:09:46.403-07	2016-06-22 13:09:46.432-07	2	646	435	\N	\N	364	3750	7500	2625	USD	1	75000	61125	\N	1dd2bb42-e7c2-4e79-8fc7-8949fa3a1e33	772	848
1423	CREDIT	Recurring subscription	10000	USD	2016-08-03 10:47:25.319-07	2016-08-03 10:47:25.429-07	4	896	571	\N	\N	498	500	1000	250	USD	1	10000	8250	\N	8ce2b0bd-aefa-4369-9ce9-0e1e469b5d64	784	848
6931	CREDIT	\N	6000	USD	2017-03-09 10:29:55.496-08	2017-03-09 10:29:55.496-08	259	3442	2104	\N	\N	2003	300	600	162	USD	1	6000	4938	\N	16affe26-a286-4782-8426-d75e1806aef8	789	848
6944	CREDIT	monthly recurring subscription	1000	USD	2017-03-09 20:43:47.943-08	2017-03-09 20:43:47.943-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	9b332c05-04c1-4be6-8df7-bd7246af38c4	806	848
2262	CREDIT	Donation via meetup	2363	USD	2016-10-04 15:14:59.695-07	2016-10-04 15:14:59.884-07	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2363	\N	dfb49d74-e609-4cc8-8c3e-46ff770309f3	848	848
2263	CREDIT	Network Development	17375	USD	2016-10-04 15:15:45.133-07	2016-10-04 15:15:45.269-07	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17375	\N	43365b78-5277-49da-b188-6a517a926473	848	848
2306	CREDIT	I am an active member and WWC has taken my career in tech to the next level. All the support and lessons from the WWC DC chapter are instrumental in me remaining in this field.	2250	USD	2016-10-06 10:23:39.409-07	2016-10-06 10:23:39.459-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250	\N	efb89f26-5e2c-42bf-b173-27d7bf0406f9	848	848
2264	CREDIT	Diana A. Scholarship Google I/O	25000	USD	2016-10-04 15:19:06.989-07	2016-10-04 15:19:07.108-07	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25000	\N	8932d7a2-35b5-4d30-b78b-729a53066393	848	848
2422	CREDIT	Donation from Marie W.	900	USD	2016-10-11 17:26:47.2-07	2016-10-11 17:26:47.59-07	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	900	\N	39996606-f7e9-40ee-a5e1-aa68deae24b2	848	848
2332	CREDIT	Course Hero Hackathon Support	315000	USD	2016-10-07 07:39:15.069-07	2016-10-07 07:39:15.23-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	315000	\N	5c187624-870d-4c32-b10c-d952bc638fa5	848	848
2333	CREDIT	Hackathon Support Open Gov	45000	USD	2016-10-07 07:41:08.315-07	2016-10-07 07:41:08.391-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	45000	\N	08afa6d7-318d-47a2-8443-f19c6d9fe1a5	848	848
2423	CREDIT	Network Development	19100	USD	2016-10-11 17:28:02.718-07	2016-10-11 17:28:03.121-07	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19100	\N	74d06361-67e4-4923-840d-82fb946093ec	848	848
2327	CREDIT	Google I/O conference stipend	102409	GBP	2016-10-07 06:10:42.97-07	2016-10-07 06:10:43.753-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	102409	\N	7daeaf49-013c-42de-83da-86526afaea32	848	848
2341	CREDIT	Network Development (100%)	10000	USD	2016-10-07 13:05:13.011-07	2016-10-07 13:05:13.112-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	65d47c4a-b755-49c7-b2d6-dbddfdfd421e	848	848
2340	CREDIT	Hackbright support for hackathon	45000	USD	2016-10-07 13:04:15.299-07	2016-10-07 13:04:15.435-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	45000	\N	f861afb4-acee-4677-8343-79a42a833d0f	848	848
2428	CREDIT	Donation from Shugo	450	USD	2016-10-11 21:30:15.825-07	2016-10-11 21:30:15.896-07	295	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	0f702272-a446-4280-a96b-9bc994874280	848	848
2429	CREDIT	Network Development	19550	USD	2016-10-11 21:30:34.678-07	2016-10-11 21:30:34.772-07	295	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19550	\N	9ddbfb06-db7c-4fa2-a325-6e69943c17fe	848	848
2431	CREDIT	Network Development (Thanks Atlassian) 	20000	USD	2016-10-11 22:06:05.058-07	2016-10-11 22:06:05.202-07	266	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	9549e2a9-b907-4801-8b47-6407c300e439	848	848
3531	CREDIT	Regional Leadership Director Training	631	USD	2016-11-29 14:38:57.006-08	2016-11-29 14:38:57.13-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	631	\N	aeca0ae5-c39b-46b5-a46a-5a964ab43335	848	848
3533	CREDIT	Network Development	20000	USD	2016-11-29 14:43:53.719-08	2016-11-29 14:43:53.971-08	286	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	7a9cb9ef-afdd-4d85-b4b5-fa52e346eb92	848	848
3535	CREDIT	Banner	2000	USD	2016-11-29 15:07:15.153-08	2016-11-29 15:07:15.39-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	3dc39835-0671-450e-bd85-9d5622676954	848	848
3537	CREDIT	Global Development - thanks VMWare	50000	USD	2016-11-29 15:07:50.964-08	2016-11-29 15:07:51.154-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	17513123-d08c-4153-96a9-85c8bf346bb8	848	848
3514	CREDIT	CONNECT 2016	4536939	USD	2016-11-29 13:44:20.041-08	2016-11-29 13:44:20.185-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4536939	\N	184f4788-f08f-4b14-9226-aaca61c2ebb3	848	848
3540	CREDIT	Donation from PB - fees 	1187	USD	2016-11-29 15:33:50.04-08	2016-11-29 15:33:50.206-08	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	\N	b1569a2e-654e-4108-9c97-de12187ef171	848	848
3598	CREDIT	Network Development	20000	USD	2016-11-30 10:40:15.233-08	2016-11-30 10:40:15.446-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	1d3a6593-877b-4da0-a966-c2a286127140	848	848
3600	CREDIT	Banner	2000	USD	2016-11-30 10:40:32.021-08	2016-11-30 10:40:32.139-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	a1457d27-e61b-45de-aadd-378b29544550	848	848
3612	CREDIT	Network Development	20000	USD	2016-11-30 12:59:29.087-08	2016-11-30 12:59:29.921-08	280	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	c26e172a-b880-40ae-96e1-245f9122cd42	848	848
3614	CREDIT	Leadership development - conference stipend Google I/O	130000	USD	2016-11-30 13:07:12.142-08	2016-11-30 13:07:12.419-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	130000	\N	e8834ded-c290-4ab8-b367-c3356b2c9eb3	848	848
3617	CREDIT	Global Development	20000	USD	2016-11-30 13:11:00.067-08	2016-11-30 13:11:00.307-08	294	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	eb089b39-6f9d-41c8-9c70-ca094bacbc0a	848	848
3618	CREDIT	Banner	2000	USD	2016-11-30 13:19:37.017-08	2016-11-30 13:19:37.251-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	d33503e6-bb6e-4b24-b7ed-01842d266e8e	848	848
3620	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 13:20:06.733-08	2016-11-30 13:20:15.577-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500	\N	5cd12a4a-4670-41f8-a215-222175234e3e	848	848
3621	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 13:20:12.669-08	2016-11-30 13:20:16.148-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500	\N	33dd6edd-aafe-4257-a57c-a3dd886e6c9a	848	848
4255	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 08:59:24.039-08	2016-12-23 08:59:24.291-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6157d8ed-903e-40f6-b5d8-087f4793a4c2	848	848
4257	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-23 09:02:53.836-08	2016-12-23 09:02:53.991-08	264	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	\N	3f46c5c9-4147-486e-b8ab-7a7a89a88f9f	848	848
4261	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-23 09:13:39.369-08	2016-12-23 09:13:39.507-08	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	\N	6f1c4879-9600-446e-b8b1-7c4ca6b64662	848	848
4263	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 09:20:13.429-08	2016-12-23 09:20:13.545-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6d9dd70c-2b98-4094-8a7f-d8d14ebdfe64	848	848
4265	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 09:31:16.26-08	2016-12-23 09:31:16.392-08	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	be353290-3a79-4837-b322-8bcf820cf681	848	848
4267	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-23 09:41:14.029-08	2016-12-23 09:41:14.193-08	266	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	034ce920-1702-43ca-b969-c609763c116b	848	848
2329	CREDIT	Google I/O stipend	39585	GBP	2016-10-07 06:35:45.945-07	2016-10-07 06:35:46.151-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39585	\N	31edf1ab-fe0e-470a-b022-11a2727cd41f	848	848
4372	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:38:50.944-08	2016-12-27 08:38:51.039-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	61be0f13-1f0e-4430-a69b-de48f097255d	848	848
4374	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:48:52.922-08	2016-12-27 08:48:53-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	f81b72fd-ff9d-453c-85aa-83f26b75e23f	848	848
4380	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:58:32.613-08	2016-12-27 08:58:32.719-08	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	52c10ec3-fc17-4bb0-80dd-b97ef1359708	848	848
4382	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 09:02:32.71-08	2016-12-27 09:02:32.843-08	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	cb83b4cd-aedb-4485-a545-c318b78ca0fe	848	848
4384	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 09:24:55.371-08	2016-12-27 09:24:55.632-08	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	ad4cf65e-ffab-438f-9b08-a536185a5af3	848	848
4386	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-27 09:32:02.798-08	2016-12-27 09:32:02.918-08	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	\N	f57723cd-0a3e-4bf8-b686-8a60ae3e7e78	848	848
3955	CREDIT	Priyanka - IOT Hackathon donation - fees and global development 	2175	USD	2016-12-13 12:08:29.218-08	2016-12-13 12:08:29.464-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2175	\N	3b4c5740-bddf-407f-a147-56b43886907c	848	848
3956	CREDIT	Donation via Meetup - fees + Global Development	1187	USD	2016-12-13 12:17:57.936-08	2016-12-13 12:17:58.19-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	\N	940cd510-b8a8-460d-b494-d2e4a216ad9e	848	848
3957	CREDIT	Donation via meetup - fees and global development	775	USD	2016-12-13 12:20:15.375-08	2016-12-13 12:20:15.714-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	2c90bf2f-4941-48ed-828c-db67f8249cc1	848	848
4270	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-23 09:55:42.091-08	2016-12-23 09:55:42.249-08	267	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	\N	2acba33f-e56b-49f2-886b-86388493777d	848	848
4441	CREDIT	Global Development for Meetup Fee	6000	CAD	2016-12-28 08:29:31.983-08	2016-12-28 08:29:28.409-08	293	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	3c2a09b0-ab81-4e66-8ec6-a6946e367763	848	848
4443	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 08:31:33.43-08	2016-12-28 08:31:29.837-08	294	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	c257c047-567a-47fb-b8b7-02b7f7a90b12	848	848
77	CREDIT	Donation to WWCode Seattle	100	USD	2016-02-02 13:46:44.866-08	2016-04-16 13:40:58.7-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	ac7d9c6f-0090-4ff5-bd71-01aaef4f5b99	724	848
131	CREDIT	Recurring subscription	100	USD	2016-03-02 15:01:26.771-08	2016-04-16 13:40:58.719-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	8abd55fb-f09a-4c77-862a-144f73ebdd0d	724	848
103	CREDIT	Donation to WWCode Austin	30000	USD	2016-02-18 11:54:08.531-08	2016-04-16 13:40:58.717-07	2	108	71	\N	\N	15	0	3000	900	USD	1	30000	26100	\N	a2af1057-4522-4c6a-b5ec-9f3e41da88e7	730	848
124	CREDIT	Donation to WWCode Washington DC	100	USD	2016-03-01 20:41:59.916-08	2016-04-16 13:40:58.728-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	2cd7b544-2cdd-4060-9426-eeb4bed04fb5	839	848
5016	CREDIT	WWCode Boston t-shirt sales	1964	USD	2017-01-17 19:19:47.816-08	2017-01-17 19:19:48.024-08	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1964	\N	06f8f818-4527-4882-a50c-40de00ed8711	848	848
5017	CREDIT	WWCode t-shirt sales	4397	USD	2017-01-17 19:20:52.226-08	2017-01-17 19:20:52.436-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4397	\N	232dcd17-1057-4c79-ade5-b368a259f68f	848	848
5018	CREDIT	WWCode t-shirt sales	1599	USD	2017-01-17 19:21:50.791-08	2017-01-17 19:21:50.964-08	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1599	\N	d2873b77-1ea2-48e6-894b-a460b9462b1f	848	848
499	CREDIT	Women Techmaker/WWCode partnership grant	50000	USD	2016-05-04 14:17:27.653-07	2016-05-04 14:17:27.886-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	c81e5698-25db-421e-80ce-4c04a817e59c	848	848
2397	CREDIT	Google I/O stipend	75000	USD	2016-10-11 09:01:42.326-07	2016-10-11 09:01:43.286-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	85005ce6-d4f3-4b07-98d0-ef524443de8a	848	848
325	CREDIT	From:\tThao Le	1500	USD	2016-04-12 11:49:06.645-07	2016-04-16 13:40:58.815-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	1a6b4663-7869-49ba-9691-9b3bec6843c4	848	848
306	CREDIT	Leslie Mollner: Thank you very much for all the help I've received from WWCode -TC so far. -Leslie	2250	USD	2016-04-06 11:17:07.204-07	2016-04-16 13:40:58.818-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250	\N	d96508af-a33c-42bc-9446-bc438652e8a8	848	848
333	CREDIT	From Deepa	1500	USD	2016-04-12 14:18:56.547-07	2016-04-16 13:40:58.847-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	886f2733-7967-4b61-93c1-f8242037a5a4	848	848
858	CREDIT	Dalia donated to WWCode SF	1500	USD	2016-06-09 11:40:21.124-07	2016-06-09 11:40:21.833-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	ebf2964d-38ed-47f4-93dc-59fbb394dc73	848	848
2410	CREDIT	From Lucas in honor of Rachel M. She learned Python and HTML/CSS	2250	USD	2016-10-11 12:13:57.013-07	2016-10-11 12:13:57.265-07	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250	\N	9a09da05-1e08-4b56-b452-1236e02b2a92	848	848
2411	CREDIT	Network Development	17750	USD	2016-10-11 12:17:21.991-07	2016-10-11 12:17:22.199-07	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17750	\N	f87d62ba-99de-42b8-9039-9165dfc2022b	848	848
2412	CREDIT	Network development - thanks Atlassian	50000	USD	2016-10-11 12:30:14.934-07	2016-10-11 12:30:15.155-07	297	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	b3fcd677-f2e2-4f24-b35b-b81ab513f215	848	848
2413	CREDIT	Donation from Biotti	403	USD	2016-10-11 12:32:58.956-07	2016-10-11 12:32:59.265-07	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	403	\N	b07d171f-6a06-4bf1-b5ab-44b28a4d2fe6	848	848
412	CREDIT	Andrea S	1500	USD	2016-04-27 13:05:44.711-07	2016-04-27 13:05:44.974-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	1f5994ab-e490-47ec-af2a-97af7960004f	848	848
2414	CREDIT	Network Development	17500	USD	2016-10-11 12:35:59.115-07	2016-10-11 12:35:59.305-07	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17500	\N	bd1df48d-4123-4817-b44a-698351ad76c5	848	848
2415	CREDIT	Donation Ailia S.	9000	USD	2016-10-11 12:44:42.807-07	2016-10-11 12:44:43.161-07	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000	\N	37933bd0-775c-4ff6-914b-9be5c19aec41	848	848
2265	CREDIT	Donation Hannah B.	9000	USD	2016-10-04 15:35:46.967-07	2016-10-04 15:35:47.153-07	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000	\N	41b245bb-086f-4199-81b9-d6900db24611	848	848
2267	CREDIT	Network Development	15400	USD	2016-10-04 15:39:26.796-07	2016-10-04 15:39:26.9-07	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15400	\N	d40d88e7-8e48-43d2-b629-62c123b275bf	848	848
2416	CREDIT	Network support - thanks VMWare	200000	USD	2016-10-11 12:50:00.045-07	2016-10-11 12:50:00.312-07	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	200000	\N	a4e80a28-1270-4c9e-870c-de3011dd78c7	848	848
2418	CREDIT	Network support - Regional Leadership (thanks VMWare)	370000	USD	2016-10-11 12:51:45.723-07	2016-10-11 12:51:45.897-07	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	370000	\N	90107c21-9ee4-41e1-b930-b991cd649629	848	848
2419	CREDIT	Network Development	20000	USD	2016-10-11 13:03:19.884-07	2016-10-11 13:03:20.084-07	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	b5dcca3b-559b-4c43-83ff-a31cd387d1f2	848	848
2420	CREDIT	Network Development (Thanks Zendesk)	16129	USD	2016-10-11 13:26:22.964-07	2016-10-11 13:26:23.172-07	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16129	\N	2b973f59-80ae-4046-996e-35e967509adc	848	848
2421	CREDIT	Donation Elizabeth B.	9000	USD	2016-10-11 17:22:08.455-07	2016-10-11 17:22:08.557-07	288	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000	\N	d6590406-0ffc-489f-ab6a-3436c8be0d3a	848	848
4188	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-21 10:49:47.667-08	2016-12-21 10:49:47.892-08	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	74434b16-1798-42d0-92da-547acdf24d48	848	848
666	CREDIT	Generous donation from Target to support WWCode Twin Cities	500000	USD	2016-05-26 11:37:24.922-07	2016-05-26 11:37:23.286-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500000	\N	345acef4-87b2-455f-beef-b23517d7a460	848	848
667	CREDIT	Proceeds from teespring	10022	USD	2016-05-26 11:38:50.077-07	2016-05-26 11:38:48.41-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10022	\N	dce42eaa-b86f-4baa-ac29-a12e270cd434	848	848
4360	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 08:10:30.416-08	2016-12-27 08:10:30.529-08	299	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	271d48b8-2cba-40e7-bafa-e632e30dbbce	848	848
9659	CREDIT	\N	60000	USD	2017-05-02 11:45:44.253-07	2017-05-02 11:45:44.253-07	51	3	\N	\N	\N	2677	0	0	0	USD	1	60000	60000	\N	3c6bb7c3-caff-4599-b462-6a53ea05cb0b	848	848
1042	CREDIT	Donation from MondoRobot & Avery Brewing Company: Hackathon Proceeds	320247	USD	2016-06-29 11:42:31.848-07	2016-06-29 11:42:32.517-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	320247	\N	3f5141a2-01ec-4026-8ebd-f1d232237947	848	848
2236	CREDIT	Donation: Beth Laing	5000	USD	2016-10-04 08:47:24.058-07	2016-10-04 08:47:24.175-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000	\N	a4d7f6ff-8014-48b0-aef8-c0d0d62ef7af	848	848
2237	CREDIT	Donation: Syema Ailia	2500	USD	2016-10-04 08:47:46.468-07	2016-10-04 08:47:46.624-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500	\N	445859c1-2d38-4be2-8d47-7b91e62aad55	848	848
2242	CREDIT	Reverse duplicate transaction	500	USD	2016-10-04 09:12:26.671-07	2016-10-04 09:12:26.903-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500	\N	bfa51ebc-0ab7-4ed8-9f4e-e4862bf271ba	848	848
2234	CREDIT	Donations made via Meetup as of Jan 2016, less transaction fees	9212	USD	2016-10-04 08:46:17.845-07	2016-10-04 08:46:18.02-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9212	\N	5af62e78-2976-4c04-aaab-f3c34f1297e7	848	848
2299	CREDIT	Donations via Meetup	2823	USD	2016-10-06 08:53:38.156-07	2016-10-06 08:53:38.231-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2823	\N	35ce43d6-2009-48a3-bc10-e7c08155cd01	848	848
2300	CREDIT	Network development	6000	USD	2016-10-06 09:01:48.321-07	2016-10-06 09:01:48.667-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	34694258-edf0-4473-b471-555bdcfddea7	848	848
2398	CREDIT	Network Development	20000	USD	2016-10-11 09:02:18.108-07	2016-10-11 09:02:19.138-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	9ed15360-3e2f-4801-ac5a-2b41471bc68a	848	848
2305	CREDIT	Google I/O scholarship	75000	USD	2016-10-06 10:21:27.384-07	2016-10-06 10:21:27.396-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	eb17e756-ee3f-434d-9493-8f6fbc94ea78	848	848
6882	CREDIT	Leadership Development 	14915	MXN	2017-03-07 04:55:53.128-08	2017-03-07 04:55:53.3-08	511	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14915	\N	58f1389a-1aa3-43b7-8283-5a0d75c4e827	848	848
474	CREDIT	Recurring subscription	100	USD	2016-05-02 15:49:03.545-07	2016-05-02 15:49:03.612-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	625d1196-61d0-48d5-8a84-0cfd6a50c750	724	848
451	CREDIT	Donation to WWCode Washington DC	50000	USD	2016-04-29 06:51:19.1-07	2016-04-29 06:51:19.15-07	13	303	216	\N	\N	183	2500	5000	1480	USD	1	50000	41020	\N	12d109fa-91c8-4a65-8547-f954d2767714	735	848
261	CREDIT	Donation to WWCode Austin	30000	USD	2016-03-25 08:11:04.684-07	2016-04-16 13:40:58.812-07	2	192	152	\N	\N	64	0	3000	900	USD	1	30000	26100	\N	112c59b0-b10d-43fc-9d6f-a33b38dfde31	738	848
837	CREDIT	Donation to WWCode Austin	150000	USD	2016-06-06 12:04:37.186-07	2016-06-06 12:04:37.308-07	2	551	377	\N	\N	312	7500	15000	4380	USD	1	150000	123120	\N	7b775e3a-0634-4723-9638-3b8d28089e89	762	848
127	CREDIT	Recurring subscription	500	MXN	2016-03-02 10:06:23.743-08	2016-04-16 13:40:58.731-07	10	80	42	\N	\N	68	2	3	16	USD	17.8570999999999991	28	125	\N	2b05e30a-ef47-4a1e-b090-382b227c3b5b	775	848
282	CREDIT	Recurring subscription	500	MXN	2016-04-02 13:10:38.206-07	2016-04-02 13:10:38.242-07	10	80	42	2016-04-07 13:10:38.206-07	\N	68	\N	\N	\N	\N	\N	\N	\N	\N	8cc3139c-729d-497c-9aa9-1c6aba7f53bb	775	848
842	CREDIT	Donation to WWCode Washington DC	100000	USD	2016-06-06 17:53:47.603-07	2016-06-06 17:53:47.649-07	13	555	381	\N	\N	316	5000	10000	2930	USD	1	100000	82070	\N	9921b890-042c-4506-b8c0-2a77793a0783	801	848
277	CREDIT	Recurring subscription	100	USD	2016-04-02 08:43:33.706-07	2016-04-16 13:40:58.808-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	6572dba9-3912-444c-96f4-5ddbec5c098c	839	848
6883	CREDIT	Leadership Development	50616	MXN	2017-03-07 05:01:15.044-08	2017-03-07 05:01:15.192-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50616	\N	aaecc386-1923-482a-835a-4662c8858bc3	848	848
9695	CREDIT	\N	150000	USD	2017-05-03 10:32:39.653-07	2017-05-03 10:32:39.653-07	12	3	\N	\N	\N	2693	0	0	0	USD	1	150000	150000	\N	839c847a-30e8-463a-912f-a6845435eca0	848	848
5021	CREDIT	WWCode t-shirt sales	3563	USD	2017-01-17 19:28:29.874-08	2017-01-17 19:28:30.096-08	290	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3563	\N	2dde7e29-f8fa-4b52-86c1-3cfeb0c374e3	848	848
2268	CREDIT	Network budget pre Open Collective	6264	USD	2016-10-04 15:51:25.324-07	2016-10-04 15:51:26.129-07	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6264	\N	2bd3e74c-84e0-43e2-a21d-b9443200eedc	848	848
2269	CREDIT	Donation from Adane	450	USD	2016-10-04 15:56:11.881-07	2016-10-04 15:56:13.02-07	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	ea31005b-cb3b-42d7-9b8c-1c812558ee14	848	848
2270	CREDIT	Network Development	13286	USD	2016-10-04 15:57:17.136-07	2016-10-04 15:57:17.293-07	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13286	\N	7382b702-3956-405b-b6af-b9d1b04e89ba	848	848
2312	CREDIT	Network Development (100%)	10000	USD	2016-10-06 11:42:47.682-07	2016-10-06 11:42:47.71-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	655af063-49c8-4b0b-9288-086d5e290e34	848	848
2394	CREDIT	Conference stipend Heidi H.	50000	USD	2016-10-11 08:59:30.363-07	2016-10-11 08:59:31.524-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	0db54f37-f224-4eaa-ae93-e4a02bc97eef	848	848
2405	CREDIT	Donation Scott Z. in honor of his sister	1800	USD	2016-10-11 10:01:23.313-07	2016-10-11 10:01:23.731-07	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1800	\N	99b8d53c-6e5b-40ee-a937-5d414c12adc6	848	848
2406	CREDIT	Network Development	18200	USD	2016-10-11 10:02:51.621-07	2016-10-11 10:02:51.839-07	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18200	\N	8bc77fb9-7ed7-4099-91aa-18899658861b	848	848
2534	CREDIT	Director t-shirt	2898	USD	2016-10-17 13:57:08.514-07	2016-10-17 13:57:08.533-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2898	\N	bbf57164-512a-42db-baa3-b91df0b4080c	848	848
3534	CREDIT	Stephen	450	USD	2016-11-29 14:55:31.534-08	2016-11-29 14:55:31.727-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	bc8ea724-7089-4d7e-80dc-6ed375a7bc76	848	848
3200	CREDIT	Portland t-shirt proceeds	6915	USD	2016-11-17 10:01:32.1-08	2016-11-17 10:01:32.49-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6915	\N	c96721bd-c150-4300-b6b9-144a4019cefb	848	848
4378	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:53:55.856-08	2016-12-27 08:53:55.969-08	275	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	aa3d7224-7382-4f6f-a0f5-2949228f2339	848	848
659	CREDIT	Women Techmaker WWCode Partnership Grant	20000	USD	2016-05-25 09:45:53.797-07	2016-05-25 09:45:54.045-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	b0965077-da41-4ea3-9ff4-a25d7be1a3b6	848	848
4370	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-27 08:34:45.59-08	2016-12-27 08:34:45.771-08	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	\N	7c5dc3dd-2211-4c62-bdf3-1d1bff4db06a	848	848
653	CREDIT	Women Techmaker WWCode Partnership Grant	15000	USD	2016-05-24 13:12:34.913-07	2016-05-24 13:12:35.226-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000	\N	4ec3f9b1-a7c7-4887-b029-6a3f17ada0c4	848	848
702	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	80000	USD	2016-05-31 11:01:08.532-07	2016-05-31 11:01:07.064-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	80000	\N	8c1d5f60-5e9f-4262-966c-0b0006e7d309	848	848
4702	CREDIT	Donation - fees + global development	1187	USD	2017-01-05 06:58:39.771-08	2017-01-05 06:58:42.205-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	\N	9eb3b1c1-578e-4b80-be38-c28a2c634474	848	848
4701	CREDIT	donation - fees and global development	798	USD	2017-01-05 06:48:24.355-08	2017-01-05 06:48:26.734-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	798	\N	42c8ea1c-5292-4ee1-8768-97d910be5fe2	848	848
4677	CREDIT	Donation from Cameron - fees and global development	4350	USD	2017-01-04 12:33:36.359-08	2017-01-04 12:33:37.475-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4350	\N	79fb7110-6a80-49d9-9d52-eca9ba262867	848	848
3201	CREDIT	T-shirt payout	1092	USD	2016-11-17 10:03:13.726-08	2016-11-17 10:03:13.862-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1092	\N	c83bd839-4222-4e75-b71b-afe58b183300	848	848
3203	CREDIT	$1000 CDK Global event support - transaction and global development	87000	USD	2016-11-17 10:18:40.107-08	2016-11-17 10:18:40.436-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	87000	\N	cda2e9ae-7568-4ca0-a5a6-b6e8b99fdfb4	848	848
3204	CREDIT	$1000 Mozilla hackathon support - Global Development	90000	USD	2016-11-17 10:21:06.154-08	2016-11-17 10:21:07.268-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90000	\N	646702d0-fba2-4ee2-8e90-8c8871732cac	848	848
3205	CREDIT	$5000 Intel Hackathon support - global development	450000	USD	2016-11-17 10:23:08.268-08	2016-11-17 10:23:08.461-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450000	\N	6b086a9f-6727-4f05-85cd-8f84aa7c79dd	848	848
3206	CREDIT	$3500 Course Hero Hackathon support - transaction & global development	304500	USD	2016-11-17 10:27:12.528-08	2016-11-17 10:27:12.742-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	304500	\N	05d80488-2759-4454-abe3-0a379836df31	848	848
7556	CREDIT	International Women's Day Atlanta	10350	USD	2017-03-28 11:28:28.77-07	2017-03-28 11:28:28.938-07	51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6c8e7d6b-bcd8-44bc-a3c8-ab4f3fb6b3b5	848	848
3518	CREDIT	Global Development	20000	USD	2016-11-29 13:56:45.442-08	2016-11-29 13:56:45.713-08	290	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	6323fec2-eb32-4b9b-9134-9d658f2efe40	848	848
3519	CREDIT	Network Development - 10k member bonus	100000	USD	2016-11-29 13:58:23.625-08	2016-11-29 13:58:23.799-08	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	2266fe36-fda5-4fbb-bca6-7cda7e67318b	848	848
3520	CREDIT	Global Development	15600	USD	2016-11-29 14:08:18.065-08	2016-11-29 14:08:18.213-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15600	\N	adf0f06c-e558-411f-8551-6c08eaf62de1	848	848
3521	CREDIT	Erica S. donation - fees	450	USD	2016-11-29 14:11:37.922-08	2016-11-29 14:11:38.131-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	21b0481e-bb75-445b-b121-6964171ec740	848	848
3522	CREDIT	Erica S. donation - fees	450	USD	2016-11-29 14:12:36.336-08	2016-11-29 14:12:36.503-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	e671d019-152e-4857-b2d0-2d1a5545e33d	848	848
3523	CREDIT	Global Development	19100	USD	2016-11-29 14:17:18.389-08	2016-11-29 14:17:18.558-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19100	\N	93342e23-5a6d-4557-8988-d48bda18046b	848	848
3524	CREDIT	Network Budget Balance Pre Open Collective	17475	USD	2016-11-29 14:28:03.065-08	2016-11-29 14:28:03.231-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17475	\N	3ca715da-37c9-48d6-8b41-15a1dd421d81	848	848
3525	CREDIT	Network Development	2500	USD	2016-11-29 14:29:22.958-08	2016-11-29 14:29:23.167-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500	\N	a973cade-bced-498a-aaf3-f6a4f60ca02e	848	848
3527	CREDIT	Banner	2000	USD	2016-11-29 14:34:22.96-08	2016-11-29 14:34:23.085-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	3097b9bd-e10a-4598-bd6d-b035d0f33f73	848	848
3528	CREDIT	Regional Leadership Director Training 	13031	USD	2016-11-29 14:35:05.252-08	2016-11-29 14:35:05.379-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13031	\N	ce5bf007-5b83-46b2-b82b-17ef62e16627	848	848
3541	CREDIT	Global Development	20000	USD	2016-11-29 15:34:32.59-08	2016-11-29 15:34:32.817-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	3930af5b-22e9-43a5-b3b5-4c28e21c4a3b	848	848
3542	CREDIT	Donation from Margaret - fees	2012	USD	2016-11-29 15:37:14.82-08	2016-11-29 15:37:15.082-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2012	\N	3e72e75f-912e-4507-8a12-e73a2a2baecb	848	848
3543	CREDIT	Donation via Meetup	775	USD	2016-11-29 15:39:08.069-08	2016-11-29 15:39:08.263-08	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	d13f4546-ddb3-4403-8ffa-3e94709cd39e	848	848
3544	CREDIT	Donation via meetup	775	USD	2016-11-29 15:39:42.382-08	2016-11-29 15:39:42.512-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	00e31b6f-e424-4f4b-b51e-73cc1c290081	848	848
3547	CREDIT	Network Development	20000	USD	2016-11-29 16:23:24.87-08	2016-11-29 16:23:24.511-08	285	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	c97c359c-7c4d-491a-9489-1423fc900fd1	848	848
3624	CREDIT	Conference Travel Stipend - Google I/O Elese	75000	USD	2016-11-30 13:25:31.161-08	2016-11-30 13:25:41.165-08	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	09bd1cc4-9ecf-4dd9-a3a6-2bfe654015da	848	848
3627	CREDIT	Banner	2000	USD	2016-11-30 13:33:30.25-08	2016-11-30 13:33:30.386-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	d7f0bea9-9ed6-4ec6-aada-f8d3fe14c421	848	848
3629	CREDIT	Global Development - Thanks VMWare	50000	USD	2016-11-30 13:34:00.324-08	2016-11-30 13:34:01.658-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	a8125046-2c82-43f8-bf5a-3930226ad6d9	848	848
7198	CREDIT	WTM Google I/O Travel Stipend	50000	USD	2017-03-17 07:09:18.868-07	2017-03-17 07:09:18.344-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	9972b655-8830-4ac6-b9c7-2e373feebc03	848	848
2331	CREDIT	Network Development	15755	GBP	2016-10-07 07:03:54.031-07	2016-10-07 07:03:54.119-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15755	\N	61afdaf6-bfb9-4948-bca0-bd656fbc2d6f	848	848
3510	CREDIT	Global Development	80000	GBP	2016-11-29 13:14:00.118-08	2016-11-29 13:14:01.107-08	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	80000	\N	1a0ffc67-8650-41fd-b3ff-7af4d6f81cbc	848	848
4376	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:52:05.93-08	2016-12-27 08:52:06.061-08	274	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	59f7ddd7-ade8-4ebf-977e-cb823b5ab4cd	848	848
8210	CREDIT	\N	20000	USD	2017-04-04 12:51:04.916-07	2017-04-04 12:51:04.916-07	2	3999	2438	\N	\N	2332	1000	2000	700	USD	1	20000	16300	\N	2d1d8ff1-e35e-417d-b676-75bc6130e73a	707	848
2189	CREDIT	Recurring subscription	1000	USD	2016-10-01 16:35:17.911-07	2016-10-01 16:35:17.911-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	07c91ea8-acd4-4942-9cfd-c48cebb9daef	740	848
69	CREDIT	Donation to WWCode Mexico City	500	MXN	2016-02-02 08:52:02.237-08	2016-04-16 13:40:58.703-07	10	80	42	\N	\N	68	1	2	16	USD	18.5100000000000016	27	148	\N	26a163a5-8959-4ab4-bef5-3d07360183e6	775	848
2310	CREDIT	\N	12500	USD	2016-10-06 11:36:38.382-07	2016-10-06 11:36:38.382-07	2	1438	880	\N	\N	808	625	1250	305	USD	1	12500	10320	\N	21b39b65-f892-4961-bed4-4648745d3d23	830	848
4405	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:44:22.123-08	2016-12-27 11:44:22.207-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	3407cb90-d12e-4698-ae45-68a7626be287	848	848
4407	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:48:41.246-08	2016-12-27 11:48:41.318-08	288	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0764379a-89bf-4a0b-b3cf-02ced834e7c3	848	848
4409	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:51:47.92-08	2016-12-27 11:51:48.117-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	9f8c45b8-537c-4f0f-bb8a-928b528feab2	848	848
4411	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:54:51.439-08	2016-12-27 11:54:51.679-08	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0c8ffef8-b8d3-43b7-ad21-4d41571029cd	848	848
8305	CREDIT	\N	20000	USD	2017-04-07 05:25:51.09-07	2017-04-07 05:25:51.09-07	516	3	\N	\N	\N	2393	0	0	0	USD	1	20000	20000	\N	01371a79-bfe1-455d-9fae-8901be6f2dbe	848	848
4189	CREDIT	Global Development for Meetup fee	6000	USD	2016-12-21 10:49:53.054-08	2016-12-21 10:49:53.302-08	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	54daaaa7-92d1-4072-9e26-e3664a7eddda	848	848
8308	CREDIT	VMWare foundation Donation - global development (Ramya V., Swathi U. and Anonymous) 	24750	USD	2017-04-07 09:43:42.261-07	2017-04-07 09:43:42.673-07	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27a1347b-f50e-4eb5-af41-d06f4b4bc654	848	848
7294	CREDIT	Travel Stipend for Google I/O	100000	USD	2017-03-20 08:17:43.622-07	2017-03-20 08:17:42.994-07	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	e9057982-2758-4b71-96a7-7e852f7d4a0e	848	848
4246	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 08:32:00.456-08	2016-12-23 08:32:00.622-08	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	713fdfe3-6cf7-4520-aee5-e18c6cf12071	848	848
4248	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 08:45:15.022-08	2016-12-23 08:45:15.147-08	261	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	34260b9e-5cfa-458e-9861-4b037755571a	848	848
4250	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-23 08:50:35.869-08	2016-12-23 08:50:36.131-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	7adbc52c-6996-4d28-899c-835e1561a1b0	848	848
4252	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-23 08:54:04.928-08	2016-12-23 08:54:05.055-08	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	084b10da-1bc1-4f57-84d2-3f7089d7c993	848	848
7295	CREDIT	Paypal Fees for Travel Stipend	3000	USD	2017-03-20 08:38:54.453-07	2017-03-20 08:38:53.749-07	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000	\N	fea87b26-175e-46ed-b94c-5d7bcec1778f	848	848
4280	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:37:32.49-08	2016-12-23 11:37:32.668-08	268	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	4e27357d-7c4c-43e4-b29e-773872e443e8	848	848
4282	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:40:51.309-08	2016-12-23 11:40:51.479-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	bf5087f3-ca93-402e-8c80-5383c23112a4	848	848
4284	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:48:39.526-08	2016-12-23 11:48:39.685-08	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	cc5c76d9-46e6-4435-8ec6-f0328e93c66c	848	848
4434	CREDIT	Global Development for Meetup Fee	6000	JPY	2016-12-28 08:00:53.27-08	2016-12-28 08:00:49.939-08	295	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0dfc10e6-6037-41d3-a5cd-6ba9f5471978	848	848
4435	CREDIT	Global Development for Meetup Fee	6000	CAD	2016-12-28 08:21:14.024-08	2016-12-28 08:21:10.449-08	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	06fa2587-6ff6-4229-ab30-031b2088aa97	848	848
4437	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 08:24:49.292-08	2016-12-28 08:24:45.838-08	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	1f4c7218-151d-4502-a979-3271e65d57da	848	848
4439	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 08:27:36.9-08	2016-12-28 08:27:33.309-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	23d6372f-2d2d-4cbb-afee-5a05e2ef89ce	848	848
4404	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-27 10:40:49.86-08	2016-12-27 10:40:49.921-08	286	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	84192755-dac6-4b18-996a-89fe17acc8d1	848	848
4363	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:14:47.836-08	2016-12-27 08:14:47.951-08	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	e496c717-ce4a-41a6-b861-8eae2c81db9c	848	848
4365	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:22:09.234-08	2016-12-27 08:22:09.351-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	88c4ac88-4f6e-40d9-8cdb-5eee6e9a9dee	848	848
4367	CREDIT	Global Development for Meetup Fee	6000	INR	2016-12-27 08:24:37.915-08	2016-12-27 08:24:38.038-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	c54c243c-29a5-4006-b821-adc4d3a389ee	848	848
4368	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:30:02.12-08	2016-12-27 08:30:02.272-08	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	69ec7f71-fdf4-4fc1-a013-bcdf6353b94c	848	848
4389	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 09:48:49.207-08	2016-12-27 09:48:49.297-08	280	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	076d787a-dbfb-4781-b854-e3cd9da444ec	848	848
4391	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-27 09:52:16.09-08	2016-12-27 09:52:16.167-08	281	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6f001acd-c75e-4d02-a339-faede0477c42	848	848
4393	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 09:56:03.911-08	2016-12-27 09:56:03.985-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	910351cc-fb5f-43ea-bccb-fa3a211093a7	848	848
4395	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 09:59:52.939-08	2016-12-27 09:59:53.047-08	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	52f1331f-b669-4782-b63a-984ccb097928	848	848
4397	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-27 10:10:14.864-08	2016-12-27 10:10:14.928-08	283	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	\N	f09463dc-da20-4c6a-95fc-b96c106b3d00	848	848
4400	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 10:33:56.275-08	2016-12-27 10:33:56.372-08	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	2f11fdfd-c8b2-4a58-8669-76610d85ac20	848	848
4402	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 10:37:31.611-08	2016-12-27 10:37:31.721-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	4d7adb92-d878-4a73-9f39-2c1f66559ba7	848	848
4426	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 07:46:26.348-08	2016-12-28 07:46:22.824-08	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	549184b8-9951-44b3-804f-5306177e8ec1	848	848
4428	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 07:51:42.465-08	2016-12-28 07:51:38.84-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6ed65fc3-0248-4071-bdbd-1a43018a5a2e	848	848
4430	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-28 07:55:25.022-08	2016-12-28 07:55:21.475-08	297	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	1fa71cb1-e48d-4b0c-b102-30d66d120a1e	848	848
4432	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 07:57:55.359-08	2016-12-28 07:57:51.831-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0deb855b-d632-43c8-a2e3-f90f0db86bb4	848	848
673	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	50000	USD	2016-05-26 13:48:43.015-07	2016-05-26 13:48:43.336-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	93c08587-c4fb-4077-9f65-00b8920ce72e	848	848
9848	CREDIT	\N	16563	EUR	2017-05-08 08:30:18.585-07	2017-05-08 08:30:18.585-07	301	3	\N	\N	\N	2741	0	0	0	EUR	1	16563	16563	\N	04ec7dd9-0032-4318-99fa-52e21ff493ee	848	848
7374	CREDIT	Leadership Development: Google I/O grant for Luisa M.	100000	USD	2017-03-22 10:56:10.528-07	2017-03-22 10:56:10.804-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	\N	100000	\N	3144121e-26df-4745-84f9-51b0af25530c	848	848
5022	CREDIT	WWCode t-shirt sales	1106	USD	2017-01-17 19:29:09.407-08	2017-01-17 19:29:09.561-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1106	\N	ee1df537-bb8d-44e0-ada4-42c56888c466	848	848
5023	CREDIT	WWCode t-shirt sales	1964	USD	2017-01-17 19:29:40.155-08	2017-01-17 19:29:40.284-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1964	\N	6dc8501e-0ceb-40ab-b920-9dc4d4de6ce3	848	848
5024	CREDIT	WWCode t-shirt sales	982	USD	2017-01-17 19:30:10.748-08	2017-01-17 19:30:10.906-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	982	\N	35f3b1a6-7368-418d-9a03-f1da4b5de91f	848	848
5025	CREDIT	WWCode t-shirt sales	2778	USD	2017-01-17 19:30:54.132-08	2017-01-17 19:30:54.465-08	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2778	\N	bf1209ff-a6ec-4161-8120-65342983d214	848	848
5026	CREDIT	WWCode t-shirt sales	4742	USD	2017-01-17 19:31:50.631-08	2017-01-17 19:31:50.774-08	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4742	\N	971f4ef3-3672-4497-8b8e-863c2c187206	848	848
5027	CREDIT	WWCode t-shirt sales	1389	USD	2017-01-17 19:32:30.654-08	2017-01-17 19:32:30.825-08	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1389	\N	166cbb4b-156f-4b77-84d3-a7b2bba53d7f	848	848
5028	CREDIT	WWCode t-shirt sales	2371	USD	2017-01-17 19:33:30.061-08	2017-01-17 19:33:30.587-08	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2371	\N	480c104e-d92f-4c75-8e48-a396ffb0172a	848	848
5029	CREDIT	WWCode t-shirt sales	7570	USD	2017-01-17 19:34:31.424-08	2017-01-17 19:34:31.75-08	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7570	\N	98fcd6a4-bf53-4bc0-8277-7935794a138b	848	848
9879	CREDIT	\N	84000	USD	2017-05-09 11:14:23.283-07	2017-05-09 11:14:23.283-07	2	4720	2860	\N	\N	2755	4200	8400	1878	USD	1	84000	69522	\N	254136b6-233d-4361-9aa2-ceddc7305fe8	697	848
8398	CREDIT	\N	25000	USD	2017-04-10 18:09:50.621-07	2017-04-10 18:09:50.621-07	13	4153	2535	\N	\N	2421	1250	2500	580	USD	1	25000	20670	\N	d4c8f44d-4c88-4533-87da-1bd5b6f1f16b	701	848
857	CREDIT	Recurring subscription	100	USD	2016-06-09 10:28:30.802-07	2016-06-09 10:28:30.841-07	3	8	385	\N	\N	320	5	10	33	USD	1	100	52	\N	78157dc7-3c5e-4ff2-a9ce-819906bd27fc	724	848
4586	CREDIT	Recurring subscription	1000	USD	2017-01-01 15:32:21.416-08	2017-01-01 15:32:21.416-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	630da817-bfc6-4c3e-8ef4-45d11c81e37e	740	848
8365	CREDIT	monthly recurring subscription	1000	USD	2017-04-09 21:43:06.965-07	2017-04-09 21:43:06.965-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	a25de37e-df40-4317-90a5-36e217a8ba46	806	848
4793	CREDIT	Recurring subscription	1000	USD	2017-01-09 20:43:19.956-08	2017-01-09 20:43:19.956-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	2c128b7c-932b-47b7-af1a-311fa87351de	806	848
9863	CREDIT	\N	1000	USD	2017-05-08 22:59:15.573-07	2017-05-08 22:59:15.573-07	517	4711	2855	\N	\N	2750	50	100	52	USD	1	1000	798	\N	e3494f7e-351e-478a-937b-32ca9c60513f	832	848
5031	CREDIT	Donation via meetup	775	USD	2017-01-17 19:48:10.558-08	2017-01-17 19:48:10.699-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	060c2bcb-850a-442e-96a3-907124fbb5e6	848	848
5750	CREDIT	Donations - Fees 	17328	USD	2017-02-06 12:06:15.502-08	2017-02-06 12:06:15.622-08	2	3	\N	2017-02-05 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	173	\N	3bda2f71-4a09-4f4d-9ba9-4d52bdcd10a5	848	848
5751	CREDIT	Taipei Donation - fees and global development	800	USD	2017-02-06 12:11:26.406-08	2017-02-06 12:11:26.522-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	7de04ec6-4f91-4e9f-a7e1-f3ccc020cacc	848	848
5277	CREDIT	Global Network Development	500000	USD	2017-01-25 10:27:46.907-08	2017-01-25 10:27:47.421-08	51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500000	\N	54b79a9d-1205-4d4c-aa91-534fa732fefb	848	848
5754	CREDIT	Donation - fees	800	USD	2017-02-06 14:10:44.604-08	2017-02-06 14:10:44.763-08	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	2628a845-d10d-4426-8c12-14dba874aae2	848	848
5755	CREDIT	Gitlab - transaction and global development	41400	USD	2017-02-06 14:12:42.534-08	2017-02-06 14:12:42.684-08	48	3	\N	2017-02-05 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	414	\N	ef68d68b-3fdf-4a96-951d-ac953118ce75	848	848
5763	CREDIT	Donations via meetup - fees/global development	2000	USD	2017-02-06 14:56:24.306-08	2017-02-06 14:56:24.52-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	96e04578-a558-4d24-a5d5-14d1b469f341	848	848
5764	CREDIT	Donations via meetup - fees	1200	USD	2017-02-06 14:58:38.922-08	2017-02-06 14:58:39.29-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	2b8aeffe-03c4-493a-a5aa-a8733db5860d	848	848
5948	CREDIT	Macy's donation - fees and global development	435000	USD	2017-02-13 16:21:10.361-08	2017-02-13 16:21:10.558-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	435000	\N	31a781ff-5d17-4026-96c3-a5134a2aff92	848	848
9385	CREDIT	\N	154800	USD	2017-05-01 11:02:20.511-07	2017-05-01 11:02:20.511-07	13	3	\N	\N	\N	2649	0	0	0	USD	1	154800	154800	\N	557379b2-4691-47ed-b4bc-30b67a70bcf1	848	848
7511	CREDIT	Leadership Development: Google I/O travel grant for Gen A. 	85000	USD	2017-03-27 06:25:14.008-07	2017-03-27 06:25:14.169-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	85000	\N	7092cdf1-407a-4c49-bddd-4729693bb136	848	848
9943	CREDIT	\N	90000	USD	2017-05-11 09:41:16.759-07	2017-05-11 09:41:16.759-07	59	3	\N	\N	\N	2794	0	0	0	USD	1	90000	90000	\N	97b3a399-75b9-4ed4-b244-db56f1e2cac0	848	848
7518	CREDIT	\N	50000	USD	2017-03-27 10:10:04.622-07	2017-03-27 10:10:04.622-07	12	3	\N	\N	\N	2151	0	0	0	USD	1	50000	50000	\N	9c3381f8-416c-44f2-8e0a-a9d37855a5fe	848	848
6733	CREDIT	Event sponsorship - transaction fees and global development 	856500	USD	2017-03-01 22:00:43.46-08	2017-03-01 22:00:44.182-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	856500	\N	7fef39d1-1059-4a44-94f9-5da063341c94	848	848
7523	CREDIT	\N	20000	USD	2017-03-27 10:45:17.58-07	2017-03-27 10:45:17.58-07	59	3	\N	\N	\N	2152	0	0	0	USD	1	20000	20000	\N	21139f0a-dcfa-4a47-90cd-bdf239e2cbcb	848	848
7525	CREDIT	\N	100000	USD	2017-03-27 10:52:38.123-07	2017-03-27 10:52:38.123-07	277	3	\N	\N	\N	2153	0	0	0	USD	1	100000	100000	\N	5fd1044d-b479-447e-bfb5-e6f578c69921	848	848
2337	CREDIT	Quotient Hackathon support	90000	USD	2016-10-07 12:52:59.206-07	2016-10-07 12:52:59.391-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90000	\N	9790ad68-05b0-4f76-a64a-0bfb9ffb7686	848	848
7526	CREDIT	\N	100000	USD	2017-03-27 10:53:48.539-07	2017-03-27 10:53:48.539-07	277	3	\N	\N	\N	2154	0	0	0	USD	1	100000	100000	\N	79f34f13-1a21-48bc-8119-ab5cf030a034	848	848
614	CREDIT	Women Techmaker WWCode Partnership Grant	70000	USD	2016-05-19 12:17:47.24-07	2016-05-19 12:17:48.401-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	70000	\N	ddd97a2d-71eb-4643-aae4-af9a7e7fad4e	848	848
675	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	34750	USD	2016-05-26 13:50:28.413-07	2016-05-26 13:50:28.721-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34750	\N	5dc5651e-3b65-4b03-aa66-30990d7efb15	848	848
655	CREDIT	Women Techmaker WWcode Partnership Grant	100000	USD	2016-05-24 13:23:16.28-07	2016-05-24 13:23:16.552-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	1afc5e7f-3794-4830-8b96-08ce05be814a	848	848
7554	CREDIT	International Women's Day Celebrations - Global	51750	USD	2017-03-28 11:27:16.525-07	2017-03-28 11:27:16.748-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	51750	\N	f2ef8d98-6ac6-4954-bbbe-3cedd9ac7522	848	848
8605	CREDIT	\N	4000	GBP	2017-04-17 12:31:52.919-07	2017-04-17 12:31:52.919-07	267	3	\N	\N	\N	2470	0	0	0	GBP	1	4000	4000	\N	c32af448-af25-450f-9fe0-4b3c5f8345a5	848	848
8606	CREDIT	\N	9000	USD	2017-04-17 12:41:07.659-07	2017-04-17 12:41:07.659-07	277	3	\N	\N	\N	2471	0	0	0	USD	1	9000	9000	\N	58e25bdf-36bf-4707-bb32-eabd40e0558f	848	848
8608	CREDIT	\N	100000	USD	2017-04-17 13:41:37.627-07	2017-04-17 13:41:37.627-07	517	3	\N	\N	\N	2472	0	0	0	USD	1	100000	100000	\N	58ac0411-2d75-4b99-b49f-853c0659a78e	848	848
8609	CREDIT	\N	5000	USD	2017-04-17 13:41:53.602-07	2017-04-17 13:41:53.602-07	517	3	\N	\N	\N	2473	0	0	0	USD	1	5000	5000	\N	434d7fb0-0b13-4100-bcc9-38a711f799ad	848	848
8611	CREDIT	\N	85000	GBP	2017-04-17 14:05:15.067-07	2017-04-17 14:05:15.067-07	278	3	\N	\N	\N	2474	0	0	0	GBP	1	85000	85000	\N	afc6310f-79f8-4fa7-9010-33c13c3dfeec	848	848
8612	CREDIT	\N	4250	GBP	2017-04-17 14:06:54.803-07	2017-04-17 14:06:54.803-07	278	3	\N	\N	\N	2475	0	0	0	GBP	1	4250	4250	\N	cda5fd1c-4285-4631-aff6-7a4a1fb62bcb	848	848
8615	CREDIT	\N	100000	USD	2017-04-17 15:09:42.57-07	2017-04-17 15:09:42.57-07	270	3	\N	\N	\N	2477	0	0	0	USD	1	100000	100000	\N	d6795ff7-d1a1-4a77-a77b-a0731062a244	848	848
8617	CREDIT	\N	41000	GBP	2017-04-17 15:31:52.729-07	2017-04-17 15:31:52.729-07	278	3	\N	\N	\N	2486	0	0	0	GBP	1	41000	41000	\N	463ec0d3-ae29-42e5-97ee-277cca8ceca9	848	848
8619	CREDIT	\N	25000	MXN	2017-04-17 15:34:32.259-07	2017-04-17 15:34:32.259-07	511	3	\N	\N	\N	2487	0	0	0	MXN	1	25000	25000	\N	3b170ab8-edef-4461-983d-efd3689fda2c	848	848
8620	CREDIT	\N	18800	MXN	2017-04-17 15:35:06.093-07	2017-04-17 15:35:06.093-07	511	3	\N	\N	\N	2488	0	0	0	MXN	1	18800	18800	\N	72c1775e-82bb-418c-8112-0953e2c003a2	848	848
8621	CREDIT	\N	2200	MXN	2017-04-17 15:35:55.014-07	2017-04-17 15:35:55.014-07	511	3	\N	\N	\N	2489	0	0	0	MXN	1	2200	2200	\N	a30d7b67-9e28-40c1-a02c-9fd585600114	848	848
8624	CREDIT	\N	100000	USD	2017-04-17 15:40:40.357-07	2017-04-17 15:40:40.357-07	430	3	\N	\N	\N	2490	0	0	0	USD	1	100000	100000	\N	37a49008-00ca-489c-876a-6d26c25a46bb	848	848
2338	CREDIT	VMWare Network Support	195000	USD	2016-10-07 12:55:50.273-07	2016-10-07 12:55:50.509-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	195000	\N	e0aedba4-c471-4406-bc4c-480b6388a75d	848	848
8664	CREDIT	\N	3562	GBP	2017-04-18 12:41:30.286-07	2017-04-18 12:41:30.286-07	278	3	\N	\N	\N	2503	0	0	0	GBP	1	3562	3562	\N	0557cec2-bc9a-43c5-a702-38116a1ab389	848	848
8671	CREDIT	\N	1198	USD	2017-04-18 17:19:14.321-07	2017-04-18 17:19:14.321-07	12	3	\N	\N	\N	2505	0	0	0	USD	1	1198	1198	\N	ff39b4d0-ec21-448e-a987-b2cf172c5bdc	848	848
8672	CREDIT	\N	1480	USD	2017-04-18 17:20:11.527-07	2017-04-18 17:20:11.527-07	12	3	\N	\N	\N	2506	0	0	0	USD	1	1480	1480	\N	41154072-0424-4ec6-9f81-9ca8cce5420a	848	848
8673	CREDIT	\N	1400	USD	2017-04-18 17:31:31.942-07	2017-04-18 17:31:31.942-07	195	3	\N	\N	\N	2507	0	0	0	USD	1	1400	1400	\N	36ea5d6f-9e03-4116-8db7-201d91018475	848	848
7661	CREDIT	\N	50000	USD	2017-03-31 10:17:51.695-07	2017-03-31 10:17:51.695-07	2	3	\N	\N	\N	2204	0	0	0	USD	1	50000	50000	\N	fbf7dada-78ae-4886-9094-aed19838ed67	848	848
7662	CREDIT	\N	79600	GBP	2017-03-31 10:20:23.917-07	2017-03-31 10:20:23.917-07	267	3	\N	\N	\N	2206	0	0	0	GBP	1	79600	79600	\N	bd840d8c-6019-4588-bc03-94a0ae07b331	848	848
8675	CREDIT	\N	1480	USD	2017-04-18 17:39:23.15-07	2017-04-18 17:39:23.15-07	14	3	\N	\N	\N	2508	0	0	0	USD	1	1480	1480	\N	85822cfc-ab85-4318-b357-4cbff6b96682	848	848
7665	CREDIT	\N	80500	GBP	2017-03-31 10:54:33.461-07	2017-03-31 10:54:33.461-07	278	3	\N	\N	\N	2208	0	0	0	GBP	1	80500	80500	\N	d7f6d62d-4f73-400b-ac9e-57bcfac50780	848	848
7667	CREDIT	\N	39800	GBP	2017-03-31 11:01:48.418-07	2017-03-31 11:01:48.418-07	278	3	\N	\N	\N	2209	0	0	0	GBP	1	39800	39800	\N	f38d81a7-0640-43e1-adaa-eae03b43254a	848	848
7683	CREDIT	\N	100000	USD	2017-03-31 15:32:34.123-07	2017-03-31 15:32:34.123-07	286	3	\N	\N	\N	2212	0	0	0	USD	1	100000	100000	\N	ed1324c1-c55c-47b7-ac88-afc3f3ba3a7d	848	848
7686	CREDIT	\N	20000	USD	2017-03-31 15:50:23.915-07	2017-03-31 15:50:23.915-07	286	3	\N	\N	\N	2214	0	0	0	USD	1	20000	20000	\N	93ca4243-7895-4061-b20e-8d0aaaa2a3f9	848	848
7687	CREDIT	\N	7500	USD	2017-03-31 15:52:45.079-07	2017-03-31 15:52:45.079-07	286	3	\N	\N	\N	2215	0	0	0	USD	1	7500	7500	\N	a8c774d9-c22c-4df9-a8a2-7b7fb56da05c	848	848
6421	CREDIT	\N	30000	CAD	2017-02-27 16:25:20.325-08	2017-02-27 16:25:20.325-08	522	3301	2030	\N	\N	1935	1121	1120	523	USD	1.33832976445396135	22416	26301	\N	e838bae8-af91-48a1-8619-e42c8aab84c7	706	848
5533	CREDIT	\N	22500	USD	2017-02-01 07:16:20.999-08	2017-02-01 07:16:20.999-08	48	2898	1801	\N	\N	1709	1125	2250	525	USD	1	22500	18600	\N	6d643f90-fadf-4d61-bdcf-784eba7d76d1	742	848
10051	CREDIT	\N	20000	USD	2017-05-15 05:07:59.63-07	2017-05-15 05:07:59.63-07	14	4834	2922	\N	\N	2817	1000	2000	470	USD	1	20000	16530	\N	2f09aa94-9b15-47bc-8e9c-b8ab6d67d426	744	848
9357	CREDIT	\N	500	USD	2017-05-01 10:13:34.851-07	2017-05-01 10:13:34.851-07	516	4550	2757	\N	\N	2644	25	50	41	USD	1	500	384	\N	9470e412-b1bd-46f6-a497-907e6d8c9a4d	758	848
9926	CREDIT	\N	1000	CAD	2017-05-10 16:45:46.737-07	2017-05-10 16:45:46.737-07	522	4749	2888	\N	\N	2783	36	71	46	USD	1.39860139860139854	715	786	\N	52d35c0c-9b28-47ca-973a-07470814a70b	796	848
9898	CREDIT	monthly recurring subscription	1000	USD	2017-05-09 21:43:13.462-07	2017-05-09 21:43:13.462-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	96fff2b3-0c71-4009-8d16-285415e17f66	806	848
8705	CREDIT	\N	1480	USD	2017-04-19 11:18:19.043-07	2017-04-19 11:18:19.043-07	2	3	\N	\N	\N	2519	0	0	0	USD	1	1480	1480	\N	48409b35-4280-4659-971c-3ec3178252f0	848	848
8706	CREDIT	\N	40000	USD	2017-04-19 11:26:01.228-07	2017-04-19 11:26:01.228-07	3	3	\N	\N	\N	2520	0	0	0	USD	1	40000	40000	\N	5272792e-d8c4-4354-8dff-c2e24a66999a	848	848
8707	CREDIT	\N	1190	USD	2017-04-19 11:26:58.997-07	2017-04-19 11:26:58.997-07	3	3	\N	\N	\N	2521	0	0	0	USD	1	1190	1190	\N	6189157f-8088-48c0-9964-a66fe4fcfee1	848	848
8708	CREDIT	\N	610	USD	2017-04-19 11:35:03.04-07	2017-04-19 11:35:03.04-07	59	3	\N	\N	\N	2522	0	0	0	USD	1	610	610	\N	477a5aef-b895-4774-8b86-b1f5156fd8b6	848	848
9621	CREDIT	\N	2930	USD	2017-05-01 17:33:45.73-07	2017-05-01 17:33:45.73-07	3	3	\N	\N	\N	2662	0	0	0	USD	1	2930	2930	\N	08015eaa-ad1d-4dd5-9704-3de345b88094	848	848
2303	CREDIT	Network development (stickers)	58590	USD	2016-10-06 09:08:20.916-07	2016-10-06 09:08:21.09-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	58590	\N	3169934f-3f78-4faa-959d-7141ff24163b	848	848
8756	CREDIT	AJUG - Global and fees	26250	USD	2017-04-20 14:39:17.741-07	2017-04-20 14:39:18.323-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	a365b026-a438-43c2-9628-8abfa5258787	848	848
330	CREDIT	Intel Donation	100000	USD	2016-04-12 13:32:35.997-07	2016-04-16 13:40:58.826-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	925c1460-bda7-448f-8dd9-83291db33330	848	848
8728	CREDIT	\N	10000	USD	2017-04-20 03:17:23.286-07	2017-04-20 03:17:23.286-07	59	4348	2643	\N	\N	2532	500	1000	350	USD	1	10000	8150	\N	04384e27-0f6b-407a-a8d1-e8353f9a4c98	703	848
1391	CREDIT	Donation to WWCode Austin	150000	USD	2016-08-01 08:54:14.382-07	2016-08-01 08:54:14.468-07	2	883	561	\N	\N	488	7500	15000	3330	USD	1	150000	124170	\N	0577aa52-6ea8-4268-9559-de120c9fd743	704	848
449	CREDIT	Donation to WWCode Washington DC	50000	USD	2016-04-28 08:01:17.801-07	2016-04-28 08:01:17.846-07	13	283	213	\N	\N	181	2500	5000	1480	USD	1	50000	41020	\N	d7208bd6-4f00-4c5d-b85e-3792419450d5	719	848
337	CREDIT	Donation to WWCode Austin	20000	USD	2016-04-13 09:46:10.463-07	2016-04-16 13:40:58.845-07	2	224	173	\N	\N	153	1000	2000	610	USD	1	20000	16390	\N	07e21011-0879-4523-b624-073fdfd704c3	723	848
290	CREDIT	Recurring subscription	100	USD	2016-04-02 19:02:46.616-07	2016-04-16 13:40:58.82-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	3464d1b8-8be5-451a-bee5-fd4129ac6455	724	848
3471	CREDIT	\N	4000	USD	2016-11-28 07:33:14.428-08	2016-11-28 07:33:14.428-08	2	1890	1249	\N	\N	1167	200	400	118	USD	1	4000	3282	\N	52c746a4-eba7-4a0f-963c-e6e2e3f22f53	733	848
1461	CREDIT	Donation to WWCode Austin	150000	USD	2016-08-05 13:48:08.414-07	2016-08-05 13:48:08.458-07	2	192	589	\N	\N	513	7500	15000	5250	USD	1	150000	122250	\N	3cd012ba-7cbf-4008-b0db-7a4b51a0d7df	738	848
9595	CREDIT	monthly recurring subscription	1000	USD	2017-05-01 16:34:11.708-07	2017-05-01 16:34:11.708-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	c70f2fd8-da04-4f99-97a1-72c05a99dfa1	740	848
1080	CREDIT	Recurring subscription	1000	USD	2016-07-01 15:38:37.594-07	2016-07-01 15:38:37.617-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	d414ca78-a0ca-4706-8533-c9f54acba200	740	848
1395	CREDIT	Recurring subscription	1000	USD	2016-08-01 16:35:39.219-07	2016-08-01 16:35:39.244-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	9056ebd9-568b-47c4-ba61-a4830e554a1c	740	848
1792	CREDIT	Recurring subscription	1000	USD	2016-09-01 16:32:42.475-07	2016-09-01 16:32:42.475-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	f8a6849c-0a33-4c9a-b04f-a5f96d063bfc	740	848
2887	CREDIT	Recurring subscription	1000	USD	2016-11-01 16:32:30.439-07	2016-11-01 16:32:30.439-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	103586f6-637d-4a72-87bc-a5f247e540e6	740	848
478	CREDIT	Donation to WWCode Austin	150000	USD	2016-05-03 06:07:28.39-07	2016-05-03 06:07:28.452-07	2	308	230	\N	\N	191	7500	15000	4380	USD	1	150000	123120	\N	31bd69fa-cc92-405a-a116-d31a2a40d4d1	745	848
2055	CREDIT	\N	25000	USD	2016-09-22 18:07:09.492-07	2016-09-22 18:07:09.492-07	59	1263	790	\N	\N	700	1250	2500	580	USD	1	25000	20670	\N	c037d2a1-7fa4-4875-b084-2c8d7605d567	752	848
2143	CREDIT	\N	19000	USD	2016-09-28 14:47:18.302-07	2016-09-28 14:47:18.302-07	2	1299	842	\N	\N	768	950	1900	665	USD	1	19000	15485	\N	c4585b37-a213-4c1c-ba1f-8b9a0a9e3793	748	848
986	CREDIT	Donation to WWCode Twin Cities	100	USD	2016-06-21 09:06:05.517-07	2016-06-21 09:06:05.626-07	48	642	432	\N	\N	361	5	10	32	USD	1	100	53	\N	44e3ee1d-5777-4ea7-9dfb-e651db755946	768	848
984	CREDIT	Donation to WWCode Atlanta	100	USD	2016-06-21 09:02:56.072-07	2016-06-21 09:02:56.13-07	12	642	430	\N	\N	359	5	10	32	USD	1	100	53	\N	fdf511fc-d0e4-4322-aa0a-49ebacbb1e08	768	848
1392	CREDIT	Donation to WWCode Austin	20000	USD	2016-08-01 08:55:27.083-07	2016-08-01 08:55:27.184-07	2	884	562	\N	\N	489	1000	2000	470	USD	1	20000	16530	\N	c0b172e7-1ce8-45a7-a51d-5c1098baeeb8	793	848
645	CREDIT	Donation to WWCode Austin	50000	USD	2016-05-23 13:27:28.524-07	2016-05-23 13:27:28.599-07	2	426	306	\N	\N	258	2500	5000	1480	USD	1	50000	41020	\N	f63c7344-8631-43e0-8d56-70bf3f01998c	802	848
1884	CREDIT	Recurring subscription	1000	USD	2016-09-09 20:42:56.392-07	2016-09-09 20:42:56.392-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	a73ee6ae-c18d-406f-a24b-4c04f218c3e3	806	848
2370	CREDIT	Recurring subscription	1000	USD	2016-10-09 21:49:33.558-07	2016-10-09 21:49:33.558-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	270aedde-c9b9-4d4d-b0b2-c79795f17316	806	848
3056	CREDIT	Recurring subscription	1000	USD	2016-11-09 20:43:57.271-08	2016-11-09 20:43:57.271-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	00ceec95-2161-4179-acba-658bcc889e16	806	848
3886	CREDIT	Recurring subscription	1000	USD	2016-12-09 20:43:00.244-08	2016-12-09 20:43:00.244-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	3a1a2d26-2613-4c61-bb5f-a9fc2f3beffb	806	848
1787	CREDIT	\N	200000	USD	2016-09-01 07:41:36.24-07	2016-09-01 07:41:36.24-07	2	1094	707	\N	\N	622	10000	20000	4430	USD	1	200000	165570	\N	b7a1007d-6e00-4764-b983-c9d27abc2296	805	848
616	CREDIT	Donation to WWCode Austin	50000	USD	2016-05-19 12:24:43.134-07	2016-05-19 12:24:43.182-07	2	392	288	\N	\N	246	2500	5000	1480	USD	1	50000	41020	\N	4590ecf9-25b0-4935-9570-12af202cc187	825	848
3590	CREDIT	\N	20000	USD	2016-11-30 08:11:42.049-08	2016-11-30 08:11:42.049-08	2	1957	1296	\N	\N	1215	1000	2000	470	USD	1	20000	16530	\N	a7479297-dc89-46e1-bbdb-c34a5e6bd385	833	848
2336	CREDIT	\N	2500	USD	2016-10-07 09:49:19.978-07	2016-10-07 09:49:19.978-07	241	1446	884	\N	\N	812	125	250	85	USD	1	2500	2040	\N	2ac309ea-89ad-4880-b72a-67054d83865d	831	848
3199	CREDIT	\N	50000	USD	2016-11-17 09:43:29.797-08	2016-11-17 09:43:29.797-08	59	1808	1179	\N	\N	1098	2500	5000	1130	USD	1	50000	41370	\N	2d80d646-083c-4910-a320-cda0edc1cb3b	835	848
3490	CREDIT	\N	25000	EUR	2016-11-29 02:03:23.71-08	2016-11-29 02:03:23.71-08	301	1908	1257	\N	\N	1175	1301	2601	910	USD	0.961057932572175422	26013	20375	\N	49c565db-0a28-4269-8164-4c0ac9a96fe3	836	848
3320	CREDIT	\N	30000	USD	2016-11-22 07:22:39.097-08	2016-11-22 07:22:39.097-08	59	1846	1211	\N	\N	1129	1500	3000	1050	USD	1	30000	24450	\N	3413acd7-804a-4bc1-9689-e91da23b2bdc	842	848
4123	CREDIT	\N	2500	USD	2016-12-18 17:41:29.006-08	2016-12-18 17:41:29.006-08	259	2220	1471	\N	\N	1388	125	250	85	USD	1	2500	2040	\N	c13eb052-de5b-4e23-b45b-e405f937cfd7	844	848
5019	CREDIT	WWCode t-shirt sales	1229	USD	2017-01-17 19:23:59.112-08	2017-01-17 19:23:59.247-08	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1229	\N	a43c6a3d-406e-43de-98bb-0e151a1b8fea	848	848
5020	CREDIT	WWCode t-shirt sales	982	USD	2017-01-17 19:24:31.362-08	2017-01-17 19:24:31.504-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	982	\N	e22d04c4-f74f-4484-a0b3-9007b55c94a8	848	848
5861	CREDIT	\N	84241	USD	2017-02-10 08:47:34.349-08	2017-02-10 08:47:34.349-08	15	3053	1890	\N	\N	1801	4212	8424	1883	USD	1	84241	69722	\N	fc5a47be-5fc1-4a9a-bc52-978334aa0481	705	848
4779	CREDIT	Recurring subscription	100	USD	2017-01-09 10:28:29.701-08	2017-01-09 10:28:29.701-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	410d7ba2-bc7c-4acf-9ad8-182b43caacd4	724	848
5838	CREDIT	monthly recurring subscription	100	USD	2017-02-09 10:29:30.017-08	2017-02-09 10:29:30.017-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	5c8b0763-ddec-4adc-a069-ad809703c9dd	724	848
5578	CREDIT	monthly recurring subscription	1000	USD	2017-02-01 15:34:44.326-08	2017-02-01 15:34:44.326-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	5a54016f-f69c-49ef-8d2f-f03740ca539c	740	848
6709	CREDIT	monthly recurring subscription	1000	USD	2017-03-01 15:40:00.024-08	2017-03-01 15:40:00.024-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	71e7d3cd-cd4b-465b-a6d1-a0242bb22558	740	848
6700	CREDIT	\N	25000	USD	2017-03-01 14:51:20.759-08	2017-03-01 14:51:20.759-08	59	1263	2048	\N	\N	1953	1250	2500	580	USD	1	25000	20670	\N	bd4cecda-d52c-4c14-9ffa-5831f212eb3f	752	848
4899	CREDIT	Recurring subscription	1000	USD	2017-01-14 09:12:01.244-08	2017-01-14 09:12:01.244-08	270	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	798	\N	63e320d2-5114-4fc3-8daa-8c636b663d98	781	848
5852	CREDIT	monthly recurring subscription	1000	USD	2017-02-09 20:43:49.515-08	2017-02-09 20:43:49.515-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	86ad6819-a20f-4543-a31c-0e1a121bb79f	806	848
4655	CREDIT	\N	20000	USD	2017-01-03 12:59:37.749-08	2017-01-03 12:59:37.749-08	2	2416	1553	\N	\N	1466	1000	2000	470	USD	1	20000	16530	\N	9d9ae433-8160-4ad4-abba-284759515132	834	848
4957	CREDIT	\N	50000	USD	2017-01-16 10:03:56.108-08	2017-01-16 10:03:56.108-08	48	2561	1622	\N	\N	1537	2500	5000	1130	USD	1	50000	41370	\N	b7c440d2-8682-4b57-93b6-3d3dd3cfed88	843	848
4124	CREDIT	\N	2500	USD	2016-12-18 17:42:01.104-08	2016-12-18 17:42:01.104-08	259	2220	1472	2016-12-27 16:00:00-08	\N	1389	125	250	85	USD	1	2500	2040	\N	3290a890-4996-4581-a0b7-6db14e41f5a8	844	848
5044	CREDIT	\N	10000	USD	2017-01-18 05:54:50.597-08	2017-01-18 05:54:50.597-08	48	2594	1647	\N	\N	1557	500	1000	250	USD	1	10000	8250	\N	629c628a-29cb-4690-b71e-ad06f390ea21	846	848
132	CREDIT	Recurring subscription	100	USD	2016-03-02 16:24:57.083-08	2016-04-16 13:40:58.834-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	3a77dd06-45f7-43cd-94e3-dffec6785c2b	688	848
78	CREDIT	Donation to WWCode Washington DC	100	USD	2016-02-02 15:09:05.702-08	2016-04-16 13:40:58.699-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	24dc1b5d-5ff4-456c-9765-3306cc4ce7bc	688	848
104	CREDIT	Recurring subscription	500	USD	2016-02-18 17:11:10.784-08	2016-04-16 13:40:58.716-07	10	2	34	\N	\N	65	25	50	45	USD	1	500	380	\N	c7a4ed19-aed5-411a-a5a9-72a1296ba3d3	688	848
289	CREDIT	Recurring subscription	100	USD	2016-04-02 18:49:19.352-07	2016-04-16 13:40:58.819-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	8ba471ba-ec4f-4181-a1d0-f1c2b029194d	688	848
130	CREDIT	Donation to WWCode Austin	30000	USD	2016-03-02 13:31:50.516-08	2016-04-16 13:40:58.67-07	2	129	94	\N	\N	25	0	3000	900	USD	1	30000	26100	\N	00dfdd70-caa9-4d07-9a89-7157a9464d5c	689	848
43	CREDIT	Donation to WWCode Mexico City	500	USD	2016-01-18 15:54:06.439-08	2016-04-16 13:40:58.672-07	10	2	34	\N	\N	65	25	50	45	USD	1	500	380	\N	c9a65b3a-a9bd-40b3-a806-ec5d4a273187	688	848
475	CREDIT	Recurring subscription	100	USD	2016-05-02 17:15:49.65-07	2016-05-02 17:15:49.711-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	5ed9ac7d-2cbb-49b4-8eb0-35a8a50396b5	688	848
469	CREDIT	Recurring subscription	100	USD	2016-05-02 10:46:41.832-07	2016-05-02 10:46:41.894-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	eb45eaa9-743d-437f-a0df-986c0842d91d	691	848
129	CREDIT	Recurring subscription	100	USD	2016-03-02 10:26:05.731-08	2016-04-16 13:40:58.833-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	73f453a9-ae3a-4ca9-82e9-cc61d3644969	691	848
74	CREDIT	Donation to WWCode Washington DC	100	USD	2016-02-02 09:09:22.069-08	2016-04-16 13:40:58.697-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	86ca72b0-3163-400d-83e1-e17d7f182d7e	691	848
66	CREDIT	Donation to WWCode Atlanta	1000	USD	2016-01-29 14:23:53.315-08	2016-04-16 13:40:58.701-07	12	30	39	\N	\N	13	0	50	59	USD	1	1000	891	\N	03ad4ae8-f8d6-4d38-88d8-d6ebf43650b9	691	848
128	CREDIT	Recurring subscription	100	USD	2016-03-02 10:19:33.362-08	2016-04-16 13:40:58.737-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	9b592cfc-6e21-487e-9471-b7491af84c89	691	848
281	CREDIT	Recurring subscription	100	USD	2016-04-02 12:27:54.641-07	2016-04-16 13:40:58.809-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	09102f53-5640-469e-8568-f546e4636908	691	848
278	CREDIT	Recurring subscription	100	USD	2016-04-02 11:13:51.122-07	2016-04-16 13:40:58.81-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	f2a2c11a-e7c9-4578-8401-fb4e1d15e22a	691	848
280	CREDIT	Recurring subscription	100	USD	2016-04-02 12:09:44.502-07	2016-04-16 13:40:58.811-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	de316074-f0f1-41f4-bd2d-502dbfeceeae	691	848
70	CREDIT	Donation to WWCode Washington DC	100	USD	2016-02-02 09:04:56.247-08	2016-04-16 13:40:58.698-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	bedf3c7c-2d98-43a2-b73b-761b68cd2b0c	691	848
126	CREDIT	Recurring subscription	100	USD	2016-03-02 09:53:54.346-08	2016-04-16 13:40:58.736-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	f7a13ef8-2a57-4e4b-99f1-3a016d405ebf	691	848
68	CREDIT	Donation to WWCode Seattle	100	USD	2016-02-02 08:36:38.327-08	2016-04-16 13:40:58.702-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	74fb2375-fab0-436c-8f56-5051ee3c26ad	691	848
470	CREDIT	Recurring subscription	100	USD	2016-05-02 11:10:42.774-07	2016-05-02 11:10:42.847-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	f99307f9-7e49-4414-a2cf-c69326ceb1c4	691	848
472	CREDIT	Recurring subscription	100	USD	2016-05-02 11:15:35.25-07	2016-05-02 11:15:35.307-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	89fe586a-cc2d-4bbe-9781-196390e19e37	691	848
7913	CREDIT	monthly recurring subscription	2500	USD	2017-04-01 11:31:19.231-07	2017-04-01 11:31:19.231-07	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	50d19e33-e65e-4c4f-b3bc-851253fdfda5	692	848
9408	CREDIT	monthly recurring subscription	2500	USD	2017-05-01 11:32:00.085-07	2017-05-01 11:32:00.085-07	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	2fcb187e-35f4-4735-9101-698ea41ab1aa	692	848
5540	CREDIT	\N	2500	USD	2017-02-01 09:30:48.467-08	2017-02-01 09:30:48.467-08	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	a88cbaf9-3c16-494f-9fb9-1ff207e24d4a	692	848
6649	CREDIT	monthly recurring subscription	2500	USD	2017-03-01 10:37:53.591-08	2017-03-01 10:37:53.591-08	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	ec153d42-d2ae-4d56-a4aa-f223962a4ca2	692	848
8427	CREDIT	\N	2500	USD	2017-04-11 19:05:36.032-07	2017-04-11 19:05:36.032-07	13	4173	2546	\N	\N	2430	125	250	85	USD	1	2500	2040	\N	b9bf7bb6-c80e-4b7f-8729-f2e26f39f5e9	693	848
8350	CREDIT	monthly recurring subscription	100	USD	2017-04-09 11:28:49.104-07	2017-04-09 11:28:49.104-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	1ecffc14-65af-42e5-933f-1520f76d4685	724	848
1587	DEBIT	STEM Toys for Coding with Kids Event	-8496	USD	2016-08-16 07:58:01.764-07	2016-08-16 07:58:01.789-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-8496	294	bd8d9663-a174-448f-94f5-5e6707eb538d	848	848
1588	DEBIT	STEM Toys for Coding with Kids Event	-10212	USD	2016-08-16 07:58:32.03-07	2016-08-16 07:58:32.041-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10212	293	40c6d6e9-1a20-4f97-b460-2a318d202796	848	848
1628	DEBIT	Marketing and communications materials for leadership team. 	-4264	USD	2016-08-19 10:25:04.062-07	2016-08-19 10:25:04.374-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4264	\N	fa3527b7-d566-447a-a671-3b80486e9c18	848	848
376	DEBIT	Global Development	-250	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-250	96	ee258704-7659-4305-bd34-807117acf1d4	848	848
2238	DEBIT	90/10 split: Turner matching donation	-500	USD	2016-10-04 09:06:02.036-07	2016-10-04 09:06:02.036-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	393	9fcd3132-9867-42dc-85ce-b7435cb35563	848	848
2239	DEBIT	90/10 split: Beth Laing	-500	USD	2016-10-04 09:06:09.85-07	2016-10-04 09:06:09.85-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	391	63e96179-a81b-4fba-880f-bc5d5a9f9e51	848	848
2424	DEBIT	Career development event w/ Mike Ross	-65000	USD	2016-10-11 17:42:04.584-07	2016-10-11 17:42:04.834-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-65000	\N	e4ad5f18-a923-47eb-a3e1-601e2ba3238f	848	848
2403	DEBIT	Network Budget pre Open Collective	-11797	USD	2016-10-11 09:52:07.045-07	2016-10-11 09:52:07.303-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11797	\N	60fedebe-23fa-46fa-bf34-3b63869f1e51	848	848
2821	DEBIT	Wine	-1647	USD	2016-10-31 14:15:06.269-07	2016-10-31 14:15:06.517-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1647	\N	a1c67931-46a2-4a0a-9012-60f032d6d69e	848	848
2822	DEBIT	Sodas for ATXDivHack 	-3871	USD	2016-10-31 14:15:22.809-07	2016-10-31 14:15:22.98-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3871	\N	b31858ae-48a6-4dc9-a6e5-5c86bb6e6988	848	848
2824	DEBIT	05-21-16 AI workshop	-30000	USD	2016-10-31 14:16:09.23-07	2016-10-31 14:16:09.38-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-30000	186	1bcc20eb-8879-4cb4-834e-a2a7841a6419	848	848
2537	DEBIT	Director t-shirt	-3186	USD	2016-10-17 13:58:31.776-07	2016-10-17 13:58:31.789-07	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3186	\N	07e896c6-1747-42c3-ac92-ea9abc902e44	848	848
3530	DEBIT	Regional Leadership Director Training	-631	USD	2016-11-29 14:38:46.551-08	2016-11-29 14:38:46.748-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-631	\N	fb0cd838-a20f-4a38-ad81-e738867085b8	848	848
3829	DEBIT	Leadership Tshirt Order	-2698	USD	2016-12-07 08:51:43.784-08	2016-12-07 08:51:44.214-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2698	\N	1e99a559-2e7a-4e3d-be43-7fa857afba90	848	848
2328	DEBIT	Conference stipend Olivia F.	-39585	GBP	2016-10-07 06:35:08.613-07	2016-10-07 06:35:08.724-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-39585	\N	46f8b259-603b-459f-a2b6-c72ed0c247b7	848	848
4377	DEBIT	Meetup Fee	-6000	USD	2016-12-27 08:52:46.242-08	2016-12-27 08:52:46.242-08	274	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	640	edf1e7f7-4ad5-40bc-a2f2-e83febc89c03	848	848
2811	DEBIT	May AI Workshop	-26800	USD	2016-10-31 14:10:54.112-07	2016-10-31 14:10:54.327-07	2	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-26800	452	db3e939f-96e8-4790-bba4-e8a8a33ac1b2	848	848
2812	DEBIT	June South Hack Night	-20568	USD	2016-10-31 14:11:20.573-07	2016-10-31 14:11:20.753-07	2	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20568	451	540d3476-03f3-4c01-9191-0b4593c34fd4	848	848
9747	DEBIT	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	-101200	USD	2017-05-04 12:06:09.002-07	2017-05-04 12:06:09.002-07	430	3	\N	\N	\N	\N	\N	\N	0	USD	1	-101200	-101200	1099	796b8ada-4bee-4687-a76e-d3f79e5030cb	848	848
329	DEBIT	Meetup Donation Transaction Fee	-163	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-163	81	6fb44ff1-4646-411e-ac08-543d20851f57	848	848
369	DEBIT	Stacey Schipper Reimbursement	-2322	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.873-07	15	3	\N	2016-06-14 11:14:22.471-07	\N	\N	\N	\N	\N	\N	\N	\N	-2322	92	570c1e94-beca-4a11-b728-e574dfead3e1	848	848
569	DEBIT	Conference Grant	-50000	MXN	2016-05-16 07:49:37.27-07	2016-06-14 11:14:22.052-07	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	164	0076bcbc-8e3e-4830-87c4-d396f2cdf087	848	848
668	DEBIT	Leadership Tools (director tees)	-2698	USD	2015-12-14 16:00:00-08	2016-06-14 11:14:22.114-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2698	192	f90b7ceb-7395-4eb6-b70e-aa3b53a18421	848	848
865	DEBIT	Reimburse Caterina Paun for supplies and mailing expenses	-5504	USD	2015-12-14 16:00:00-08	2016-06-14 11:14:22.175-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5504	225	391f2946-af6d-4dad-9a31-43496d058bb4	848	848
1954	DEBIT	Event food	-2911	USD	2016-09-15 17:09:43.149-07	2016-09-15 17:09:43.531-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2911	345	86b66e81-a6ce-436d-9ea0-161fa976ce9d	848	848
1577	DEBIT	Food for Denver Meetup	-9939	USD	2016-08-16 07:52:04.669-07	2016-08-16 07:52:04.682-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9939	\N	eacc72ec-714e-4065-adde-f3d1cf5e4c95	848	848
1575	DEBIT	Minimum Fee - June	-995	USD	2016-08-16 07:51:24.796-07	2016-08-16 07:51:24.811-07	12	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-995	\N	fc97ec24-7b82-4bd3-9b1a-fa6467d7a0b3	848	848
1578	DEBIT	Pizza for July monthly event.	-12555	USD	2016-08-16 07:52:47.781-07	2016-08-16 07:52:47.799-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-12555	\N	826070d5-3387-42cf-a309-b25b59fd86b1	848	848
1579	DEBIT	Minimum fee - May	-990	USD	2016-08-16 07:53:06.001-07	2016-08-16 07:53:06.015-07	13	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-990	\N	934eda05-b122-4c9e-8b1a-097bfb4018d7	848	848
1631	DEBIT	Coding books for our study groups (Humble Bundle -- Joy of Coding)	-1500	USD	2016-08-19 13:58:54.527-07	2016-08-19 13:58:54.67-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1500	318	0b0b7cb8-20eb-4ed8-b5eb-d5db91b35e38	848	848
331	DEBIT	Global Development	-10000	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	80	4bb6798b-e4d6-46aa-a5c3-2d0644c040c9	848	848
1921	DEBIT	Event food	-3224	USD	2016-09-13 07:57:04.698-07	2016-09-13 07:57:05.111-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3224	346	5c624478-95c6-4d37-94e1-3d7ffe3895bd	848	848
2110	DEBIT	Two VR headsets for our AR/VR event at Best Buy.	-4898	USD	2016-09-27 12:31:43.164-07	2016-09-27 12:31:43.42-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4898	366	20ddc19e-87b3-4e08-9648-4ae868f40fe9	848	848
2111	DEBIT	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	-2500	USD	2016-09-27 12:33:54.08-07	2016-09-27 12:33:54.272-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2500	367	4593d1b5-cc34-42f2-9f9a-00a5e0bb8366	848	848
2261	DEBIT	Beverage for Denver June meetup	-2279	USD	2016-10-04 15:09:25.159-07	2016-10-04 15:09:26.045-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2279	\N	392b3edc-b418-4e67-81a4-4a3310f969c7	848	848
3838	DEBIT	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	-4300	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4351	483	01ad80e1-007c-45b3-8b32-1583b3417b16	700	848
7114	DEBIT	Plaques for IWD awards ceremony​ 	-54783	USD	2017-03-15 06:57:14.454-07	2017-03-15 06:57:14.471-07	12	69	2149	\N	\N	\N	\N	\N	1619	USD	1	-54783	-56402	888	a2ba1105-8ddd-44fc-ba97-591d7dfc1356	709	848
98	DEBIT	Libretas Hackathon	-1038000	MXN	2016-02-16 10:56:17.216-08	2016-06-14 11:14:21.738-07	10	7	\N	2016-06-14 11:14:22.435-07	\N	\N	\N	\N	\N	\N	\N	\N	-1038000	33	18ee4a98-66b6-47d6-85a0-0d4ead04f2d7	722	848
1407	DEBIT	Leadership team dinner - Sondry interview	-11757	USD	2016-08-02 06:44:04.201-07	2016-08-02 06:44:04.214-07	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11757	307	ba0bff8a-9a64-499e-8d6d-99cb47c0787b	777	848
461	DEBIT	WWC Stickers	-7000	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.998-07	15	68	\N	2016-06-14 11:14:22.481-07	\N	\N	\N	\N	\N	\N	\N	\N	-7000	138	61723292-7257-4ab6-94d3-d267da41382b	788	848
10135	DEBIT	Google I/O Travel Stipend	-100000	USD	2017-05-16 15:00:40.275-07	2017-05-16 15:00:40.275-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	-100000	1088	d1a78d7e-acb9-4d9b-b6fd-2928ebfe9236	847	848
2232	DEBIT	90/10 split: AT&T Sponsorship (April 2015)	-100000	USD	2016-10-04 08:44:28.558-07	2016-10-04 08:44:28.558-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	389	254566c7-f97b-43d5-9910-c414520ad3bf	848	848
2233	DEBIT	Google I/O: Alicia Carr	-10000	USD	2016-10-04 08:44:35.988-07	2016-10-04 08:44:35.988-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	387	7ae2b68c-c128-4dbd-a90e-a82fa24579bb	848	848
2285	DEBIT	Event Food	-2077	USD	2016-10-05 09:43:28.448-07	2016-10-05 09:43:28.644-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2077	374	cdf1fd80-a036-4c27-8a92-17a09ae5c91b	848	848
2286	DEBIT	Event supplies	-2715	USD	2016-10-05 09:44:00.394-07	2016-10-05 09:44:00.521-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2715	375	42291373-8c70-4ccc-b6c1-ec4c36403599	848	848
2287	DEBIT	Event Food	-7167	USD	2016-10-05 09:44:47.862-07	2016-10-05 09:44:48.013-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7167	378	0591fc4f-0d49-4e83-ac11-6f4b4e5475ea	848	848
2288	DEBIT	Marketing Materials	-2475	USD	2016-10-05 09:45:14.357-07	2016-10-05 09:45:14.485-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2475	376	a346ac76-b04b-4514-be71-84d9bf2c88ce	848	848
2297	DEBIT	Stickers	-62984	USD	2016-10-06 08:49:20.942-07	2016-10-06 08:49:20.967-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-62984	\N	fbae4c36-1eef-4816-94f6-f9589f62ef9e	848	848
2326	DEBIT	Conference stipend - Gen A.	-102409	GBP	2016-10-07 06:10:14.088-07	2016-10-07 06:10:14.841-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-102409	\N	55b95c98-c784-41c3-be4b-e0f81a9a75dc	848	848
3532	DEBIT	Leadership Development - speaking event	-25000	USD	2016-11-29 14:39:25.11-08	2016-11-29 14:39:25.31-08	47	3	\N	2016-11-28 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	-25000	\N	988e7f82-d35f-4c4e-a037-f45bf5115c05	848	848
3802	DEBIT	Snacks and dessert	-38874	USD	2016-12-06 09:02:53.61-08	2016-12-06 09:02:54.44-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-38874	\N	938601d7-a5d1-47a7-94b8-11b626ea9014	848	848
3536	DEBIT	Banner	-2000	USD	2016-11-29 15:07:29.03-08	2016-11-29 15:07:29.148-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	c09714f1-2fc3-4fb8-a367-95d18db0ab21	848	848
2738	DEBIT	Gift Card for Volunteer	-10000	USD	2016-10-27 14:03:46.196-07	2016-10-27 14:03:46.328-07	300	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	9783d14c-2659-46ed-948a-7e672ce73c08	848	848
2763	DEBIT	lunch ordered at Costco	-64978	USD	2016-10-28 14:30:59.537-07	2016-10-28 14:30:59.772-07	300	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-64978	418	19a3cace-58b7-4661-b4a1-076155bb69aa	848	848
2839	DEBIT	Cash for Prizes/Bartender	-50000	USD	2016-11-01 08:15:55.737-07	2016-11-01 08:15:55.892-07	2	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	5f64b05e-f6fb-4b01-adfd-950c22e3a12e	848	848
2799	DEBIT	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	-1305	USD	2016-10-31 10:52:11.82-07	2016-10-31 10:52:12.734-07	14	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1305	427	70dd8d78-1052-4a85-ac86-eeaed28d2c15	848	848
2938	DEBIT	dinner - downpament	-70000	USD	2016-11-03 12:36:06.461-07	2016-11-03 12:36:06.793-07	300	3	1115	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	\N	12330ad4-6281-4e16-afad-353af55d6e65	848	848
2946	DEBIT	Conference Travel	-53720	USD	2016-11-03 14:27:22.46-07	2016-11-03 14:27:22.847-07	48	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-53720	333	978ddad8-6f16-4c1c-9d03-58133cf4f3f3	848	848
3234	DEBIT	Food (ATXDivHack)	-119954	USD	2016-11-18 13:01:43.887-08	2016-11-18 13:01:44.336-08	2	3	1189	\N	\N	\N	\N	\N	\N	\N	\N	\N	-119954	466	6a6bfacf-cc60-4e92-a2dc-a0d97d985107	848	848
3515	DEBIT	Mathews Group 	-60000	USD	2016-11-29 13:45:09.136-08	2016-11-29 13:45:09.136-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-60000	\N	c5efa3b7-8be0-4c0b-bbf0-d03f78aefba8	848	848
3284	DEBIT	Food (ATXDivHack)	-339421	USD	2016-11-21 07:23:08.279-08	2016-11-21 07:23:08.279-08	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-339421	467	4a086d99-828a-4a85-8a6f-608d3bd7d765	848	848
3294	DEBIT	DIANA A. SCHOLARSHIP GOOGLE I/O	-25000	USD	2016-11-21 14:59:43.764-08	2016-11-21 14:59:43.764-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-25000	396	0753f9e4-051f-4578-a13f-72dce3b8075d	848	848
3332	DEBIT	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	-4874	USD	2016-11-22 13:55:10.575-08	2016-11-22 13:55:10.713-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4874	498	f33703a8-5093-41fa-8cc7-0f246e735325	848	848
3587	DEBIT	Postage to send hackathon gifts to sponsors	-1628	USD	2016-11-30 08:09:00.364-08	2016-11-30 08:09:00.529-08	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1628	\N	f36b82ec-cc72-4b8e-939b-73ea09a61f92	848	848
3588	DEBIT	Frames for sponsor gifts	-4054	USD	2016-11-30 08:11:18.637-08	2016-11-30 08:11:18.805-08	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4054	\N	892315b3-81bc-4bd8-891b-3b167173d2bc	848	848
3793	DEBIT	We Code Hackathon 2016	-2374	USD	2016-12-06 08:50:34.842-08	2016-12-06 08:50:35.964-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2374	500	38b70e02-a7b4-40c6-952d-6af6478b8b15	848	848
3833	DEBIT	Goodie Bags	-1058	USD	2016-12-07 12:49:55.814-08	2016-12-07 12:49:56.33-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1058	573	6493e4b7-0f63-4534-bf0b-f0ab17750c9e	848	848
3835	DEBIT	Leadership Event in Sofia	-1019	EUR	2016-12-07 13:30:48.339-08	2016-12-07 13:30:48.523-08	301	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1019	470	84e835ea-fd72-47a5-8dd8-92a3cee7fe26	848	848
4379	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:55:07.385-08	2016-12-27 08:55:07.385-08	275	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	641	ec06bfa7-3251-4878-aa74-24f43641fa64	848	848
4381	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:59:33.873-08	2016-12-27 08:59:33.873-08	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	642	b5e62766-527a-4a1a-92e7-0600510d8e57	848	848
4383	DEBIT	Meetup Fees	-6000	USD	2016-12-27 09:03:23.101-08	2016-12-27 09:03:23.101-08	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	643	bf299265-3ef1-4480-b14a-3d20c988ef72	848	848
4385	DEBIT	Meetup Fees	-6000	USD	2016-12-27 09:27:09.602-08	2016-12-27 09:27:09.602-08	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	644	1113ed6f-035d-4558-a161-f41dbe01295f	848	848
3972	DEBIT	3D Printer & Supplies	-30496	USD	2016-12-14 05:03:21.144-08	2016-12-14 05:03:21.949-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-30496	591	9e429b4f-81f9-4ff9-bf62-9f292e3e9b1e	848	848
4137	DEBIT	Robotics: Coding with Your Kids HackNight Supplies	-20397	USD	2016-12-19 08:20:39.625-08	2016-12-19 08:20:40.499-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20397	604	b7646d69-4189-45a4-8672-7c783ff2f2b7	848	848
4139	DEBIT	Leadership - Planning for 2017 - Afternoon Coffee	-1175	USD	2016-12-19 10:42:59.021-08	2016-12-19 10:42:59.545-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1175	601	8d0fb08a-cd76-4efd-acb9-1f5b191f029c	848	848
4140	DEBIT	Leadership - Planning for 2017 - Evening Coffee	-875	USD	2016-12-19 10:43:53.809-08	2016-12-19 10:43:54.334-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-875	603	f95b80fd-f1aa-4343-894f-09450d3990a7	848	848
4161	DEBIT	Mugs for WWCode-SV	-46419	USD	2016-12-20 10:57:28.399-08	2016-12-20 10:57:28.525-08	300	3	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-46419	605	cecf6f0f-5fc0-40c8-8907-674372e1c419	848	848
4183	DEBIT	45 webcam covers + shipping	-9685	USD	2016-12-21 07:39:46.852-08	2016-12-21 07:39:47.49-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9685	\N	d9cdec64-d87d-406a-bd84-c8a0b5a9bcb4	848	848
4230	DEBIT	Website - Domain Name	-2200	USD	2016-12-22 14:19:51.088-08	2016-12-22 14:19:52.143-08	48	3	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2200	372	09bf7a91-7939-4a04-80b5-721c536454af	848	848
4271	DEBIT	Meetup Fees	-4900	GBP	2016-12-23 10:04:05.755-08	2016-12-23 10:04:05.755-08	267	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	624	429a48b8-77bb-4b7b-9e74-d18e7878caf0	848	848
4442	DEBIT	Meetup Fees	-6000	CAD	2016-12-28 08:30:16.279-08	2016-12-28 08:30:16.279-08	293	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	666	00be055b-1e12-4bd4-8e40-99bfd7602141	848	848
4444	DEBIT	Meetup Fees	-6000	USD	2016-12-28 08:32:19.412-08	2016-12-28 08:32:19.412-08	294	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	667	f5ff4621-9e2e-40c3-9b96-849ab7c5f17b	848	848
387	DEBIT	Global Developement	-100	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	13	3	\N	2016-06-14 11:14:22.48-07	\N	\N	\N	\N	\N	\N	\N	\N	-100	97	a30c4579-0d08-49fa-b863-e379e17e4cc4	848	848
703	DEBIT	CONFERENCE GRANT	-80000	USD	2016-05-31 10:47:01.276-07	2016-06-14 11:14:22.123-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-80000	198	b08560a4-b373-40d8-91ef-20b273f83d98	848	848
3836	DEBIT	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	-6000	GBP	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	278	1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	506	9b7434d9-7779-47eb-b087-5ffd3e765704	713	848
3863	DEBIT	European Leadership Development Workshop -- Transportation, Taxi	-4400	EUR	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	301	1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4400	493	cc2b4a36-bd6e-45d8-a05b-36a6c5db6cde	750	848
3864	DEBIT	European Leadership Development Workshop -- Transportation, Flight	-4700	EUR	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	301	1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4728	494	e546ea27-19b6-4d72-8b95-6669cc95a981	750	848
253	DEBIT	WwConnect Conference	-658	USD	2016-03-19 17:00:00-07	2016-06-14 11:14:21.806-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-658	63	c4d44147-f630-42db-b84f-a28881d5dd21	777	848
249	DEBIT	WwConnect planning meeting	-4656	USD	2016-03-10 16:00:00-08	2016-06-14 11:14:21.794-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4656	59	a8e050d7-a0ba-4b7c-8dac-f15e091454e1	777	848
251	DEBIT	WwConnect Conference Set Up Day 1	-709	USD	2016-03-18 17:00:00-07	2016-06-14 11:14:21.805-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-709	61	ebea2a47-93be-4832-8bc9-85f559270863	777	848
5275	DEBIT	travel to NY for bell ringing at NYSE	-30000	USD	2017-01-25 10:20:51.642-08	2017-01-25 10:20:54.592-08	12	70	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-30000	743	db2e9b39-0096-457f-9db4-a5bb6814f55c	780	848
211	DEBIT	Order for stickers of our official WWC Boulder/Denver chapter logo	-7800	USD	2016-03-17 20:23:34.628-07	2016-06-14 11:14:21.77-07	15	68	\N	2016-06-14 11:14:22.448-07	\N	\N	\N	\N	\N	\N	\N	\N	-7800	48	33473cbd-5d6e-4231-a8f5-eb5453ae7eb1	788	848
5284	DEBIT	Drinks (La Croix water) for Jan HackNight	-2093	USD	2017-01-25 10:41:33.613-08	2017-01-25 10:41:34.163-08	48	142	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2093	724	d365e630-ae76-45cb-b68c-cf1cf918566c	847	848
5285	DEBIT	Amazon Echo Dot devices for HackNight and first book for our book club.	-22137	USD	2017-01-25 10:44:31.311-08	2017-01-25 10:44:33.251-08	48	142	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-22137	725	37f44afb-0604-4a3b-b8a4-62a32c582d49	847	848
401	DEBIT	CONNECT 2016	-2452	USD	2016-04-25 17:00:00-07	2016-06-14 11:14:21.896-07	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2452	99	9a5b52f2-5dcb-4760-8d33-ce2e4a2c24ef	848	848
2400	DEBIT	Test	-1000	USD	2016-10-11 09:18:39.252-07	2016-10-11 09:18:39.252-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	413	8d592b72-b737-4fca-995c-a0cee11c26fe	848	848
408	DEBIT	Global Development	-100	USD	2016-04-26 20:56:08.086-07	2016-06-14 11:14:21.897-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100	101	bad5555b-64cf-4f72-85c7-124b7809ade5	848	848
350	DEBIT	Global Development	-100	USD	2016-04-15 10:29:50.291-07	2016-06-14 11:14:21.861-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100	86	5d9c2c63-1706-434b-976f-38c44f019e58	848	848
2266	DEBIT	 Network budget balance pre Open Collective	-4356	USD	2016-10-04 15:37:57.159-07	2016-10-04 15:37:57.359-07	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4356	\N	657fb992-7d1d-43b7-be03-5f9d23ccb189	848	848
413	DEBIT	Global Development	-150	USD	2016-04-27 09:21:00.228-07	2016-06-14 11:14:21.907-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	103	1a7a975b-c002-4d56-abfb-627346e0f303	848	848
370	DEBIT	Global Development	-150	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	4	3	\N	2016-06-14 11:14:22.479-07	\N	\N	\N	\N	\N	\N	\N	\N	-150	93	df345561-08a9-4963-8863-c675b0fb1006	848	848
2417	DEBIT	Network support - Regional Leadership (thanks VMWare)	-370000	USD	2016-10-11 12:51:28.361-07	2016-10-11 12:51:28.677-07	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-370000	\N	a8202103-9dc5-4f86-a2f1-1dbf770906a7	848	848
326	DEBIT	Global Developement	-150	USD	2016-04-12 11:46:49.263-07	2016-06-14 11:14:21.849-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	79	c284e464-38a5-4f87-9f50-a1c589f7dc1b	848	848
335	DEBIT	Global Development	-150	USD	2016-04-12 11:52:16.188-07	2016-04-12 14:19:43.124-07	4	3	\N	2016-04-12 14:19:43.124-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f5dffc9c-009d-4d80-9983-23b2bc1c0815	848	848
2815	DEBIT	Markers, pens, sticky notes (ATXDivHack)	-2108	USD	2016-10-31 14:13:19.592-07	2016-10-31 14:13:19.745-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2108	448	812a47a9-0b51-4948-9963-c610c2bbea43	848	848
2818	DEBIT	Gifts for Organizers	-2399	USD	2016-10-31 14:14:19.644-07	2016-10-31 14:14:19.81-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2399	\N	f495583c-df24-4617-8cc5-d12616a0c36e	848	848
2819	DEBIT	Gift for organizer	-3499	USD	2016-10-31 14:14:38.997-07	2016-10-31 14:14:39.22-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3499	\N	865b1387-7552-4c8d-9d1c-34ebf653db44	848	848
2816	DEBIT	Drinks for Happy Hour (ATXDivHack)	-5518	USD	2016-10-31 14:13:39.794-07	2016-10-31 14:13:40.146-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5518	447	635f6580-ccbc-4232-bf25-eded2b10fdd7	848	848
2817	DEBIT	Almond milk for coffee (ATXDivHack)	-1192	USD	2016-10-31 14:13:53.591-07	2016-10-31 14:13:53.747-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1192	446	4d9e5244-f21b-43cd-a486-409f2b41487c	848	848
2820	DEBIT	Painters tape for signs  	-1136	USD	2016-10-31 14:14:51.746-07	2016-10-31 14:14:51.945-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1136	445	e40c1dfc-1af6-4b4d-9f6a-ec62ee2b7f8d	848	848
1564	DEBIT	Minimum Fee - May	-1000	MXN	2016-08-15 12:22:45.367-07	2016-08-15 12:22:45.38-07	10	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	31262fe9-ba55-442a-b76b-b2e456cad550	848	848
654	DEBIT	Conference Grant	-15000	USD	2016-05-24 12:42:50.307-07	2016-06-14 11:14:22.103-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15000	188	712f3b65-3cfa-48ae-a939-483739ed9bd7	848	848
660	DEBIT	Conference Grant - Sarah Olson	-20000	USD	2016-05-25 09:39:09.882-07	2016-06-14 11:14:22.103-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	190	668072a8-b0b2-4538-8842-6ffb18f74196	848	848
669	DEBIT	Photographer: Mike Ross	-65000	USD	2016-01-05 16:00:00-08	2016-06-14 11:14:22.114-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-65000	193	7bd8653b-9f4c-4f09-8ec0-99a8a1cdd2c4	848	848
2257	DEBIT	Net budget balance pre-Open Collective	-56266	USD	2016-10-04 14:57:44.218-07	2016-10-04 14:57:44.218-07	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-56266	394	0d80aa7c-4679-499a-abbb-bf69232f55f0	848	848
2258	DEBIT	90/10 split: Hackathon donation	-32000	USD	2016-10-04 15:05:22.85-07	2016-10-04 15:05:22.85-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-32000	395	0425a551-a9c9-4428-813a-aa4b4a139a49	848	848
2259	DEBIT	Drinks at Sept monthly event	-2192	USD	2016-10-04 15:06:33.802-07	2016-10-04 15:06:34.357-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2192	\N	7bc0fd8c-3371-4ffc-ab48-dc1d1478f023	848	848
2304	DEBIT	Conference stipend Udisha S.	-75000	USD	2016-10-06 10:21:09.865-07	2016-10-06 10:21:09.933-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	a07591fb-4e19-4cf3-8f08-da3c9ccff93b	848	848
2380	DEBIT	WWCode Portland Stickers	-31950	USD	2016-10-10 13:12:33.813-07	2016-10-10 13:12:33.813-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-31950	411	dab27bf8-4cd0-46ef-93fe-c99e9c4b74fe	848	848
2395	DEBIT	Google I/O stipend	-50000	USD	2016-10-11 09:00:21.246-07	2016-10-11 09:00:22.203-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	8916c363-dc64-40c0-9b37-596a418b9c45	848	848
2531	DEBIT	WWCode Director t-shirt	-3649	USD	2016-10-17 13:50:53.853-07	2016-10-17 13:50:53.855-07	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3649	\N	a66cf7d0-ac6e-42ce-ab24-b0f9f6f0c28e	848	848
2533	DEBIT	Director t-shirt	-2860	USD	2016-10-17 13:56:00.744-07	2016-10-17 13:56:00.777-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2860	\N	5356537c-b269-45d7-ac4c-e54da8c0c6c3	848	848
2823	DEBIT	Stickers for ATXDivHack 	-15300	USD	2016-10-31 14:15:38.727-07	2016-10-31 14:15:38.89-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15300	\N	547db055-4599-4a8d-8828-96bb66aec39e	848	848
2535	DEBIT	Director t-shirt	-2898	USD	2016-10-17 13:57:20.051-07	2016-10-17 13:57:20.056-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2898	\N	451a4c15-b647-4eab-82e9-640a825c808b	848	848
2529	DEBIT	WWCode Director shirt	-3649	USD	2016-10-17 13:49:16.114-07	2016-10-17 13:49:16.113-07	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3649	\N	cf15a5bb-2cb3-41bd-8ece-7dbf2dbdda36	848	848
2339	DEBIT	Network budget pre Open Collective	-230712	USD	2016-10-07 13:01:03.429-07	2016-10-07 13:01:03.535-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-230712	\N	fc099f38-490d-45b7-b117-fadb4863aa22	848	848
3828	DEBIT	Supplies / Gift Bags	-4147	USD	2016-12-07 08:50:40.889-08	2016-12-07 08:50:41.383-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4147	\N	67b87648-5991-4d8b-9734-cd9b6a439a04	848	848
2808	DEBIT	Monthly team meeting w core six members. Food/pizza	-3323	USD	2016-10-31 14:02:15.762-07	2016-10-31 14:02:16.402-07	14	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3323	400	18e79267-4423-4db3-9fde-a81a0f812e43	848	848
4375	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:50:06.414-08	2016-12-27 08:50:06.414-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	639	e25e6f3b-8f97-491c-80a9-88bab6d96c78	848	848
3801	DEBIT	Office Supplies for Hackathon.	-10585	USD	2016-12-06 09:00:58.382-08	2016-12-06 09:00:58.806-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10585	\N	f298dc78-f218-4213-b29c-2c9a130cb0c8	848	848
2739	DEBIT	DJ (ATXDivHack)	-35000	USD	2016-10-27 14:08:48.506-07	2016-10-27 14:08:48.71-07	2	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-35000	453	4bfee0a6-77d3-4608-92bb-fb59f6d1f3f2	848	848
3946	DEBIT	Installfest	-558	USD	2016-12-13 09:30:28.678-08	2016-12-13 09:30:30.347-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-558	\N	b2fc8ba1-8436-493a-a163-96064999c897	848	848
99	DEBIT	IVA Libretas Hackathon	-166080	MXN	2016-02-16 10:58:04.663-08	2016-06-14 11:14:21.738-07	10	7	\N	2016-06-14 11:14:22.436-07	\N	\N	\N	\N	\N	\N	\N	\N	-166080	34	3c8bacb7-d7c6-4ce3-a801-55ecdd103839	722	848
273	DEBIT	Connect 2016 event setup day dinner	-6800	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.838-07	14	32	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6800	72	97597693-ae20-489a-bc22-54b2b468147f	746	848
507	DEBIT	Quarterly planning meeting	-14000	USD	2016-05-05 17:18:43.265-07	2016-06-14 11:14:22.011-07	14	32	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14000	147	fbf72440-5d58-4805-afb9-5d67606dfa8c	746	848
10125	DEBIT	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	-11500	USD	2017-05-16 14:55:26.725-07	2017-05-16 14:55:26.725-07	14	32	\N	\N	\N	\N	\N	\N	0	USD	1	-11500	-11500	1119	200f5721-452d-4ec0-bb90-0970b254c841	746	848
571	DEBIT	Connect Conference video footage review	-2948	USD	2016-05-16 17:31:54.682-07	2016-06-14 11:14:22.053-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2948	167	79e8eb4f-159b-4d98-8bae-afc1989a3e44	777	848
252	DEBIT	Nike Dinner	-1000	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.805-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	62	6ee48c71-0f0b-4cd8-b3c1-ad7860c9cdf5	777	848
7072	DEBIT	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	-20950	USD	2017-03-14 10:22:10.666-07	2017-03-14 10:22:10.681-07	12	70	1893	\N	\N	\N	\N	\N	638	USD	1	-20950	-21588	899	bef0ae4e-365f-4158-a0e0-ee82ba3b21e6	780	848
10132	DEBIT	Snacks and batteries for our robots	-1554	USD	2017-05-16 15:00:04.449-07	2017-05-16 15:00:04.449-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-1554	-1554	1084	51159051-f7cc-4e7d-b285-4d94027c3ab4	847	848
10134	DEBIT	Business cards and stickers	-11948	USD	2017-05-16 15:00:30.412-07	2017-05-16 15:00:30.412-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-11948	-11948	1007	3747993e-5291-4be4-be3f-043e95561284	847	848
10133	DEBIT	Supplies for decorating our robots	-9777	USD	2017-05-16 15:00:15.557-07	2017-05-16 15:00:15.557-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-9777	-9777	1085	00f439f0-30e3-49f5-bc30-40d828f34f7e	847	848
2800	DEBIT	WWCode Seattle planning lunch with Sara	-2700	USD	2016-10-31 10:52:44.962-07	2016-10-31 10:52:45.274-07	14	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2700	420	de0990ce-e767-47a3-8594-d6d7dc3f62c7	848	848
2802	DEBIT	Pizza for our monthly October event	-9276	USD	2016-10-31 11:07:11.805-07	2016-10-31 11:07:12.736-07	15	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9276	\N	91ddc1e2-b108-4f6a-b156-e7b4f593af89	848	848
2801	DEBIT	Monthly core team meeting. Beverages with dinner for six members 	-3080	USD	2016-10-31 10:59:53.602-07	2016-10-31 10:59:53.96-07	14	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3080	401	6071a2e5-9c4e-4724-98ef-faa4c9b34169	848	848
2805	DEBIT	Food for JavaScript Study Night - Oct. 11th	-1446	USD	2016-10-31 11:19:11.822-07	2016-10-31 11:19:12.067-07	59	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1446	419	e2c41034-2610-460e-814d-b143dc9280fe	848	848
2826	DEBIT	Fedex - certificate print expense	-1962	USD	2016-10-31 14:32:07.365-07	2016-10-31 14:32:07.497-07	300	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1962	\N	3d40ddc4-003a-4559-bb76-0dd988cbb2ac	848	848
2813	DEBIT	September Ruby Tuesday	-6497	USD	2016-10-31 14:11:36.488-07	2016-10-31 14:11:36.731-07	2	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6497	450	82a4bfeb-95ef-4a2a-9d9d-5ca157938b53	848	848
2814	DEBIT	Drinks and snacks (ATXDivHack)	-75932	USD	2016-10-31 14:13:05.943-07	2016-10-31 14:13:06.106-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75932	449	2e748309-ca69-4812-83e1-506c5649d783	848	848
498	DEBIT	Conference Grant	-50000	USD	2016-05-04 14:14:39.136-07	2016-06-14 11:14:22.01-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	145	61219d5b-692d-4cba-9583-f8a7b033b990	848	848
3516	DEBIT	Matthews Group - Leadership Development for Seattle team	-60000	USD	2016-11-29 13:46:31.384-08	2016-11-29 13:46:31.384-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-60000	464	fd0c2bc8-e692-4989-a626-db0df4d74291	848	848
3517	DEBIT	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	-227646	USD	2016-11-29 13:46:42.259-08	2016-11-29 13:46:42.259-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-227646	474	41da1426-3c94-4dfc-9beb-712e3ecf65d5	848	848
3545	DEBIT	Network budget pre open collective	-55923	USD	2016-11-29 16:18:08.154-08	2016-11-29 16:18:07.832-08	285	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-55923	\N	69d0ee19-1d91-42fe-8afa-7f974771bd04	848	848
3625	DEBIT	Conference Travel Stipend - Google I/O Elese	-75000	USD	2016-11-30 13:25:56.197-08	2016-11-30 13:25:56.423-08	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	8654d25a-1d31-4bb8-8a42-09794cf62430	848	848
3628	DEBIT	Banner	-2000	USD	2016-11-30 13:33:38.691-08	2016-11-30 13:33:38.827-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	026b493f-edc5-4529-b348-1cdb4dfddc9a	848	848
2330	DEBIT	Network Budget pre Open Collective	-77659	GBP	2016-10-07 07:03:00.623-07	2016-10-07 07:03:00.89-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-77659	\N	5f8dd4cc-75b1-4aa2-89a6-cb125c6597ef	848	848
4369	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:31:58.557-08	2016-12-27 08:31:58.557-08	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	636	7baa1f62-c9bc-4df0-9a12-18a4dda6c0ce	848	848
3794	DEBIT	Marketing for IoT Hackathon	-1082	USD	2016-12-06 08:50:56.549-08	2016-12-06 08:50:57.046-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1082	502	e923e566-7e1f-4e3d-aa4d-3b2926add382	848	848
3795	DEBIT	Supplies	-3918	USD	2016-12-06 08:51:20.162-08	2016-12-06 08:51:20.661-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3918	508	e74be4f9-1c06-4a7a-ae85-656ef5ecf2e9	848	848
3796	DEBIT	T-shirt order - Design Lead	-2698	USD	2016-12-06 08:51:54.984-08	2016-12-06 08:51:55.379-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2698	509	c884d630-10d6-4279-b84b-7383937f1478	848	848
3798	DEBIT	WWCode Seattle network retreat	-6207	USD	2016-12-06 08:57:26.568-08	2016-12-06 08:57:26.935-08	14	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6207	\N	116ff80c-993e-4c5a-83d3-d24df17d5253	848	848
3799	DEBIT	Hackathon - prizes for winners + goodies for thank you bags for sponsors/speakers/mentors/judges/volunteers	-7750	USD	2016-12-06 08:57:59.164-08	2016-12-06 08:57:59.708-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7750	\N	b09fb537-00cb-4928-9a19-5551090d370a	848	848
3800	DEBIT	WWC T-shirt	-2798	USD	2016-12-06 08:59:36.33-08	2016-12-06 08:59:36.741-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2798	\N	4a126373-6cb3-4e7a-9a94-178466bcefb3	848	848
3843	DEBIT	Leadership Event in Sofia	-6444	EUR	2016-12-07 13:38:07.287-08	2016-12-07 13:38:07.429-08	301	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6444	471	4ca35a75-88d7-4546-b608-ce07199942fb	848	848
3950	DEBIT	Decorations / Supplies	-1379	USD	2016-12-13 10:42:06.408-08	2016-12-13 10:42:07.17-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1379	\N	4a743da3-3e6f-482f-8ac3-dd26c8ed51ae	848	848
3951	DEBIT	Event suplies	-2198	USD	2016-12-13 10:43:16.329-08	2016-12-13 10:43:17.27-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2198	\N	5228b4f5-f0ed-4a43-b5f8-4f2e8cfd7185	848	848
3952	DEBIT	Speaker and sponsor meetings (11/18 + 11/28) and event logistics (12/2)	-2870	USD	2016-12-13 10:44:23.973-08	2016-12-13 10:44:24.945-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2870	\N	2a19b928-ba82-4a49-a329-5c79e51b48e3	848	848
4410	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:53:07.2-08	2016-12-27 11:53:07.2-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	657	74cde2f7-e7c6-4e97-8c13-0bbaefa37e71	848	848
4141	DEBIT	Leadership - Planning for 2017 - Dinner	-9240	USD	2016-12-19 10:45:09.113-08	2016-12-19 10:45:09.64-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9240	602	03814f58-ecac-4145-b6bc-f448075970e0	848	848
4190	DEBIT	Meetup Fees	-6000	USD	2016-12-21 10:53:46.984-08	2016-12-21 10:53:46.984-08	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	607	d6799057-59a0-4562-8b3e-c2e3e9adf29b	848	848
4191	DEBIT	Meetup Fees	-6000	USD	2016-12-21 10:54:30.839-08	2016-12-21 10:54:30.839-08	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	608	53d83a5f-166b-455f-b73f-827fcdcc3a5d	848	848
4247	DEBIT	Meetup Fees	-6000	USD	2016-12-23 08:37:59.322-08	2016-12-23 08:37:59.322-08	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	613	1f6591ab-8565-4278-a8ee-906fd65c5e69	848	848
4249	DEBIT	Meetup Fees	-6000	USD	2016-12-23 08:49:17.444-08	2016-12-23 08:49:17.444-08	261	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	614	6efb3ac7-7d2a-4724-8a1a-ef64d45fe970	848	848
4251	DEBIT	Meetup Fees	-6000	USD	2016-12-23 08:52:20.827-08	2016-12-23 08:52:20.827-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	615	85f323a7-d2f8-447c-8420-1ad74cdd8d67	848	848
4254	DEBIT	Meetup Fees	-6000	USD	2016-12-23 08:56:04.579-08	2016-12-23 08:56:04.579-08	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	616	f6ab951c-bed5-4749-b0e5-db1a3a7a8ad6	848	848
4281	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:38:46.818-08	2016-12-23 11:38:46.818-08	268	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	626	d4bdb19b-d165-4c0a-b84d-6bc03f6ed962	848	848
4283	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:41:48.315-08	2016-12-23 11:41:48.315-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	627	1008cc1e-b9d2-43f0-95c2-8ee9e464a929	848	848
4285	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:50:08.539-08	2016-12-23 11:50:08.539-08	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	628	51faf49d-6a19-43ae-857d-bd10ba1f66e4	848	848
4398	DEBIT	Meetup Fees	-5700	EUR	2016-12-27 10:11:51.873-08	2016-12-27 10:11:51.873-08	283	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	652	28af55a2-3111-4783-ba8d-35cf4d105776	848	848
4433	DEBIT	Meetup Fees	-6000	USD	2016-12-28 07:58:50.078-08	2016-12-28 07:58:50.078-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	662	74036058-01c1-4f98-a83f-fc82f6510521	848	848
4436	DEBIT	Meetup Fees	-6000	CAD	2016-12-28 08:21:52.469-08	2016-12-28 08:21:52.469-08	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	663	84be2b67-931d-405c-99a7-1724a5788a24	848	848
4438	DEBIT	Meetup Fees	-6000	USD	2016-12-28 08:25:48.743-08	2016-12-28 08:25:48.743-08	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	664	571bafd6-9a7d-417d-be32-be27d3f4bee4	848	848
4440	DEBIT	Meetup Fees	-6000	USD	2016-12-28 08:28:15.901-08	2016-12-28 08:28:15.901-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	665	6ad3295b-2aa8-4bfd-a39e-659ab99c98a1	848	848
4361	DEBIT	Meetup Fees	-6000	MXN	2016-12-27 08:12:26.224-08	2016-12-27 08:12:26.224-08	299	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	632	1475d9f0-a70a-479b-a7a5-0f944217dd0c	848	848
4364	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:16:27.082-08	2016-12-27 08:16:27.082-08	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	633	f733707f-81b8-4b1a-8fb4-5d36f7398e4d	848	848
4396	DEBIT	Meetup Fees	-6000	MXN	2016-12-27 10:01:07.417-08	2016-12-27 10:01:07.417-08	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	651	c45178a3-9a29-4d14-b424-414faa770220	848	848
8306	DEBIT	Stickers	-14630	USD	2017-04-07 05:58:45.517-07	2017-04-07 05:58:45.531-07	516	3419	2321	\N	\N	\N	\N	\N	454	USD	1	-14630	-15084	889	fcf1e41b-dd9f-4534-ade5-5f6fa906d10e	702	848
7296	DEBIT	To redeem travel stipend to Google I/O	-100000	USD	2017-03-20 08:39:23.328-07	2017-03-20 08:39:23.364-07	277	1332	2180	\N	\N	\N	\N	\N	4430	USD	1	-100000	-104430	924	1fdc2835-4858-4cd0-bada-76c19f0f9f0b	712	848
7073	DEBIT	IWD event -- wine for event	-9732	USD	2017-03-14 10:22:31.446-07	2017-03-14 10:22:31.46-07	12	70	1893	\N	\N	\N	\N	\N	312	USD	1	-9732	-10044	900	22a98043-eb9c-4d56-b246-f3529b741284	780	848
208	DEBIT	Food for March Boulder, CO event	-14000	USD	2016-03-17 11:48:54.413-07	2016-06-14 11:14:21.77-07	15	68	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14000	46	614a8194-5d1d-483a-b0ac-231a1f17a036	788	848
4401	DEBIT	Meetup Fee	-6000	USD	2016-12-27 10:35:08.624-08	2016-12-27 10:35:08.624-08	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	653	21af77e9-057a-48e4-bc42-cf6de40a4d0b	848	848
4403	DEBIT	Meetup Fees	-6000	USD	2016-12-27 10:38:46.887-08	2016-12-27 10:38:46.887-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	654	46876e47-95e8-4b16-ad0e-63703c1710c6	848	848
4425	DEBIT	Meetup Fees	-6000	USD	2016-12-28 07:44:44.222-08	2016-12-28 07:44:44.222-08	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	658	70f09e97-2754-4f16-9e9f-007e253cc35b	848	848
4427	DEBIT	Meetup Fees	-6000	USD	2016-12-28 07:49:16.255-08	2016-12-28 07:49:16.255-08	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	659	52806f02-8b52-4053-97ad-eb7b0f5c2c2a	848	848
4429	DEBIT	Meetup Fees	-6000	USD	2016-12-28 07:53:05.613-08	2016-12-28 07:53:05.613-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	660	90fccb78-97b2-4e6b-951d-b476f4a7148f	848	848
4431	DEBIT	Meetup Fees	-6000	AUD	2016-12-28 07:56:28.934-08	2016-12-28 07:56:28.934-08	297	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	661	6b303a9b-a30c-4cd3-99ca-80c33b0b9197	848	848
300	DEBIT	Reimburse Caterina for program materials	-3798	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.838-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3798	76	42cf26b1-f1f3-4a07-8725-0090dd713617	848	848
298	DEBIT	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	-11815	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.839-07	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11815	74	8b3bc1cf-1598-4af5-9511-2dea9fcb267a	848	848
414	DEBIT	WePay Fee	-400	USD	2016-04-10 17:00:00-07	2016-06-14 11:14:21.907-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-400	104	87c00eef-d1a6-4f09-8e9c-b288d4bb1d87	848	848
676	DEBIT	CONFERENCE GRANT	-34750	USD	2016-05-26 12:05:53.771-07	2016-06-14 11:14:22.123-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-34750	197	d88487be-3043-4198-810a-d989c2c30afb	848	848
615	DEBIT	Conference Grant	-70000	USD	2016-05-19 12:07:13.723-07	2016-06-14 11:14:22.082-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	178	074c5df4-902c-4af8-b06e-9a222d4899dc	848	848
8601	DEBIT	Atlanta IWD Event	-235699	USD	2017-04-17 12:17:23.032-07	2017-04-17 12:17:23.032-07	12	3	\N	\N	\N	\N	\N	\N	0	USD	1	-235699	-235699	998	ed3b2ff8-e7bc-4ffd-a178-056c3ca7ec4c	848	848
8616	DEBIT	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	-100000	USD	2017-04-17 15:12:22.995-07	2017-04-17 15:12:22.995-07	270	3	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	-100000	1027	4ec74672-5586-4acc-b9be-bddf2e0a464c	848	848
8618	DEBIT	Travel Scholarship for WWCode Director	-40970	GBP	2017-04-17 15:32:02.724-07	2017-04-17 15:32:02.724-07	278	3	\N	\N	\N	\N	\N	\N	0	GBP	1	-40970	-40970	768	ac366b27-1c91-4846-b9cb-9fb911edd792	848	848
1582	DEBIT	Minimum fee - May	-1000	USD	2016-08-16 07:54:12.931-07	2016-08-16 07:54:12.95-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	6dd5e28c-157e-4552-ba9e-f37e75ec0ec4	848	848
1576	DEBIT	Monthly Minimum Fee - May	-1000	USD	2016-08-16 07:51:38.913-07	2016-08-16 07:51:38.924-07	12	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	1e21e117-2659-49f0-b3c4-0f71be1dafea	848	848
2425	DEBIT	Fedex 	-3418	USD	2016-10-11 17:43:40.215-07	2016-10-11 17:43:40.344-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3418	\N	720b2952-d5b6-4f7f-81ba-a36f52576f1f	848	848
3529	DEBIT	Regional Leadership Director Training	-13031	USD	2016-11-29 14:35:21.354-08	2016-11-29 14:35:21.522-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13031	\N	bc8e0feb-b038-484d-b77e-9671a32f65be	848	848
613	DEBIT	Conference Grant	-120000	USD	2016-05-19 12:07:13.723-07	2016-06-14 11:14:22.074-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-120000	175	0ec09d11-719f-49c7-8785-cdf9a6660274	848	848
1583	DEBIT	Minimum Fee - May	-1000	USD	2016-08-16 07:54:57.595-07	2016-08-16 07:54:57.609-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	cbb3070b-f325-45ad-a323-1210bd2b0499	848	848
299	DEBIT	Reimburse Caterina for travel expenses to CONNECT 2016	-6500	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.839-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6500	75	995b5cdf-7f5d-495b-8937-021414ea6d22	848	848
336	DEBIT	Meetup Transaction Fee	-163	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	4	3	\N	2016-06-14 11:14:22.458-07	\N	\N	\N	\N	\N	\N	\N	\N	-163	82	d8012b7a-930b-4c21-a97d-60e676c4c08d	848	848
2810	DEBIT	500 gift cards, 19.62 printed awards	-51962	USD	2016-10-31 14:09:11.281-07	2016-10-31 14:09:11.484-07	300	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-51962	416	34e49664-e27e-4576-9895-33d5e0ddf2f8	848	848
7527	DEBIT	To redeem travel stipend to Google I/O	-100000	USD	2017-03-27 10:54:16.729-07	2017-03-27 10:54:16.758-07	277	1331	2266	\N	\N	\N	\N	\N	4430	USD	1	-100000	-104430	935	8fcc5228-26e5-41ca-8db6-80fd5ffe1d51	696	848
7519	DEBIT	Google I/O	-50000	USD	2017-03-27 10:11:39.25-07	2017-03-27 10:11:39.275-07	12	69	2265	\N	\N	\N	\N	\N	1480	USD	1	-50000	-51480	952	d319eebc-1e7a-4500-a519-705bdc9facf2	709	848
7520	DEBIT	Google I/O ticket	-37500	USD	2017-03-27 10:12:00.118-07	2017-03-27 10:12:00.138-07	12	69	2265	\N	\N	\N	\N	\N	1118	USD	1	-37500	-38618	949	98f9ec9a-496c-44d1-b27d-35dc1359a639	709	848
7517	DEBIT	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	-85000	GBP	2017-03-27 09:01:27.19-07	2017-03-27 09:01:27.295-07	278	1333	2265	\N	\N	\N	\N	\N	3760	GBP	1	-85000	-88760	926	a26b7d78-3ba3-487c-99ab-fea20d22a67e	713	848
8421	DEBIT	Event supplies	-1527	USD	2017-04-11 12:13:28.544-07	2017-04-11 12:13:28.599-07	59	171	2321	\N	\N	\N	\N	\N	74	USD	1	-1527	-1601	1002	94f2347a-1fdc-472e-b084-606647265be1	716	848
8422	DEBIT	Hackathon 2017 planning meeting	-2891	USD	2017-04-11 12:15:09.813-07	2017-04-11 12:15:09.826-07	59	171	2321	\N	\N	\N	\N	\N	114	USD	1	-2891	-3005	1001	3ba366f9-e99f-4629-95c3-35280b503ba9	716	848
5785	DEBIT	Event supplies for Leads	-2439	USD	2017-02-07 10:38:14.3-08	2017-02-07 10:38:15.58-08	59	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2439	737	f07b1e2f-1ddb-43ba-8873-49e911fa25d3	716	848
10118	DEBIT	Regional Leadership Event: Barcelona	-19398	EUR	2017-05-16 14:49:07.885-07	2017-05-16 14:49:07.885-07	301	1378	\N	\N	\N	\N	\N	\N	0	EUR	1	-19398	-19398	1122	3fca3a38-ed21-4b50-903c-7ad1304b11af	750	848
5781	DEBIT	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	-59040	USD	2017-02-07 10:32:48.784-08	2017-02-07 10:32:49.072-08	14	31	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-59040	776	52ec1ede-9280-4e75-b076-1d75225a9773	777	848
6270	DEBIT	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	-6100	USD	2017-02-22 07:27:02.607-08	2017-02-22 07:27:02.62-08	14	31	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6100	774	534ed69b-fc23-4c7d-8acc-b1efd554f7b9	777	848
6271	DEBIT	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	-5458	USD	2017-02-22 07:27:45.429-08	2017-02-22 07:27:45.466-08	14	31	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5458	775	3cbee278-6d55-4ec8-b437-04378120a652	777	848
7510	DEBIT	payment to artists (spoken word) for performance at IWD event	-20000	USD	2017-03-27 05:47:25.654-07	2017-03-27 05:47:25.894-07	12	70	2218	\N	\N	\N	\N	\N	610	USD	1	-20000	-20610	907	ac007c6a-85a6-404e-9ed8-8c1cb9e9e7e5	780	848
459	DEBIT	WWC Boulder- April event's food	-14100	USD	2016-04-06 17:00:00-07	2016-06-14 11:14:21.989-07	15	68	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14100	137	d79ac9f7-4158-4fea-be4d-6c95b1858509	788	848
460	DEBIT	Mile High Agile outreach- supplies	-1115	USD	2016-04-02 17:00:00-07	2016-06-14 11:14:21.989-07	15	68	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1115	136	4423d89d-fb84-4db4-acee-0adf95f0492e	788	848
7071	DEBIT	Mar 7 Lightning Talks	-15316	USD	2017-03-14 10:21:29.296-07	2017-03-14 10:21:29.332-07	2	28	1893	\N	\N	\N	\N	\N	474	USD	1	-15316	-15790	57	f0262195-2244-40eb-b442-02995b885caa	694	848
822	DEBIT	3/30/16 Python Gameathon prize - Udemy course	-2400	USD	2016-06-04 14:37:03.991-07	2016-06-14 11:14:22.155-07	2	28	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2400	213	0870d634-022a-48de-ac16-c6f668cbea2f	694	848
3839	DEBIT	Food for October Hack Night.	-7700	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7773	484	a55eb032-a0ab-4534-bd7b-86126196aa48	700	848
3840	DEBIT	October Hack Night Drinks/Food.	-1100	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1106	485	88d96482-a87c-418a-b53b-a3c895b3d4ae	700	848
3841	DEBIT	Food/Drinks for Anniversary Reception with guest WWCode Directors!	-4400	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4444	486	534b6b59-e66e-4781-9a64-b546b15e08b6	700	848
3842	DEBIT	Food for Anniversary Reception	-700	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-713	492	5ea9a1f3-af86-44ce-a16f-5c2b3fd2a5e3	700	848
8614	DEBIT	WWCode CONNECT Conference Travel Stipend	-85000	GBP	2017-04-17 14:18:35.523-07	2017-04-17 14:18:35.581-07	278	1333	2602	\N	\N	\N	\N	\N	3760	GBP	1	-85000	-88760	1016	90b0bf3c-bd5e-4224-902c-8989cebcdf81	713	848
3837	DEBIT	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	-4000	GBP	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	278	1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4000	507	57ffa5d8-ca36-46bc-8a78-8bf44617167e	713	848
1402	DEBIT	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	-10294	USD	2016-08-02 06:38:05.215-07	2016-08-02 06:38:05.831-07	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10294	255	3a3bfae0-f068-407d-a9ab-031441913c3a	777	848
841	DEBIT	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	-5161	USD	2016-06-06 17:21:31.531-07	2016-06-14 11:14:22.165-07	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5161	218	003cb730-5a3d-4db1-a7b2-32bd980c6452	777	848
250	DEBIT	WwConnect Planning Meeting	-2519	USD	2016-03-10 16:00:00-08	2016-06-14 11:14:21.794-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2519	60	007274b9-395d-410d-837a-e4c2863db761	777	848
7079	DEBIT	Movie screening for "She Started It"	-25700	USD	2017-03-14 10:59:53.142-07	2017-03-14 10:59:53.153-07	48	142	2149	\N	\N	\N	\N	\N	775	USD	1	-25700	-26475	814	af730af1-7a84-42eb-8443-96f03e6c8347	847	848
7080	DEBIT	Wearable Clothing Workshop	-33412	USD	2017-03-14 11:00:11.436-07	2017-03-14 11:00:11.448-07	48	142	2149	\N	\N	\N	\N	\N	999	USD	1	-33412	-34411	815	cc901377-56a8-4787-a296-673763a20a9e	847	848
\.


                                                                                                                                                                    4039.dat                                                                                            0000600 0004000 0002000 00000063721 13155532021 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1328	8808873dd5e6a229bca3641b8890d754@gmail.com	*****	*****	*****	2016-09-29 11:08:19.492-07	2016-09-29 11:08:19.492-07	\N	\N	*****	*****	\N	Michelle	Sun	\N	f	686
129	f93705c9774686499d4f9efbcaa81e07@gmail.com	*****	*****	*****	2016-03-02 13:31:50.497-08	2016-03-02 13:32:53.053-08	\N	\N	*****	*****	\N	MakerSquare		\N	f	689
30	df61fcd898d629d05fe8ae08fd66ec4d@gmail.com	*****	*****	*****	2016-01-09 13:31:01.954-08	2017-04-03 05:58:04.717-07	\N	\N	*****	*****	\N	Pia	Mancini	\N	f	691
3206	9c1a8a4fc15ce332c7c5624952bceeff@gmail.com	*****	*****	*****	2017-02-21 08:55:29.631-08	2017-05-16 09:49:19.822-07	\N	\N	*****	*****	\N	WWCode		\N	f	690
2906	3b3d000425befc5172a5208310218fc2@gmail.com	*****	*****	*****	2017-02-01 09:30:43.176-08	2017-02-01 10:35:36.827-08	\N	\N	*****	*****	\N	\N	\N	\N	f	692
4173	3be24eacaf70dddd5f990afac0574189@gmail.com	*****	*****	*****	2017-04-11 19:05:32.736-07	2017-04-11 19:06:03.772-07	\N	\N	*****	*****	\N	Anne	Brown	\N	f	693
28	332cb39ce5e614d5fcad01ae28c6e9d5@gmail.com	*****	*****	*****	2015-12-21 08:34:26.053-08	2017-02-01 11:55:11.641-08	\N	\N	*****	*****	\N	Holly		\N	f	694
4720	2248e9f4451791491178e6ad6e8b395f@gmail.com	*****	*****	*****	2017-05-09 11:14:19.572-07	2017-05-09 11:14:20.294-07	\N	\N	*****	*****	\N	Nicole	Giannone	\N	f	697
577	8c4471bffc28c261aa4ef2a5d7004de4@gmail.com	*****	*****	*****	\N	2016-12-28 14:36:35.346-08	\N	\N	*****	*****	\N	Georgia	Andrews	\N	f	695
1325	5c0594710825406596a99025a319d635@gmail.com	*****	*****	*****	2016-09-29 11:06:00.962-07	2017-02-03 15:06:45.932-08	\N	\N	*****	*****	\N	Pamela	Wood Browne	\N	f	700
74	26888a78bd38eaf94af924a9675ae705@gmail.com	*****	*****	*****	2016-01-29 15:19:36.407-08	2016-09-28 03:15:16.735-07	\N	\N	*****	*****	\N	Chantal		\N	f	698
141	688f744a10db3334b59d756689fa8250@gmail.com	*****	*****	*****	2016-03-07 01:50:58.721-08	2017-05-20 04:50:46.742-07	\N	\N	*****	*****	\N	Jigyasa	Grover	\N	f	699
4153	adb8ed8f9a018d919a1dca1d502d6b3b@gmail.com	*****	*****	*****	2017-04-10 18:09:47.41-07	2017-04-10 18:09:51.31-07	\N	\N	*****	*****	\N	Nikko	Patten	\N	f	701
3419	c4d4a0ed522a5106c5aa8b3e4c077071@gmail.com	*****	*****	*****	2017-03-07 11:01:52.704-08	2017-03-07 11:02:04.53-08	\N	\N	*****	*****	\N	Erin	Spiceland	\N	f	702
4348	4e25fd969973d6fd55614b86c0c74dc5@gmail.com	*****	*****	*****	2017-04-20 02:34:08.219-07	2017-05-04 15:58:47.619-07	\N	\N	*****	*****	\N	Craft	CMS	\N	f	703
883	8cdf243bb6d94e727c22e74f7f73780b@gmail.com	*****	*****	*****	2016-08-01 08:54:10.844-07	2016-08-01 08:57:32.536-07	\N	\N	*****	*****	\N	Rackspace		\N	f	704
3053	2bbfedaf9e616d5c252c38e6019481ec@gmail.com	*****	*****	*****	2017-02-09 12:42:02.01-08	2017-02-10 08:48:15.699-08	\N	\N	*****	*****	\N	Flock:	Accelerating Women In Tech	\N	f	705
3301	e6aa8986385415192e05127010441ae4@gmail.com	*****	*****	*****	2017-02-27 16:25:15.503-08	2017-02-27 16:25:19.402-08	\N	\N	*****	*****	\N	Sue	Sinclair	\N	f	706
3999	15daf29f3c0fcdf9a94e700ce94f90f6@gmail.com	*****	*****	*****	2017-04-04 12:51:02.718-07	2017-04-04 12:51:03.29-07	\N	\N	*****	*****	\N	Allie	Winkelman	\N	f	707
1327	ebd16aa661c34f4cfdca849165c47ecb@gmail.com	*****	*****	*****	2016-09-29 11:08:19.487-07	2016-09-29 11:08:19.487-07	\N	\N	*****	*****	\N	Karen	Farzam	\N	f	708
69	75e923f20ab3d84a3ac4b36a4109d13c@gmail.com	*****	*****	*****	2016-01-29 15:18:47.287-08	2017-05-21 06:24:37.706-07	\N	\N	*****	*****	\N	Alicia		\N	f	709
1358	b78218b19cc91ab0dfb943c6c253ca85@gmail.com	*****	*****	*****	2016-09-29 11:32:00.983-07	2016-09-29 11:32:00.983-07	\N	\N	*****	*****	\N	Laura	Scholl	\N	f	710
1361	9220296eae97265c78dd6ae0722eb573@gmail.com	*****	*****	*****	2016-09-29 11:33:37.095-07	2016-09-29 11:33:37.095-07	\N	\N	*****	*****	\N	Mami	Enomoto	\N	f	711
1332	4d4dfee45f10b2b8affd87ee5a82b7a1@gmail.com	*****	*****	*****	2016-09-29 11:10:43.392-07	2017-03-20 09:33:13.852-07	\N	\N	*****	*****	\N	Jecelyn		\N	f	712
1333	c39681f94c378e9adbbbca79b24dd9ff@gmail.com	*****	*****	*****	2016-09-29 11:11:53.842-07	2017-04-12 07:42:51.09-07	\N	\N	*****	*****	\N	Gen	Ashley	\N	f	713
1375	2e951f7b3ce79f4faad5da347e302b27@gmail.com	*****	*****	*****	2016-09-29 11:43:49.04-07	2016-09-29 11:43:49.04-07	\N	\N	*****	*****	\N	Anouk	Ruhaak	\N	f	714
1359	d6b1ce23201e994cee24a7971a79d810@gmail.com	*****	*****	*****	2016-09-29 11:33:37.087-07	2016-09-29 11:33:37.087-07	\N	\N	*****	*****	\N	Himi	Sato	\N	f	715
171	475c85fcbd1984c9e5e19cea267c4f33@gmail.com	*****	*****	*****	2016-03-19 15:11:53.101-07	2017-05-18 10:47:24.123-07	\N	\N	*****	*****	\N	Caterina	Paun	\N	f	716
1370	7efecdcdea73d6875db52b91f68c0603@gmail.com	*****	*****	*****	2016-09-29 11:38:54.951-07	2016-09-29 11:38:54.951-07	\N	\N	*****	*****	\N	Viv	Del Rio	\N	f	718
283	c07b3781151a9c9fb2991128a4675d06@gmail.com	*****	*****	*****	2016-04-28 08:01:14.69-07	2016-04-28 08:02:00.631-07	\N	\N	*****	*****	\N	Dev	Bootcamp 	\N	f	719
34	6f62bd61a70f4848e632242e885cc9ed@gmail.com	*****	*****	*****	2016-01-11 10:58:47.796-08	2016-01-11 10:58:47.796-08	\N	\N	*****	*****	\N	Kelly		\N	f	720
7	163233711ccd4a6968191c8fbd549d8a@gmail.com	*****	*****	*****	2015-11-19 02:09:51.192-08	2017-04-12 13:22:46.946-07	\N	\N	*****	*****	\N	Marcela	Lango	\N	f	722
224	a32663428ce0d29c94f0f78666e7c06e@gmail.com	*****	*****	*****	2016-04-13 09:46:07.217-07	2016-04-13 11:44:12.626-07	\N	\N	*****	*****	\N	Bonsai.io		\N	f	723
1360	58564fc814b9e582dc1dcfb9242ca2ac@gmail.com	*****	*****	*****	2016-09-29 11:33:37.088-07	2016-09-29 11:33:37.088-07	\N	\N	*****	*****	\N	Aya	Nakagawa	\N	f	725
33	c31f8fee92777f265a2c4215007f35a2@gmail.com	*****	*****	*****	2016-01-11 10:57:18.467-08	2016-01-11 10:57:18.467-08	\N	\N	*****	*****	\N	Kaylyn		\N	f	726
71	f74d1d9b9d4e727c9f1634da2669cd85@gmail.com	*****	*****	*****	2016-01-29 15:19:12.899-08	2016-09-28 03:15:16.707-07	\N	\N	*****	*****	\N	Brenda		\N	f	727
1362	12a217393125c49fba8faf93dadafcd8@gmail.com	*****	*****	*****	2016-09-29 11:34:59.499-07	2016-09-29 11:34:59.499-07	\N	\N	*****	*****	\N	Daphne	Chong	\N	f	728
1363	97e510a21c89bac3e0111d73f5737b05@gmail.com	*****	*****	*****	2016-09-29 11:34:59.504-07	2016-09-29 11:34:59.504-07	\N	\N	*****	*****	\N	Lucy	Bain	\N	f	729
108	13ce3747cb13689865309d537ea4842f@gmail.com	*****	*****	*****	2016-02-18 11:54:08.5-08	2016-09-28 03:15:16.811-07	\N	\N	*****	*****	\N	Emily	Heist Moss	\N	f	730
1364	20e1ef7ed0e42f913b1b0fb8bc15b50d@gmail.com	*****	*****	*****	2016-09-29 11:34:59.505-07	2016-09-29 11:34:59.505-07	\N	\N	*****	*****	\N	Peggy	Kuo	\N	f	731
1365	8e6ff81f47ed88c6f6588511e5a3202e@gmail.com	*****	*****	*****	2016-09-29 11:37:07.337-07	2016-09-29 11:37:07.337-07	\N	\N	*****	*****	\N	Laura	Uzcátegui	\N	f	732
1890	29831b25c00785980ab934f70d4813b1@gmail.com	*****	*****	*****	2016-11-28 07:33:11.726-08	2016-11-28 07:33:31.466-08	\N	\N	*****	*****	\N	Jamie	Lu	\N	f	733
170	bd2fd32d181880d2fc0c95d7ba8ce17d@gmail.com	*****	*****	*****	2016-03-19 15:11:44.881-07	2016-03-19 15:11:44.881-07	\N	\N	*****	*****	\N	Paige	Hubbell	\N	f	734
303	357489ee6e6984e56d512c2bbf4f5b18@gmail.com	*****	*****	*****	2016-04-29 06:51:16.619-07	2016-04-29 06:51:42.705-07	\N	\N	*****	*****	\N	The	Human Geo Group	\N	f	735
1366	548f55e7c60e649394294a500b7435f5@gmail.com	*****	*****	*****	2016-09-29 11:37:07.344-07	2016-09-29 11:37:07.344-07	\N	\N	*****	*****	\N	Vicky	Twomey-Lee	\N	f	736
35	26547a83f9ce5ae0839349325b1e7343@gmail.com	*****	*****	*****	2016-01-11 10:59:41.948-08	2017-05-11 21:19:54.192-07	\N	\N	*****	*****	\N	Erica		\N	f	737
192	5effb40d83347a559b155bf5762a3985@gmail.com	*****	*****	*****	2016-03-25 08:11:02.011-07	2016-03-25 08:11:20.398-07	\N	\N	*****	*****	\N	RigUp		\N	f	738
686	411be685dd05fee05f62ca6e48aef8a3@gmail.com	*****	*****	*****	2016-07-01 15:31:42.541-07	2016-09-28 03:15:17.556-07	\N	\N	*****	*****	\N	\N	\N	\N	f	740
1368	bc2d687d77a9548c85d4d5cd2f9be8a4@gmail.com	*****	*****	*****	2016-09-29 11:38:54.934-07	2016-09-29 11:38:54.934-07	\N	\N	*****	*****	\N	Ana	Castro	\N	f	739
1369	a67e0bdc09dd2ba28385c89f334828f5@gmail.com	*****	*****	*****	2016-09-29 11:38:54.935-07	2016-09-29 11:38:54.935-07	\N	\N	*****	*****	\N	Erika	Aguayo	\N	f	741
2898	e3073fd059876de0de39852d83a06783@gmail.com	*****	*****	*****	2017-02-01 07:16:17.461-08	2017-02-01 07:16:17.461-08	\N	\N	*****	*****	\N	\N	\N	\N	f	742
32	e0d3d2a0a00a30ae6368aa47ab545566@gmail.com	*****	*****	*****	2016-01-11 10:54:33.296-08	2017-05-10 10:19:29.673-07	\N	\N	*****	*****	\N	Saranya	Karuppusamy	\N	f	746
1371	20ef75e5bb432fb540423c3b6fd60a1a@gmail.com	*****	*****	*****	2016-09-29 11:41:11.052-07	2016-09-29 11:41:11.052-07	\N	\N	*****	*****	\N	Guiti	Nabavi	\N	f	747
1379	26ac149a5ae8d0a09a8eadac9b2153d8@gmail.com	*****	*****	*****	2016-09-29 11:43:49.211-07	2016-09-29 11:43:49.211-07	\N	\N	*****	*****	\N	Aleksandra	Gavriloska	\N	f	743
4834	0174cfb68bc98317384ae65d2bb4b6a5@gmail.com	*****	*****	*****	2017-05-15 05:07:56.682-07	2017-05-15 05:09:17.931-07	\N	\N	*****	*****	\N	Brian	Vinci	\N	f	744
308	6bdf7bcd29fbb8a428b7a2ccf20c38d2@gmail.com	*****	*****	*****	2016-04-29 11:46:16.143-07	2016-05-03 06:10:49.728-07	\N	\N	*****	*****	\N	Cisco		\N	f	745
1263	6dc155c0ad37d1bea19426f9c9f5c882@gmail.com	*****	*****	*****	2016-09-22 18:07:06.058-07	2016-09-28 03:15:17.268-07	\N	\N	*****	*****	\N	Isaac	Potoczny-Jones	\N	f	752
1373	4b43d6eaedbb506b76bf9f73351958f4@gmail.com	*****	*****	*****	2016-09-29 11:41:11.058-07	2016-09-29 11:41:11.058-07	\N	\N	*****	*****	\N	Sonia	Prabhu	\N	f	751
1378	303f22fe5fcfb3542479af3c0d7ffb51@gmail.com	*****	*****	*****	2016-09-29 11:43:49.205-07	2017-05-10 14:26:04.82-07	\N	\N	*****	*****	\N	Glenna	Buford	\N	f	750
1299	ca840ad4fb9f966b78a7608f23916ce3@gmail.com	*****	*****	*****	2016-09-28 14:47:14.881-07	2016-09-28 14:49:30.346-07	\N	\N	*****	*****	\N	data.world	Swider	\N	f	748
1372	6a3a6e3cc3f4bb5cb7ef241e3ed3167a@gmail.com	*****	*****	*****	2016-09-29 11:41:11.058-07	2016-09-29 11:41:11.058-07	\N	\N	*****	*****	\N	Radhika	Rayadu	\N	f	749
67	61b08842f8750a6bc18d274dc954fa02@gmail.com	*****	*****	*****	2016-01-29 15:16:09.038-08	2016-09-28 03:15:16.707-07	\N	\N	*****	*****	\N	Nupur	Kapoor	\N	f	756
1178	d49f580dd3b9b503a43175705afc72ff@gmail.com	*****	*****	*****	2016-09-12 21:15:01.959-07	2016-09-28 03:15:18.213-07	\N	\N	*****	*****	\N	Google	Fiber	\N	f	755
1376	c11e740d05e136e14f4588e08a01f460@gmail.com	*****	*****	*****	2016-09-29 11:43:49.157-07	2016-09-29 11:43:49.157-07	\N	\N	*****	*****	\N	Carola	Nitz	\N	f	757
4550	35cf86710c6d930ee7610bf1bb5dbe11@gmail.com	*****	*****	*****	2017-05-01 10:13:32.139-07	2017-05-01 10:13:35.793-07	\N	\N	*****	*****	\N	Lacey	Reinoehl	\N	f	758
76	d13f331afaae109d7c30e231be465401@gmail.com	*****	*****	*****	2016-01-29 15:19:47.116-08	2016-09-28 03:15:16.734-07	\N	\N	*****	*****	\N	Rose	THERESA	\N	f	759
1305	aba7551e89f249da0fae69d2be8f5128@gmail.com	*****	*****	*****	2016-09-29 10:44:40.429-07	2016-09-29 10:44:40.429-07	\N	\N	*****	*****	\N	Judith	Agbotse	\N	f	760
1377	e59b939ecc4c77c350f966165188ad7e@gmail.com	*****	*****	*****	2016-09-29 11:43:49.189-07	2016-09-29 11:43:49.189-07	\N	\N	*****	*****	\N	Silvia	Pina	\N	f	761
551	a4f59257d033d8eb46bbb19bcf290430@gmail.com	*****	*****	*****	2016-06-06 12:04:33.418-07	2016-09-28 03:15:17.39-07	\N	\N	*****	*****	\N	Allison	Canestaro	\N	f	762
1307	35523780be14ccacd1194641ba0bde57@gmail.com	*****	*****	*****	2016-09-29 10:49:43.051-07	2016-09-29 10:49:43.051-07	\N	\N	*****	*****	\N	Fatma	Djoudjou	\N	f	763
75	ef131790a7c920cf2e1603358efc1449@gmail.com	*****	*****	*****	2016-01-29 15:19:43.713-08	2016-09-28 03:15:16.708-07	\N	\N	*****	*****	\N	Gabriela	Adamova	\N	f	764
78	4983e60f20be60f3cd44948b1c1c0087@gmail.com	*****	*****	*****	2016-01-29 15:20:00.061-08	2016-09-28 03:15:16.735-07	\N	\N	*****	*****	\N	Fanya		\N	f	765
642	c798ff50a86d1b17424f940a93fe10d8@gmail.com	*****	*****	*****	2016-06-21 09:02:52.874-07	2016-09-28 03:15:17.476-07	\N	\N	*****	*****	\N	Joey	Rosenberg	\N	f	768
72	9d5e8daeff013b0f404f87206eed86f9@gmail.com	*****	*****	*****	2016-01-29 15:19:22.243-08	2016-09-28 03:15:16.708-07	\N	\N	*****	*****	\N	Elizabeth	Ferrao	\N	f	769
1308	ae5eeb5acc070587de95739c5f58d0a1@gmail.com	*****	*****	*****	2016-09-29 10:49:43.061-07	2016-09-29 10:49:43.061-07	\N	\N	*****	*****	\N	Racha	Bella	\N	f	766
1367	a95d13b713d4ac6181570e7e9b909b05@gmail.com	*****	*****	*****	2016-09-29 11:37:07.344-07	2016-09-29 11:37:07.344-07	\N	\N	*****	*****	\N	Christina	Lynch	\N	f	767
1309	24b7f50b91ac3f9b0fbf879e9039aa0a@gmail.com	*****	*****	*****	2016-09-29 10:51:29.333-07	2016-09-29 10:51:29.333-07	\N	\N	*****	*****	\N	Shwetha	Lakshman Rao	\N	f	771
646	e717495c9186295c79d02397add07124@gmail.com	*****	*****	*****	2016-06-22 13:09:43.896-07	2016-09-28 03:15:17.513-07	\N	\N	*****	*****	\N	Lindsey	Barrett	\N	f	772
1310	31d3a19861b19e3c5d1eb2b483370ee1@gmail.com	*****	*****	*****	2016-09-29 10:51:29.334-07	2016-09-29 10:51:29.334-07	\N	\N	*****	*****	\N	Smitha	Radhakrishnan	\N	f	773
77	7ac57722768c7d3749d19e06e8ba389d@gmail.com	*****	*****	*****	2016-01-29 15:19:53.922-08	2016-09-28 03:15:16.734-07	\N	\N	*****	*****	\N	Zoe	Madden-Wood	\N	f	770
1313	cf9301117f3684b125ddc70a811c9ff9@gmail.com	*****	*****	*****	2016-09-29 10:54:53.45-07	2016-09-29 10:54:53.45-07	\N	\N	*****	*****	\N	Gillian	Colan-O'Leary	\N	f	778
31	27e19add9323d39d0b3f60dde40fee33@gmail.com	*****	*****	*****	2016-01-11 10:53:43.73-08	2016-07-04 13:12:12.413-07	\N	\N	*****	*****	\N	Sandra		\N	f	777
80	447bd08d1ff86983e66a70858775669d@gmail.com	*****	*****	*****	2016-02-02 08:52:02.222-08	2016-09-28 03:15:16.766-07	\N	\N	*****	*****	\N	Maru	Lango	\N	f	775
1312	71eb923685350087d1aa38bed7843ac3@gmail.com	*****	*****	*****	2016-09-29 10:53:00.503-07	2016-09-29 10:53:00.503-07	\N	\N	*****	*****	\N	Xinhui	Li	\N	f	776
70	5c7fa359b4ee800bae4b5e919a433171@gmail.com	*****	*****	*****	2016-01-29 15:18:53.83-08	2017-03-12 11:10:38.549-07	\N	\N	*****	*****	\N	beth	laing	\N	f	780
1314	d8775d54111aaf3d47957c5c4f539049@gmail.com	*****	*****	*****	2016-09-29 10:54:53.462-07	2016-09-29 10:54:53.462-07	\N	\N	*****	*****	\N	Sheree	Atcheson	\N	f	779
1315	f23b8ce26e6121a5e9dc38462e2776fa@gmail.com	*****	*****	*****	2016-09-29 10:58:16.63-07	2016-09-29 10:58:16.63-07	\N	\N	*****	*****	\N	Isabella	Oliveira	\N	f	782
2549	80afcb383424a739a793e105bdb617f9@gmail.com	*****	*****	*****	2017-01-14 09:11:39.224-08	2017-02-22 16:10:36.94-08	\N	\N	*****	*****	\N	Eileen	C	\N	f	781
1316	2d3396ed13ba45c0c471b3af1aabdf2a@gmail.com	*****	*****	*****	2016-09-29 10:59:15.428-07	2016-09-29 10:59:15.428-07	\N	\N	*****	*****	\N	Mia	Zhu	\N	f	783
896	898029d0f8816a246e0c7a7c65341485@gmail.com	*****	*****	*****	2016-08-03 10:47:13.173-07	2016-09-28 03:15:17.897-07	\N	\N	*****	*****	\N	Geoff	Domoracki	\N	f	784
1347	8f78c6c692cd973103ba9c647a361577@gmail.com	*****	*****	*****	2016-09-29 11:25:21.95-07	2016-09-29 11:25:21.95-07	\N	\N	*****	*****	\N	Marisol	Acuna	\N	f	787
1317	7c54f08b683464eac663bd982037283a@gmail.com	*****	*****	*****	2016-09-29 11:01:04.636-07	2016-09-29 11:01:04.636-07	\N	\N	*****	*****	\N	Amber	Joyner	\N	f	785
1318	96950200d2eca5a63244a97b75f536b7@gmail.com	*****	*****	*****	2016-09-29 11:01:04.636-07	2016-09-29 11:01:04.636-07	\N	\N	*****	*****	\N	Sally	Kingston	\N	f	786
68	7ddc7e8e6d4fdfa9d934e55a2b005d87@gmail.com	*****	*****	*****	2016-01-29 15:18:13.688-08	2016-09-28 03:15:17.148-07	\N	\N	*****	*****	\N	Rylee		\N	f	788
3442	b6e18803305e056856ccb858af7e6d86@gmail.com	*****	*****	*****	2017-03-09 10:29:51.939-08	2017-03-09 10:30:24.238-08	\N	\N	*****	*****	\N	Polson	& Polson, P.C.	\N	f	789
1319	6bfab1190102baca886112ebc885f691@gmail.com	*****	*****	*****	2016-09-29 11:01:49.703-07	2016-09-29 11:01:49.703-07	\N	\N	*****	*****	\N	Neha	Kaura	\N	f	790
1321	309a70eda3c7ffe404a6ca6569c939bf@gmail.com	*****	*****	*****	2016-09-29 11:02:54.555-07	2016-09-29 11:02:54.555-07	\N	\N	*****	*****	\N	Candice	Haddad	\N	f	791
884	ee80bff7c018dc2ecb0468b05451d03c@gmail.com	*****	*****	*****	2016-08-01 08:55:23.132-07	2016-08-01 08:56:25.628-07	\N	\N	*****	*****	\N	New	York Code + Design Academy (Austin)	\N	f	793
897	a48b149e339d16ec672b8abea68be0e3@gmail.com	*****	*****	*****	2016-08-02 17:00:00-07	2017-04-17 09:41:26.051-07	\N	\N	*****	*****	\N	Radhika	Malik	\N	f	795
4749	42cdf9a221d1dbffc6da14cd53207b4c@gmail.com	*****	*****	*****	2017-05-10 16:45:43.307-07	2017-05-10 16:45:44.074-07	\N	\N	*****	*****	\N	Elijah	Van Der Giessen	\N	f	796
898	ad38fa1d5fec65ace946d4b5a1da5e78@gmail.com	*****	*****	*****	2016-08-02 17:00:00-07	2016-08-02 17:00:00-07	\N	\N	*****	*****	\N	Casey	Gruppioni	\N	f	797
1323	d4caf7062fecc15e4fa181bf8632bbdf@gmail.com	*****	*****	*****	2016-09-29 11:05:19.073-07	2016-09-29 11:05:19.073-07	\N	\N	*****	*****	\N	Maira	Bejamin	\N	f	798
1324	8fd43f5cd0be03abdf7f57c45559f394@gmail.com	*****	*****	*****	2016-09-29 11:05:19.079-07	2016-09-29 11:05:19.079-07	\N	\N	*****	*****	\N	Candace	Lazarou	\N	f	799
555	3379a40c501c7f24d233be62ce9a94c5@gmail.com	*****	*****	*****	2016-06-06 17:53:44.829-07	2016-09-28 03:15:17.29-07	\N	\N	*****	*****	\N	Shahnaz	Kamberi	\N	f	801
1330	51d33c46424eb3f4647ded569bda1da3@gmail.com	*****	*****	*****	2016-09-29 11:09:42.794-07	2016-09-29 11:09:42.794-07	\N	\N	*****	*****	\N	FJ	Genus	\N	f	803
426	c989f4c11bd20a6754a75c38303a4767@gmail.com	*****	*****	*****	2016-05-23 13:27:26.092-07	2016-09-28 03:15:17.365-07	\N	\N	*****	*****	\N	Ellevest		\N	f	802
1158	3a0a65e6b6e105f4835f188459a7b979@gmail.com	*****	*****	*****	2016-09-09 20:42:48.933-07	2016-09-28 03:15:18.225-07	\N	\N	*****	*****	\N	Pieceofr		\N	f	806
1145	0d11c83dcf3d75bc133ab5010187b7b6@gmail.com	*****	*****	*****	2016-09-07 15:13:23.624-07	2016-09-28 03:15:18.184-07	\N	\N	*****	*****	\N	Jane	Shih	\N	f	804
1337	d32d64b3fc1390780651de634d212e50@gmail.com	*****	*****	*****	2016-09-29 11:13:48.772-07	2016-09-29 11:13:48.772-07	\N	\N	*****	*****	\N	Isabel	Yepes	\N	f	809
1334	416e8cd289733c0bb5ed83f3ede37276@gmail.com	*****	*****	*****	2016-09-29 11:11:53.843-07	2016-09-29 11:11:53.843-07	\N	\N	*****	*****	\N	Vinita	Khandelwal Rathi	\N	f	807
1336	0830431cc80ea3b8d7b9dc5eed3fde68@gmail.com	*****	*****	*****	2016-09-29 11:12:58.852-07	2016-09-29 11:12:58.852-07	\N	\N	*****	*****	\N	Tiffany	Andrews	\N	f	808
1339	99b642de95827a0d4bba0315ddd40723@gmail.com	*****	*****	*****	2016-09-29 11:15:23.931-07	2016-09-29 11:15:23.931-07	\N	\N	*****	*****	\N	Grisel	Ancona	\N	f	810
1338	27196e10ddabe6055a003b98d791a15b@gmail.com	*****	*****	*****	2016-09-29 11:14:46.606-07	2016-09-29 11:14:46.606-07	\N	\N	*****	*****	\N	Princy	James	\N	f	811
1340	8abf71093dbd2bfc653a5bc12a5a7b89@gmail.com	*****	*****	*****	2016-09-29 11:16:17.115-07	2016-09-29 11:16:17.115-07	\N	\N	*****	*****	\N	Emily	Reese	\N	f	812
1342	530e82f7e0744b9b860f9811257e0b13@gmail.com	*****	*****	*****	2016-09-29 11:17:47.289-07	2016-09-29 11:17:47.289-07	\N	\N	*****	*****	\N	Veronica	Cannon	\N	f	813
1341	0cd39d443715253ede1c195f212fa858@gmail.com	*****	*****	*****	2016-09-29 11:16:52.099-07	2016-09-29 11:16:52.099-07	\N	\N	*****	*****	\N	Jennifer	Hoover	\N	f	814
1346	c9606a2459e0fef1e21cdc86c3eb2683@gmail.com	*****	*****	*****	2016-09-29 11:24:17.81-07	2016-09-29 11:24:17.81-07	\N	\N	*****	*****	\N	Shruti	Sethi	\N	f	817
73	9cc8932f53ca5322fab8553db692e6a7@gmail.com	*****	*****	*****	2016-01-29 15:19:28.648-08	2016-09-28 03:15:18.347-07	\N	\N	*****	*****	\N	Barbara		\N	f	818
1349	784d1666f6262338f095884b8b2ab1d8@gmail.com	*****	*****	*****	2016-09-29 11:26:35.133-07	2016-09-29 11:26:35.133-07	\N	\N	*****	*****	\N	Qianyi	Zheng	\N	f	820
1343	8832824eb21ff845244a89b2aeb53972@gmail.com	*****	*****	*****	2016-09-29 11:19:11.446-07	2016-09-29 11:19:11.446-07	\N	\N	*****	*****	\N	Andreza	Leite	\N	f	815
1345	32d477008ca7ce468c8b6894d3527377@gmail.com	*****	*****	*****	2016-09-29 11:24:17.802-07	2016-09-29 11:24:17.802-07	\N	\N	*****	*****	\N	Ashma	Sethi	\N	f	816
1348	feb1e25523fe209c41071badd848f502@gmail.com	*****	*****	*****	2016-09-29 11:25:21.969-07	2016-09-29 11:25:21.969-07	\N	\N	*****	*****	\N	Roxane	Castelein	\N	f	819
1350	275a7843d04d598eb4949a8f3b98f170@gmail.com	*****	*****	*****	2016-09-29 11:26:35.139-07	2016-09-29 11:26:35.139-07	\N	\N	*****	*****	\N	Yoka	Liu	\N	f	821
1351	2112fabeedef785fff13999b12f6e057@gmail.com	*****	*****	*****	2016-09-29 11:28:08.47-07	2016-09-29 11:28:08.47-07	\N	\N	*****	*****	\N	Kathy	Trammell	\N	f	822
1353	672ed3d7420c37155d2978ef9bb4bddd@gmail.com	*****	*****	*****	2016-09-29 11:28:54.276-07	2016-09-29 11:28:54.276-07	\N	\N	*****	*****	\N	Ria	Riaz	\N	f	823
1356	d182a2ddbeeb69d5629028cfaeda4356@gmail.com	*****	*****	*****	2016-09-29 11:30:54.244-07	2016-09-29 11:30:54.244-07	\N	\N	*****	*****	\N	Dinah	Shi	\N	f	824
392	914df0c8ab1f8b15a8ab1a7e77a3bcc0@gmail.com	*****	*****	*****	2016-05-19 12:24:40.738-07	2016-09-28 03:15:18.36-07	\N	\N	*****	*****	\N	Travis	Swicegood	\N	f	825
1244	e953c9a4e2c5bb69552f3c92acb936ed@gmail.com	*****	*****	*****	2016-09-20 13:58:49.633-07	2016-09-28 03:15:18.662-07	\N	\N	*****	*****	\N	Grain		\N	f	826
1352	6b0788c1db2895a00b16e51bbda21ee5@gmail.com	*****	*****	*****	2016-09-29 11:28:08.475-07	2016-12-20 11:09:35.349-08	\N	\N	*****	*****	\N	Sarrah	Vesselov	\N	f	827
1354	a77dcae86c4a98f96f10de27166b1212@gmail.com	*****	*****	*****	2016-09-29 11:30:08.971-07	2016-09-29 11:30:08.971-07	\N	\N	*****	*****	\N	Ksenia	Barshchyk	\N	f	828
1357	923bd4c7e11e7c7afc4c51e31374a7f5@gmail.com	*****	*****	*****	2016-09-29 11:32:00.979-07	2016-09-29 11:32:00.979-07	\N	\N	*****	*****	\N	Britten	Kuckelman	\N	f	829
1957	d9ca31bcfecac96ff71cf6036d192503@gmail.com	*****	*****	*****	2016-11-30 08:11:38.749-08	2016-11-30 08:12:01.534-08	\N	\N	*****	*****	\N	Maddy	Lau	\N	f	833
1438	ca459f986fe2770c3231788ec004352a@gmail.com	*****	*****	*****	2016-10-06 11:36:34.986-07	2016-10-06 11:37:42.185-07	\N	\N	*****	*****	\N	Hector	Torres	\N	f	830
1446	17ab59318e1a638274d84ee4f4617cd4@gmail.com	*****	*****	*****	2016-10-07 09:49:14.297-07	2016-10-07 09:49:50.24-07	\N	\N	*****	*****	\N	Wei-Juin	Lin	\N	f	831
4711	32714f8fbf59186a1fe4eb47e2d1d40e@gmail.com	*****	*****	*****	2017-05-08 22:59:11.628-07	2017-05-08 22:59:13.896-07	\N	\N	*****	*****	\N	Kristine	Paas	\N	f	832
2416	c909e10b24422a34ea20a79b9a906cf5@gmail.com	*****	*****	*****	2017-01-03 12:59:33.995-08	2017-01-03 12:59:33.995-08	\N	\N	*****	*****	\N	Kelly	Erickson	\N	f	834
1329	fedfabd0763d3993683de654cc8e68b7@gmail.com	*****	*****	*****	2016-09-29 11:09:42.785-07	2016-09-29 11:09:42.785-07	\N	\N	*****	*****	\N	Dana	Dalling	\N	f	687
2	b0021cf62c2ef3dc137cf0a87e2af92b@gmail.com	*****	*****	*****	2015-11-05 05:44:30.93-08	2017-05-25 11:22:59.819-07	\N	\N	*****	*****	2016-03-03 16:07:14.176-08	Xavier	Damman	\N	f	688
1331	60767513ea7e3d82d4a50d8241faea30@gmail.com	*****	*****	*****	2016-09-29 11:10:43.391-07	2017-03-27 22:13:36.913-07	\N	\N	*****	*****	\N	Chee	Yim Goh	\N	f	696
36	a3f15edbecbe7da5265fba790e9feeb9@gmail.com	*****	*****	*****	2016-01-11 11:01:43.411-08	2016-02-15 14:33:12.306-08	\N	\N	*****	*****	\N	Dayra		\N	f	717
37	4c06d3aa9533a2d242b1fa57930c6603@gmail.com	*****	*****	*****	2016-01-11 11:02:41.058-08	2016-02-15 14:33:29.118-08	\N	\N	*****	*****	\N	Fernanda		\N	f	721
8	9f23b14304ccc62b927759bbf7ca73c8@gmail.com	*****	*****	*****	2015-11-30 12:20:11.257-08	2017-05-09 13:20:42.144-07	\N	\N	*****	*****	\N	Aseem	Sood	\N	f	724
1335	11dfac5cbe9c44dd072f6d704c64f19b@gmail.com	*****	*****	*****	2016-09-29 11:12:58.838-07	2016-09-29 11:12:58.838-07	\N	\N	*****	*****	\N	Irina	Muchnik	\N	f	753
1311	4bdb3020da3f8070227aa9cd1662f481@gmail.com	*****	*****	*****	2016-09-29 10:53:00.502-07	2016-09-29 10:53:00.502-07	\N	\N	*****	*****	\N	Lucy	Shang	\N	f	754
1355	4365a1d13eca1c78bd460ec7d17b2544@gmail.com	*****	*****	*****	2016-09-29 11:30:08.978-07	2016-09-29 11:30:08.978-07	\N	\N	*****	*****	\N	Oksana	Denesiuk	\N	f	774
1320	843f89b3975c3b7fc84068f95fc796cc@gmail.com	*****	*****	*****	2016-09-29 11:02:54.546-07	2016-09-29 11:02:54.546-07	\N	\N	*****	*****	\N	Amber	Houle	\N	f	792
1322	bc72c4b9fd99b99cfd7cc6decbd58008@gmail.com	*****	*****	*****	2016-09-29 11:03:46.798-07	2017-02-15 10:12:58.843-08	\N	\N	*****	*****	\N	Carole	Bennett	\N	f	794
1326	64b6e8606a0a0dcdd531b7f51f0dfe24@gmail.com	*****	*****	*****	2016-09-29 11:06:44.745-07	2016-09-29 11:06:44.745-07	\N	\N	*****	*****	\N	KeSha	Shah	\N	f	800
1094	acb49a7f9ec2454380130c56c32ebbec@gmail.com	*****	*****	*****	2016-09-01 07:41:33.243-07	2016-09-01 07:43:52.954-07	\N	\N	*****	*****	\N	thirteen23		\N	f	805
1808	ca0ddd5acb195ee0e3884842e8656755@gmail.com	*****	*****	*****	2016-11-17 09:43:26.15-08	2016-11-17 09:44:20.864-08	\N	\N	*****	*****	\N	Rigado		\N	f	835
1908	8a3f905ee55db87a19779a214587e529@gmail.com	*****	*****	*****	2016-11-29 02:03:21.301-08	2016-11-29 02:04:01.298-08	\N	\N	*****	*****	\N	Wooga		\N	f	836
2431	f4da08d72d1a2dfe1f47db5f46a62a5b@gmail.com	*****	*****	*****	2017-01-03 16:00:00-08	2017-04-28 13:39:58.316-07	\N	\N	*****	*****	\N	Nataliia	Ilchenko	\N	f	840
1304	e1b16aaaf8961ee0acdbd9d306561b03@gmail.com	*****	*****	*****	2016-09-29 10:44:40.419-07	2016-12-29 10:39:36.018-08	\N	\N	*****	*****	\N	Afia	Owusu-Forfie	\N	f	838
126	89144a979199c98e09581ea3cdcd89f5@gmail.com	*****	*****	*****	2016-03-01 20:41:59.905-08	2016-12-01 12:04:48.511-08	\N	\N	*****	*****	\N	Alaina	Percival	\N	f	839
1846	f57e8a5f4bb72290e312a6c29b1407a3@gmail.com	*****	*****	*****	2016-11-22 07:22:35.912-08	2016-11-22 07:23:28.441-08	\N	\N	*****	*****	\N	Portland	Modern Manufacturing Collective	\N	f	842
2561	0dbc97aceea70683f46b266f2c0e559a@gmail.com	*****	*****	*****	2017-01-16 10:03:53.479-08	2017-01-16 10:03:53.479-08	\N	\N	*****	*****	\N	Amanda	Folson	\N	f	843
2220	73e73afea6c744a00d6963fbf8a4ef16@gmail.com	*****	*****	*****	2016-12-18 17:41:26.473-08	2017-01-06 23:47:05.144-08	\N	\N	*****	*****	\N	Cameron	🐳✨	\N	f	844
1344	d6dd386d45dd48d56872b57c7502ba72@gmail.com	*****	*****	*****	2016-09-29 11:19:11.45-07	2017-04-30 15:09:37.177-07	\N	\N	*****	*****	\N	Karina		\N	f	845
2594	ad47316cbe8c10d21978ee1dc5746792@gmail.com	*****	*****	*****	2017-01-18 05:49:53.082-08	2017-01-18 05:55:44.616-08	\N	\N	*****	*****	\N	Tamouse	Temple	\N	f	846
142	3723537c491f597e9c203bad685dd9d7@gmail.com	*****	*****	*****	2016-03-07 01:51:08.328-08	2017-02-10 16:24:03.134-08	\N	\N	*****	*****	\N	Sarah	Olson	\N	f	847
3	a1c73eb4917522c4cdcebe8736395eb3@gmail.com	*****	*****	*****	2015-11-19 02:07:53.479-08	2017-05-22 09:22:41.796-07	\N	\N	*****	*****	2017-03-01 21:58:23.993-08	Women	Who Code	\N	t	848
1374	4d9f4287fe4e2a93b73c1cb08be76148@gmail.com	*****	*****	*****	2016-09-29 11:41:11.059-07	2016-12-19 14:20:00.592-08	\N	\N	*****	*****	\N	Snehal	Patil	\N	f	837
1303	da23087dbcb3966f332eb0d22ebbdde1@gmail.com	*****	*****	*****	2016-09-29 10:43:14.052-07	2016-11-22 23:21:46.01-08	\N	\N	*****	*****	\N	Shirley	Hicks	\N	f	841
\.


                                               3759.dat                                                                                            0000600 0004000 0002000 00000000005 13155532022 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000157335 13155532022 0015400 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_CollectiveId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_UserId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_GroupId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_UserId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_HostCollectiveId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_GroupId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_FromCollectiveId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_ExpenseId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_DonationId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_CardId_fkey";
ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_GroupId_fkey";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_UserId_fkey";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_GroupId_fkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "PaymentMethods_CollectiveId_fkey";
ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_TransactionId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_TierId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_FromCollectiveId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_TierId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_MemberCollectiveId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_lastEditedByUserId_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_lastEditedById_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_UserId_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_GroupId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_UserId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_SubscriptionId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_PaymentMethodId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_GroupId_fkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_UserId_fkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_GroupId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_ParentCollectiveId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_HostCollectiveId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_CreatedByUserId_fkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_UserId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_UserId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_TransactionId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_GroupId_fkey";
DROP INDEX public.transactions_uuid;
DROP INDEX public.subscriptions_type__group_id__user_id;
DROP INDEX public."UniqueSlugIndex";
DROP INDEX public."Transactions_GroupId";
DROP INDEX public."ToCollectiveId-FromCollectiveId-type";
DROP INDEX public."MemberCollectiveId-CollectiveId-role";
DROP INDEX public."DonationId";
DROP INDEX public."CollectiveId-deletedAt";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT email_unique_idx;
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_pkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_pkey";
ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_pkey";
ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_pkey1";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_pkey";
ALTER TABLE ONLY public."Sessions" DROP CONSTRAINT "Sessions_pkey";
ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_pkey";
ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_paykey_key";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_pkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "GroupHistories_pkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_pkey";
ALTER TABLE ONLY public."ExpenseHistories" DROP CONSTRAINT "ExpenseHistories_pkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_pkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_pkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_pkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_pkey";
ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Transactions" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Tiers" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Subscriptions" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."PaymentMethods" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Paykeys" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Orders" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Notifications" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Members" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Expenses" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."ExpenseHistories" ALTER COLUMN hid DROP DEFAULT;
ALTER TABLE public."ConnectedAccounts" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Collectives" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."CollectiveHistories" ALTER COLUMN hid DROP DEFAULT;
ALTER TABLE public."Activities" ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public."Users_id_seq";
DROP TABLE public."Users";
DROP SEQUENCE public."UserGroups_id_seq";
DROP SEQUENCE public."Transactions_id_seq";
DROP TABLE public."Transactions";
DROP SEQUENCE public."Tiers_id_seq";
DROP TABLE public."Tiers";
DROP SEQUENCE public."Subscriptions_id_seq1";
DROP SEQUENCE public."Subscriptions_id_seq";
DROP TABLE public."Subscriptions";
DROP TABLE public."Sessions";
DROP TABLE public."SequelizeMeta";
DROP SEQUENCE public."Paykeys_id_seq";
DROP TABLE public."Paykeys";
DROP TABLE public."Notifications";
DROP TABLE public."Members";
DROP SEQUENCE public."Groups_id_seq";
DROP SEQUENCE public."GroupHistories_hid_seq";
DROP SEQUENCE public."Expenses_id_seq";
DROP TABLE public."Expenses";
DROP SEQUENCE public."ExpenseHistories_hid_seq";
DROP TABLE public."ExpenseHistories";
DROP SEQUENCE public."Donations_id_seq";
DROP TABLE public."Orders";
DROP SEQUENCE public."ConnectedAccounts_id_seq";
DROP TABLE public."ConnectedAccounts";
DROP TABLE public."Collectives";
DROP TABLE public."CollectiveHistories";
DROP SEQUENCE public."Cards_id_seq";
DROP TABLE public."PaymentMethods";
DROP SEQUENCE public."Activities_id_seq";
DROP TABLE public."Activities";
DROP TYPE public."enum_UserGroups_role";
DROP TYPE public."enum_Groups_membership_type";
DROP EXTENSION postgis;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

--
-- Name: enum_Groups_membership_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Groups_membership_type" AS ENUM (
    'donation',
    'monthlyfee',
    'yearlyfee'
);


--
-- Name: enum_UserGroups_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_UserGroups_role" AS ENUM (
    'admin',
    'writer',
    'viewer'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Activities" (
    id integer NOT NULL,
    type character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "CollectiveId" integer,
    "UserId" integer,
    "TransactionId" integer
);


--
-- Name: Activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Activities_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Activities_id_seq" OWNED BY "Activities".id;


--
-- Name: PaymentMethods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "PaymentMethods" (
    id integer NOT NULL,
    name character varying(255),
    token character varying(255),
    "customerId" character varying(255),
    service character varying(255) DEFAULT 'stripe'::character varying,
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "confirmedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "expiryDate" timestamp with time zone,
    uuid uuid,
    "CollectiveId" integer,
    "archivedAt" timestamp with time zone,
    "monthlyLimitPerMember" integer,
    "primary" boolean DEFAULT false,
    currency character varying(3)
);


--
-- Name: Cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Cards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Cards_id_seq" OWNED BY "PaymentMethods".id;


--
-- Name: CollectiveHistories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "CollectiveHistories" (
    id integer,
    name character varying(255),
    description character varying(255),
    currency character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(255),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean,
    "LastEditedByUserId" integer,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point)
);


--
-- Name: Collectives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Collectives" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean DEFAULT false,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(128),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean DEFAULT false,
    "LastEditedByUserId" integer,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point)
);


--
-- Name: ConnectedAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ConnectedAccounts" (
    id integer NOT NULL,
    service character varying(255),
    username character varying(255),
    "clientId" character varying(255),
    token character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    "refreshToken" character varying(255)
);


--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ConnectedAccounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ConnectedAccounts_id_seq" OWNED BY "ConnectedAccounts".id;


--
-- Name: Orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Orders" (
    id integer NOT NULL,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "totalAmount" integer,
    description character varying(255),
    "SubscriptionId" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "PaymentMethodId" integer,
    "processedAt" timestamp with time zone,
    "privateMessage" text,
    "TierId" integer,
    "FromCollectiveId" integer,
    "publicMessage" character varying(255),
    quantity integer
);


--
-- Name: Donations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Donations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Donations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Donations_id_seq" OWNED BY "Orders".id;


--
-- Name: ExpenseHistories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ExpenseHistories" (
    id integer,
    "UserId" integer,
    "CollectiveId" integer,
    currency character varying(255),
    amount integer,
    description character varying(255),
    "payoutMethod" character varying(255),
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer,
    status character varying(255),
    "incurredAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL
);


--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ExpenseHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ExpenseHistories_hid_seq" OWNED BY "ExpenseHistories".hid;


--
-- Name: Expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Expenses" (
    id integer NOT NULL,
    "UserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    currency character varying(255) NOT NULL,
    amount integer NOT NULL,
    description character varying(255) NOT NULL,
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer NOT NULL,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL,
    "incurredAt" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    "payoutMethod" character varying(255) NOT NULL
);


--
-- Name: Expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Expenses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Expenses_id_seq" OWNED BY "Expenses".id;


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "GroupHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "GroupHistories_hid_seq" OWNED BY "CollectiveHistories".hid;


--
-- Name: Groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Groups_id_seq" OWNED BY "Collectives".id;


--
-- Name: Members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Members" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    role character varying(255) DEFAULT 'MEMBER'::character varying NOT NULL,
    id integer NOT NULL,
    description character varying(255),
    "MemberCollectiveId" integer,
    "TierId" integer
);


--
-- Name: Notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Notifications" (
    id integer NOT NULL,
    channel character varying(255) DEFAULT 'email'::character varying,
    type character varying(255),
    active boolean DEFAULT true,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "UserId" integer,
    "CollectiveId" integer,
    "webhookUrl" character varying(255)
);


--
-- Name: Paykeys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Paykeys" (
    id integer NOT NULL,
    "trackingId" character varying(255),
    paykey character varying(255),
    status character varying(255),
    payload json,
    data json,
    error json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "TransactionId" integer
);


--
-- Name: Paykeys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Paykeys_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Paykeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Paykeys_id_seq" OWNED BY "Paykeys".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);


--
-- Name: Sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Subscriptions" (
    id integer NOT NULL,
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "interval" character varying(8) DEFAULT NULL::character varying,
    "isActive" boolean DEFAULT false,
    data json,
    "stripeSubscriptionId" character varying(255),
    "activatedAt" timestamp with time zone,
    "deactivatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);


--
-- Name: Subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Subscriptions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Subscriptions_id_seq" OWNED BY "Notifications".id;


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Subscriptions_id_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Subscriptions_id_seq1" OWNED BY "Subscriptions".id;


--
-- Name: Tiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Tiers" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "maxQuantity" integer,
    password character varying(255),
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    slug character varying(255),
    "maxQuantityPerUser" integer,
    goal integer,
    type character varying(255) DEFAULT 'TICKET'::character varying,
    "CollectiveId" integer,
    "interval" character varying(8) DEFAULT NULL::character varying,
    button character varying(255),
    presets json
);


--
-- Name: Tiers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Tiers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Tiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Tiers_id_seq" OWNED BY "Tiers".id;


--
-- Name: Transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Transactions" (
    id integer NOT NULL,
    type character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    "CollectiveId" integer,
    "CreatedByUserId" integer,
    "PaymentMethodId" integer,
    "deletedAt" timestamp with time zone,
    data json,
    "OrderId" integer,
    "platformFeeInTxnCurrency" integer,
    "hostFeeInTxnCurrency" integer,
    "paymentProcessorFeeInTxnCurrency" integer,
    "txnCurrency" character varying(255),
    "txnCurrencyFxRate" double precision,
    "amountInTxnCurrency" integer,
    "netAmountInCollectiveCurrency" integer,
    "ExpenseId" integer,
    uuid uuid,
    "FromCollectiveId" integer,
    "HostCollectiveId" integer
);


--
-- Name: Transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Transactions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Transactions_id_seq" OWNED BY "Transactions".id;


--
-- Name: UserGroups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "UserGroups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserGroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "UserGroups_id_seq" OWNED BY "Members".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Users" (
    id integer NOT NULL,
    email character varying(255),
    _salt character varying(255) DEFAULT '$2a$10$JqAcT6sBbBs5pO9FkwqLEu'::character varying,
    refresh_token character varying(255) DEFAULT '$2a$10$IHs8e8FdK1.bqjvZxr4Zvu'::character varying,
    password_hash character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "seenAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "paypalEmail" character varying(255),
    "resetPasswordTokenHash" character varying(255),
    "resetPasswordSentAt" timestamp with time zone,
    "firstName" character varying(128),
    "lastName" character varying(128),
    "billingAddress" character varying(255),
    "isHost" boolean DEFAULT false,
    "CollectiveId" integer
);


--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;


--
-- Name: Activities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities" ALTER COLUMN id SET DEFAULT nextval('"Activities_id_seq"'::regclass);


--
-- Name: CollectiveHistories hid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories" ALTER COLUMN hid SET DEFAULT nextval('"GroupHistories_hid_seq"'::regclass);


--
-- Name: Collectives id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives" ALTER COLUMN id SET DEFAULT nextval('"Groups_id_seq"'::regclass);


--
-- Name: ConnectedAccounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts" ALTER COLUMN id SET DEFAULT nextval('"ConnectedAccounts_id_seq"'::regclass);


--
-- Name: ExpenseHistories hid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ExpenseHistories" ALTER COLUMN hid SET DEFAULT nextval('"ExpenseHistories_hid_seq"'::regclass);


--
-- Name: Expenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses" ALTER COLUMN id SET DEFAULT nextval('"Expenses_id_seq"'::regclass);


--
-- Name: Members id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members" ALTER COLUMN id SET DEFAULT nextval('"UserGroups_id_seq"'::regclass);


--
-- Name: Notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq"'::regclass);


--
-- Name: Orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders" ALTER COLUMN id SET DEFAULT nextval('"Donations_id_seq"'::regclass);


--
-- Name: Paykeys id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Paykeys" ALTER COLUMN id SET DEFAULT nextval('"Paykeys_id_seq"'::regclass);


--
-- Name: PaymentMethods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods" ALTER COLUMN id SET DEFAULT nextval('"Cards_id_seq"'::regclass);


--
-- Name: Subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Subscriptions" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq1"'::regclass);


--
-- Name: Tiers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers" ALTER COLUMN id SET DEFAULT nextval('"Tiers_id_seq"'::regclass);


--
-- Name: Transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions" ALTER COLUMN id SET DEFAULT nextval('"Transactions_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- Data for Name: Activities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Activities" (id, type, data, "createdAt", "CollectiveId", "UserId", "TransactionId") FROM stdin;
\.
COPY "Activities" (id, type, data, "createdAt", "CollectiveId", "UserId", "TransactionId") FROM '$$PATH$$/4009.dat';

--
-- Name: Activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Activities_id_seq"', 27901, true);


--
-- Name: Cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Cards_id_seq"', 3023, true);


--
-- Data for Name: CollectiveHistories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "CollectiveHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", hid, "archivedAt", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM stdin;
\.
COPY "CollectiveHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", hid, "archivedAt", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM '$$PATH$$/4013.dat';

--
-- Data for Name: Collectives; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Collectives" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM stdin;
\.
COPY "Collectives" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM '$$PATH$$/4014.dat';

--
-- Data for Name: ConnectedAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "ConnectedAccounts" (id, service, username, "clientId", token, data, "createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", "refreshToken") FROM stdin;
\.
COPY "ConnectedAccounts" (id, service, username, "clientId", token, data, "createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", "refreshToken") FROM '$$PATH$$/4015.dat';

--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"ConnectedAccounts_id_seq"', 1023, true);


--
-- Name: Donations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Donations_id_seq"', 2912, true);


--
-- Data for Name: ExpenseHistories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "ExpenseHistories" (id, "UserId", "CollectiveId", currency, amount, description, "payoutMethod", "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM stdin;
\.
COPY "ExpenseHistories" (id, "UserId", "CollectiveId", currency, amount, description, "payoutMethod", "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM '$$PATH$$/4019.dat';

--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"ExpenseHistories_hid_seq"', 1607, true);


--
-- Data for Name: Expenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Expenses" (id, "UserId", "CollectiveId", currency, amount, description, "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM stdin;
\.
COPY "Expenses" (id, "UserId", "CollectiveId", currency, amount, description, "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM '$$PATH$$/4021.dat';

--
-- Name: Expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Expenses_id_seq"', 1159, true);


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"GroupHistories_hid_seq"', 31393, true);


--
-- Name: Groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Groups_id_seq"', 848, true);


--
-- Data for Name: Members; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Members" ("createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", role, id, description, "MemberCollectiveId", "TierId") FROM stdin;
\.
COPY "Members" ("createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", role, id, description, "MemberCollectiveId", "TierId") FROM '$$PATH$$/4025.dat';

--
-- Data for Name: Notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "CollectiveId", "webhookUrl") FROM stdin;
\.
COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "CollectiveId", "webhookUrl") FROM '$$PATH$$/4026.dat';

--
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Orders" (id, "CreatedByUserId", "CollectiveId", currency, "totalAmount", description, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "processedAt", "privateMessage", "TierId", "FromCollectiveId", "publicMessage", quantity) FROM stdin;
\.
COPY "Orders" (id, "CreatedByUserId", "CollectiveId", currency, "totalAmount", description, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "processedAt", "privateMessage", "TierId", "FromCollectiveId", "publicMessage", quantity) FROM '$$PATH$$/4017.dat';

--
-- Data for Name: Paykeys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Paykeys" (id, "trackingId", paykey, status, payload, data, error, "createdAt", "updatedAt", "deletedAt", "TransactionId") FROM stdin;
\.
COPY "Paykeys" (id, "trackingId", paykey, status, payload, data, error, "createdAt", "updatedAt", "deletedAt", "TransactionId") FROM '$$PATH$$/4027.dat';

--
-- Name: Paykeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Paykeys_id_seq"', 1, false);


--
-- Data for Name: PaymentMethods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "PaymentMethods" (id, name, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "CreatedByUserId", "expiryDate", uuid, "CollectiveId", "archivedAt", "monthlyLimitPerMember", "primary", currency) FROM stdin;
\.
COPY "PaymentMethods" (id, name, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "CreatedByUserId", "expiryDate", uuid, "CollectiveId", "archivedAt", "monthlyLimitPerMember", "primary", currency) FROM '$$PATH$$/4011.dat';

--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "SequelizeMeta" (name) FROM stdin;
\.
COPY "SequelizeMeta" (name) FROM '$$PATH$$/4029.dat';

--
-- Data for Name: Sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
\.
COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM '$$PATH$$/4030.dat';

--
-- Data for Name: Subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.
COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM '$$PATH$$/4031.dat';

--
-- Name: Subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Subscriptions_id_seq"', 17102, true);


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Subscriptions_id_seq1"', 2214, true);


--
-- Data for Name: Tiers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Tiers" (id, name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug, "maxQuantityPerUser", goal, type, "CollectiveId", "interval", button, presets) FROM stdin;
\.
COPY "Tiers" (id, name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug, "maxQuantityPerUser", goal, type, "CollectiveId", "interval", button, presets) FROM '$$PATH$$/4034.dat';

--
-- Name: Tiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Tiers_id_seq"', 200, true);


--
-- Data for Name: Transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "CollectiveId", "CreatedByUserId", "PaymentMethodId", "deletedAt", data, "OrderId", "platformFeeInTxnCurrency", "hostFeeInTxnCurrency", "paymentProcessorFeeInTxnCurrency", "txnCurrency", "txnCurrencyFxRate", "amountInTxnCurrency", "netAmountInCollectiveCurrency", "ExpenseId", uuid, "FromCollectiveId", "HostCollectiveId") FROM stdin;
\.
COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "CollectiveId", "CreatedByUserId", "PaymentMethodId", "deletedAt", data, "OrderId", "platformFeeInTxnCurrency", "hostFeeInTxnCurrency", "paymentProcessorFeeInTxnCurrency", "txnCurrency", "txnCurrencyFxRate", "amountInTxnCurrency", "netAmountInCollectiveCurrency", "ExpenseId", uuid, "FromCollectiveId", "HostCollectiveId") FROM '$$PATH$$/4036.dat';

--
-- Name: Transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Transactions_id_seq"', 11071, true);


--
-- Name: UserGroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"UserGroups_id_seq"', 4719, true);


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Users" (id, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "paypalEmail", "resetPasswordTokenHash", "resetPasswordSentAt", "firstName", "lastName", "billingAddress", "isHost", "CollectiveId") FROM stdin;
\.
COPY "Users" (id, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "paypalEmail", "resetPasswordTokenHash", "resetPasswordSentAt", "firstName", "lastName", "billingAddress", "isHost", "CollectiveId") FROM '$$PATH$$/4039.dat';

--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Users_id_seq"', 4973, true);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.
COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM '$$PATH$$/3759.dat';

--
-- Name: Activities Activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_pkey" PRIMARY KEY (id);


--
-- Name: PaymentMethods Cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id);


--
-- Name: ConnectedAccounts ConnectedAccounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_pkey" PRIMARY KEY (id);


--
-- Name: Orders Donations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_pkey" PRIMARY KEY (id);


--
-- Name: ExpenseHistories ExpenseHistories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ExpenseHistories"
    ADD CONSTRAINT "ExpenseHistories_pkey" PRIMARY KEY (hid);


--
-- Name: Expenses Expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY (id);


--
-- Name: CollectiveHistories GroupHistories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "GroupHistories_pkey" PRIMARY KEY (hid);


--
-- Name: Collectives Groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);


--
-- Name: Paykeys Paykeys_paykey_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_paykey_key" UNIQUE (paykey);


--
-- Name: Paykeys Paykeys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Sessions Sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);


--
-- Name: Notifications Subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (id);


--
-- Name: Subscriptions Subscriptions_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey1" PRIMARY KEY (id);


--
-- Name: Tiers Tiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_pkey" PRIMARY KEY (id);


--
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id);


--
-- Name: Members UserGroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Users email_unique_idx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT email_unique_idx UNIQUE (email);


--
-- Name: CollectiveId-deletedAt; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CollectiveId-deletedAt" ON "Tiers" USING btree ("CollectiveId", "deletedAt");


--
-- Name: DonationId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "DonationId" ON "Transactions" USING btree ("OrderId");


--
-- Name: MemberCollectiveId-CollectiveId-role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "MemberCollectiveId-CollectiveId-role" ON "Members" USING btree ("MemberCollectiveId", "CollectiveId", role);


--
-- Name: ToCollectiveId-FromCollectiveId-type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ToCollectiveId-FromCollectiveId-type" ON "Transactions" USING btree ("CollectiveId", "FromCollectiveId", "deletedAt");


--
-- Name: Transactions_GroupId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Transactions_GroupId" ON "Transactions" USING btree ("CollectiveId", "deletedAt");


--
-- Name: UniqueSlugIndex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UniqueSlugIndex" ON "Collectives" USING btree (slug);


--
-- Name: subscriptions_type__group_id__user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX subscriptions_type__group_id__user_id ON "Notifications" USING btree (type, "CollectiveId", "UserId");


--
-- Name: transactions_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX transactions_uuid ON "Transactions" USING btree (uuid);


--
-- Name: Activities Activities_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Activities Activities_TransactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Activities Activities_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaymentMethods Cards_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CollectiveHistories CollectiveHistories_CreatedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CollectiveHistories CollectiveHistories_HostCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CollectiveHistories CollectiveHistories_ParentCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Collectives_CreatedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Collectives_HostCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Collectives_ParentCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ConnectedAccounts ConnectedAccounts_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ConnectedAccounts ConnectedAccounts_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_PaymentMethodId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_PaymentMethodId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_SubscriptionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_SubscriptionId_fkey" FOREIGN KEY ("SubscriptionId") REFERENCES "Subscriptions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_lastEditedById_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_lastEditedById_fkey" FOREIGN KEY ("lastEditedById") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Groups_lastEditedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_lastEditedByUserId_fkey" FOREIGN KEY ("LastEditedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Members Members_MemberCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_MemberCollectiveId_fkey" FOREIGN KEY ("MemberCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Members Members_TierId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Orders_FromCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Orders_TierId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Paykeys Paykeys_TransactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaymentMethods PaymentMethods_CollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "PaymentMethods_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Notifications Subscriptions_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Notifications Subscriptions_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Tiers Tiers_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_CardId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_CardId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_DonationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_DonationId_fkey" FOREIGN KEY ("OrderId") REFERENCES "Orders"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_ExpenseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_ExpenseId_fkey" FOREIGN KEY ("ExpenseId") REFERENCES "Expenses"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_FromCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_HostCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Members UserGroups_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id);


--
-- Name: Members UserGroups_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Users Users_CollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: geography_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE geography_columns TO opencollective;


--
-- Name: geometry_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE geometry_columns TO opencollective;


--
-- Name: raster_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE raster_columns TO opencollective;


--
-- Name: raster_overviews; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE raster_overviews TO opencollective;


--
-- Name: spatial_ref_sys; Type: ACL; Schema: public; Owner: -
--

REVOKE SELECT ON TABLE spatial_ref_sys FROM PUBLIC;
REVOKE ALL ON TABLE spatial_ref_sys FROM xdamman;
GRANT SELECT ON TABLE spatial_ref_sys TO PUBLIC;
GRANT ALL ON TABLE spatial_ref_sys TO opencollective;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   