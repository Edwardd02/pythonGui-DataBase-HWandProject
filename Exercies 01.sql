Create table Categories
(		category_ID		Integer		not null		AUTO_INCREMENT,
		category		Varchar(20)	not null,
constraint Categories_PK Primary Key (category_ID));

Create table Expenses
(		expense_ID		Integer 	not null	Auto_increment,
		category_ID		integer		not null,
        expense_date	date		not null,
        expense			varchar(30) not null,
        amount			DECIMAL(10,2) not null,
        notes			varchar(30),
constraint Expenses_PK Primary Key (expense_ID),
constraint Expenses_FK Foreign Key (category_ID) References Categories(category_ID));	
