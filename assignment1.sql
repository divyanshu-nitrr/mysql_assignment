 Use assignment;
CREATE TABLE Trainer_Info (
  Trainer_Id varchar(20) primary key,
  Salutation varchar(7),
  Trainer_Name varchar(30),
  Trainer_Location varchar(30),
  Trainer_Track varchar(15),
  Trainer_Qualification varchar(100),
  Trainer_Experiance integer(11),
  Trainer_Email varchar (100),
  Trainer_Password varchar (20)
);
desc Trainer_Info;

create table Batch_Info(
  Batch_Id	varchar(20) primary key,
  Batch_Owner	varchar(30),
  Batch_BU_Name	varchar(30)
);
desc Batch_Info;

create table Module_Info(
  Module_Id	varchar(20) primary key,
  Module_Name	varchar(40),
  Module_Duration	Integer(11)
);
desc Module_Info;

create table Associate_Info(
  Associate_Id	varchar(20) primary key,
  Salutation	varchar(7),
  Associate_Name varchar(30),
  Associate_Location	varchar(30),
  Associate_Track	varchar(15),
  Associate_Qualification	varchar(200),
  Associate_Email	varchar(100),
  Associate_Password varchar(20)
);
 desc Associate_Info;
 
create table Questions(
  Question_Id	varchar(20) primary key,
  Module_Id	varchar(20),
  Question_Text	varchar(900),
  FOREIGN KEY (Module_Id) REFERENCES Module_Info(Module_Id)
);
desc Questions;

create table Associate_Status(
  Associate_Id varchar(20) ,
  Module_Id	varchar(20),
  Batch_Id varchar(20),
  Trainer_Id varchar(20),
  Start_Date	varchar(20),
  End_Date	varchar(20),
  FOREIGN KEY (Associate_Id) REFERENCES Associate_Info(Associate_Id),
  FOREIGN KEY (Module_Id) REFERENCES Module_Info(Module_Id),
   FOREIGN KEY (Batch_Id) REFERENCES Batch_Info(Batch_Id),
  FOREIGN KEY (Trainer_Id) REFERENCES Trainer_Info(Trainer_Id)
 
);
desc Associate_Status;

create table Trainer_Feedback(
  Trainer_Id	varchar(20) primary key,
  Question_Id	varchar(20),
  Batch_Id varchar(20),
  Module_Id	varchar(20),
  Trainer_Rating Integer(11),
  FOREIGN KEY (Question_Id) REFERENCES Questions(Question_Id),
  FOREIGN KEY (Module_Id) REFERENCES Module_Info(Module_Id),
   FOREIGN KEY (Batch_Id) REFERENCES Batch_Info(Batch_Id),
  FOREIGN KEY (Trainer_Id) REFERENCES Trainer_Info(Trainer_Id)
);
desc Trainer_Feedback;

create table Associate_Feedback (
  Associate_Id varchar(20) primary key,
  Question_Id	varchar(20),
  Module_Id	varchar(20),
  Associate_Rating Integer(11),
  FOREIGN KEY (Question_Id) REFERENCES Questions(Question_Id),
  FOREIGN KEY (Module_Id) REFERENCES Module_Info(Module_Id),
  FOREIGN KEY (Associate_Id) REFERENCES Associate_Info(Associate_Id)
);
desc Associate_Feedback;


create table Login_Details(
  User_Id	varchar(20) primary key,
  User_Password	varchar(20)
);