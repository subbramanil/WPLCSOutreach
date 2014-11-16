CREATE TABLE [dbo].[Academics]
(
    [AcademicsId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [DayOfWeek] NVARCHAR(50) NOT NULL, 
    [StartTime] TIME NOT NULL, 
    [EndTime] TIME NOT NULL,
);


CREATE TABLE [dbo].[Course]
(
    [CourseId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [CourseLevel] INT NOT NULL, 
    [CourseName] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(50) 
);

CREATE TABLE [dbo].[Person]
(
	[PersonId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [FirstName] NVARCHAR(50) NOT NULL, 
    [LastName] NVARCHAR(50) NULL, 
    [Email] NVARCHAR(50) NOT NULL UNIQUE, 
    [Password] NVARCHAR(MAX) NOT NULL, 
    [Address] NVARCHAR(200) NOT NULL, 
    [ContactNumber] NVARCHAR(15) NOT NULL, 
    [Role] NVARCHAR(50) NOT NULL, 
    [IsLocked] BIT NOT NULL DEFAULT 0
);

CREATE TABLE [dbo].[Instructor]
(
    [InstructorId] INT NOT NULL PRIMARY KEY IDENTITY,
    [canTeach] BIT NOT NULL DEFAULT 0,
    CONSTRAINT fk_PersonIdInstructor FOREIGN KEY (InstructorId) REFERENCES Person(PersonId)
);
CREATE TABLE [dbo].[InstructorAcademics]
(
	
    [InstructorId] INT NOT NULL, 
    [AcademicsId] INT NOT NULL ,
	CONSTRAINT pk_multiplePKInstructorAcademics PRIMARY KEY (InstructorId,AcademicsId),
    CONSTRAINT fk_InstructorIdInstructorAcademics FOREIGN KEY (InstructorId) REFERENCES Instructor(InstructorId),
    CONSTRAINT fk_AcademicsIdrInstructorAcademics FOREIGN KEY (AcademicsId) REFERENCES Academics(AcademicsId)
);

CREATE TABLE [dbo].[InstructorCourse]
(
    [CourseId] INT NOT NULL  , 
    [InstructorId] INT NOT NULL ,
	CONSTRAINT pk_multiplePKInstructorCourse PRIMARY KEY (InstructorId,CourseId),
	CONSTRAINT fk_InstructorIdInstructorCourse FOREIGN KEY (InstructorId) REFERENCES Instructor(InstructorId),
	CONSTRAINT fk_CourseIdInstructorCourse FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);
CREATE TABLE [dbo].[SkillSet]
(
    [SkillSetId] INT NOT NULL PRIMARY KEY Identity, 
    [SkillName] NVARCHAR(50) NOT NULL
);
CREATE TABLE [dbo].[InstructorSkill]
(
	
    [InstructorId] INT NOT NULL , 
    [SkillSetId] INT NOT NULL ,
	CONSTRAINT pk_multiplePKInstructorSkill PRIMARY KEY (InstructorId,SkillSetId),
	CONSTRAINT fk_InstructorIdInsrtutorSkill FOREIGN KEY (InstructorId) REFERENCES Instructor(InstructorId),
	CONSTRAINT fk_SkillSetId FOREIGN KEY (SkillSetId) REFERENCES SkillSet(SkillSetId)

);
	
CREATE TABLE [dbo].[EventType]
(
	[EventTypeId] INT NOT NULL PRIMARY KEY Identity, 
    [TypeName] NVARCHAR(50) NOT NULL, 
    [Recurrence] NVARCHAR(50) NOT NULL
);

CREATE TABLE [dbo].[ExtraWork]
(
	[ExtraWorkId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [InstructorId] INT NOT NULL, 
    [StartDate] DATE NOT NULL, 
    [StartTime] TIME NOT NULL, 
    [EndDate] DATE NOT NULL, 
    [EndTime] TIME NOT NULL, 
    [Description] NVARCHAR(MAX) NOT NULL, 
    [Miles] INT NULL, 
    [Comment] NVARCHAR(MAX) NULL,
	CONSTRAINT fk_InstructorIdExtraWork FOREIGN KEY (InstructorId) REFERENCES Instructor(InstructorId),
);

CREATE TABLE [dbo].[Student]
(
	[StudentId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [EmergencyName] NVARCHAR(50) NULL, 
    [EmergencyNumber] NVARCHAR(50) NULL, 
    [EmergencyRelation] NVARCHAR(50) NULL, 
    [IsPaperWorkComplete] BIT NOT NULL DEFAULT 0,
	CONSTRAINT fk_PersonIdStudent FOREIGN KEY (StudentId) REFERENCES Person(PersonId),
);


CREATE TABLE [dbo].[Event]
(
	[EventId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(MAX) NULL, 
    [EventTypeId] INT NOT NULL,
	[StartDate] DATE NOT NULL, 
    [StartTime] TIME NOT NULL, 
    [EndDate] DATE NOT NULL, 
    [EndTime] TIME NOT NULL, 
    [CourseId] INT NOT NULL, 
    [CreatedDate] DATE NOT NULL, 
    [CreatedBy] INT NOT NULL, 
    [UpdatedDate] DATE NULL, 
    [UpdatedBy] INT NULL, 
	CONSTRAINT fk_EventTypeIdEvent FOREIGN KEY (EventTypeId) REFERENCES EventType(EventTypeId),
	CONSTRAINT fk_CourseIdEvent FOREIGN KEY (CourseId) REFERENCES Course(CourseId),
	CONSTRAINT fk_CreatedByEvent FOREIGN KEY (CreatedBy) REFERENCES Person(PersonId),
	CONSTRAINT fk_UpdatedByEvent FOREIGN KEY (UpdatedBy) REFERENCES Person(PersonId),
	
);


CREATE TABLE [dbo].[EventInstructor]
(
    [EventInstructorId] INT NOT NULL PRIMARY KEY IDENTITY,
    [EventId] INT NOT NULL, 
    [InstructorId] INT NOT NULL,
    [Date] DATE NOT NULL,
    [ACCEPTED] BIT NOT NULL DEFAULT 0,
    CONSTRAINT fk_EventIdEventInstructor FOREIGN KEY (EventId) REFERENCES Event(EventId),
    CONSTRAINT fk_InstructorIdEventInstructor FOREIGN KEY (InstructorId) REFERENCES Instructor(InstructorId)
);


CREATE TABLE [dbo].[StudentEvent]
(
	[StudentEventId] INT NOT NULL PRIMARY KEY Identity, 
    [RegistrationDate] DATE NOT NULL, 
    [EventId] INT NOT NULL, 
    [StudentId] INT NOT NULL,
	CONSTRAINT fk_EventIdStudentEvent FOREIGN KEY (EventId) REFERENCES Event(EventId),
	CONSTRAINT fk_StudentIdStudentEvent FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
);

