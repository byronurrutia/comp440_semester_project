-- =============================================
-- Create database template
-- =============================================
USE master
GO

-- Drop the database if it already exists
IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'managment_systemdb'
)
DROP DATABASE managment_systemdb
GO

CREATE DATABASE managment_systemdb
GO

-- =========================================
-- Create table template
-- =========================================
USE managment_systemdb
CREATE TABLE Product
(
	product_id int PRIMARY KEY,
	product_name varchar(75) NOT NULL
)
GO

-- =========================================
-- Create table template
-- =========================================
USE managment_systemdb
CREATE TABLE Work_Type_Category
(
	work_type_category_id int NOT NULL PRIMARY KEY,
	parent_work_type_id int FOREIGN KEY REFERENCES Work_Type_Category(work_type_category_id),
	product_id int NOT NULL FOREIGN KEY REFERENCES Product(product_id),
	work_type_catagory_title varchar(75) NOT NULL
)
GO

-- =========================================
-- Create table template
-- =========================================
USE managment_systemdb
CREATE TABLE Work_Type
(
	work_type_id int NOT NULL PRIMARY KEY,
	work_type_category_id int NOT NULL FOREIGN KEY REFERENCES Work_Type_Category(work_type_category_id),
	work_type_title varchar(75) NOT NULL,
	work_type_activity varchar(75) NOT NULL
)
GO

-- =========================================
-- Create table template
-- =========================================
USE managment_systemdb
CREATE TABLE work_type_description
(
	work_type_description_id int NOT NULL PRIMARY KEY,
	work_type_id INT NOT NULL FOREIGN KEY REFERENCES Work_Type(work_type_id),
	work_type_description varchar(MAX) NOT NULL,
)
GO

-- =========================================
-- Create table template
-- =========================================
USE managment_systemdb
CREATE TABLE work_type_timeline
(
	work_type_timeline_id int NOT NULL PRIMARY KEY,
	work_type_id INT NOT NULL FOREIGN KEY REFERENCES Work_Type(work_type_id),
	work_type_created_date date NOT NULL DEFAULT GETDATE(),
	work_type_release_date date,
	work_type_notification_date date,
)
GO

-- =========================================
-- Create table template
-- =========================================
USE managment_systemdb
CREATE TABLE work_type_author
(
	work_type_author_id int NOT NULL PRIMARY KEY,
	work_type_id INT NOT NULL FOREIGN KEY REFERENCES Work_Type(work_type_id),
	work_type_system_origin varchar(75) NOT NULL,
	work_type_creator_reportor varchar(75) NOT NULL
)
GO

-- =========================================
-- Create table template
-- =========================================
USE managment_systemdb
CREATE TABLE work_type_software_version
(
	work_type_software_version_id int NOT NULL PRIMARY KEY,
	work_type_id INT NOT NULL FOREIGN KEY REFERENCES Work_Type(work_type_id),
	software_version varchar(25) NOT NULL,
	release_number varchar(25) NOT NULL
)
GO

-- =========================================
-- Insert Data
-- =========================================
INSERT INTO Product (product_id, product_name)
VAlUES (1, 'product1')
GO
INSERT INTO Work_Type_Category(work_type_category_id, parent_work_type_id, product_id, work_type_catagory_title)
VAlUES (1, NULL, 1, 'Feature'),
(4, 1, 1, 'User Story'),
(5, 4, 1, 'Task'),
(6, 4, 1, 'Task'),
(7, 4, 1, 'Task'),
(8, 4, 1, 'Bug'),
(16, 4, 1, 'Bug'),
(17, 4, 1, 'Bug'),
(27, NULL, 1, 'Feature'),
(250, 27, 1, 'User Story'),
(251, 250, 1, 'Task'),
(254, 250, 1, 'Task'),
(255, 250, 1, 'Task'),
(256, 250, 1, 'Task'),
(259, NULL, 1, 'User Story'),
(260, 259, 1, 'Bug'),
(261, 259, 1, 'Bug'),
(262, 30, 1, 'User Story'),
(263, NULL, 1, 'Task'),
(264, 30, 1, 'Bug'),
(265, 250, 1, 'User Story'),
(30, NULL, 1, 'Feature'),
(266, NULL, 1, 'User Story'),
(267, 30, 1, 'User Story'),
(268, 30, 1, 'User Story'),
(269, 30, 1, 'User Story'),
(270, 30, 1, 'User Story')
GO

INSERT INTO Work_Type (work_type_id, work_type_category_id, work_type_title, work_type_activity)
VALUES (1, 1, 'WebSite Content', 'Development'),
(2, 4, 'Current layout needs change to the new look', 'Development'),
(3, 5, 'Change the website CSS file to implement colors, fonts, logo, and layout', 'Development'),
(4, 6, 'Add Submenues to the website', 'Development'),
(5, 7, 'add Main xxx Page Text', 'Development'),
(6, 8, 'Fix Sitemap', 'Support'),
(7, 16, 'Web Site, Training Center: create a sub menu for the demo', 'Support'),
(8, 17, 'Web Site, Training Center: do an error catching', 'Development'),
(9, 27, 'WebSite Graphics and Layout', 'Development'),
(10, 250, 'Preparing Site for New xxxxxs Promotion', 'Support'),
(11, 251, 'Split the page', 'Support'),
(12, 254, 'Change the Flier', 'Development'),
(13, 255, 'Testing Quote request', 'Development'),
(14, 256, 'Testing Trial Request', 'Development'),
(15, 259, 'Bugs from Prior Development', 'Development'),
(16, 260, 'Selected Menu Item Does Not Change Color', 'Support'),
(17, 261, 'Hints under the menu items', 'Support'),
(18, 262, 'Allow traffic tracking for the Wiki', 'Development'),
(19, 263, ' change colors ', 'Development'),
(20, 264, 'Fix Sitemap', 'Support'),
(21, 265, 'SALES: develop a template', 'Development'),
(22, 30, 'WebSite Analytics', 'Development'),
(23, 266, 'Get a Credit Card provider quick books', 'Development'),
(24, 267, 'Add Google Analytics Everywhere in the Wiki', 'Development'),
(25, 268, 'Add the keywords everywhere in the wiki to move SEO up', 'Development'),
(26, 269, 'Add interlinking between wiki and the site', 'Support'),
(27, 270, 'Add Bing Analytics plugin', 'Support')
GO

INSERT INTO work_type_description (work_type_description_id, work_type_id, work_type_description)
VALUES (1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget elit lobortis, viverra lorem et, elementum nibh. Aenean scelerisque nulla sed quam aliquam, ut volutpat eros lacinia. Phasellus fringilla lectus lectus, in eleifend nulla condimentum et. Donec feugiat ornare libero, ac laoreet ipsum tincidunt sit amet. Curabitur blandit scelerisque malesuada. Praesent quis tortor orci. Nullam vitae elementum orci. Aenean sodales leo turpis, at rhoncus lacus facilisis ut. Praesent a magna vitae magna suscipit aliquet. Cras quis nisi vitae neque tempus consectetur. Curabitur dolor velit, facilisis faucibus arcu nec, elementum tempus arcu. Donec non dui finibus, luctus neque vel, vehicula nulla. Sed feugiat est ligula, id luctus nunc convallis sit amet.'),
(2, 2, 'orem ipsum dolor sit amet, consectetur adipiscing elit. Etiam condimentum odio sed mi vehicula consequat. ngue, sit amet mattis ex porta.'),
(3, 3, 'orem ipsum dolor sit amet, consectetur adipiscing elit. Etiam condimentum odio sed mi vehicula consequat. Nulla condimentum neque id convallis bibendum.  vehicula auctor. Morbi mattis, tortor in rutrum faucibus, felis quam interdum ipsum, eu molestie ante dolor et leo. Nullam fringilla vel nisi non tincidunt. Praesent commodo, nunc ac venenatis consectetur, nunc massa tristique risus, ut ultrices tellus nunc at augue. Suspendisse potenti. Suspendisse potenti. Quisque ac nisi finibus, volutpat lacus eget, faucibus nisl. Quisque sed nunc risus. Etiam ultrices varius interdum.'),
(4, 3, 'Mauris sed commodo orci. Nunc nulla turpis, lobortis sed tortor vitae, mollis fermentum eros. Ut laoreet facilisis purus non commodo. Vivamus mattis eros sodales rhoncus scelerisque. Fusce laoreet sapien sed nibh ornare blandit. Aliquam vulputate vulputate mauris id molestie. Pellentesque eget risus pulvinar, iaculis nisl aliquet, ornare nisi. Mauris porttitor ipsum a turpis fringilla, sit amet interdum nisl gravida. Nam cursus elementum tellus, nec rutrum dui malesuada id. Vestibulum interdum gravida eros, sed vestibulum diam convallis accumsan. Nullam porttitor nibh id est congue, sit amet mattis ex porta.'),
(5, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut orci scelerisque, viverra purus sed, ultrices mauris. Vestibulum imperdiet vitae libero eu ornare. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas tincidunt gravida est ut feugiat. Nulla magna magna, posuere non risus vel, aliquam lacinia felis. Phasellus eu augue id enim feugiat eleifend. Duis sit amet ligula imperdiet, euismod felis in, placerat risus. Duis ultrices magna eget ultrices viverra.'),
(6, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut orci scelerisque, viverra purus sed, ultrices mauris. Vestibulum imperdiet vitae libero eu ornare. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas tincidunt gravida est ut feugiat. Nulla magna magna, posuere non risus vel, aliquam lacinia felis. Phasellus eu augue id enim feugiat eleifend. Duis sit amet ligula imperdiet, euismod felis in, placerat risus. Duis ultrices magna eget ultrices viverra.'),
(7, 6, 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse ultrices molestie est, eu tempus orci gravida ac. Ut augue felis, interdum at nulla congue, mattis eleifend orci. Donec lobortis, ex a ornare placerat, erat tellus iaculis justo, nec vestibulum sem tellus placerat ipsum. Morbi tincidunt quam ac aliquet ultrices. Sed interdum eros quis ligula sollicitudin gravida. Aliquam suscipit quam id iaculis varius. Phasellus dictum odio in pulvinar volutpat. Praesent et imperdiet nunc. Aliquam quis aliquam magna. Nunc sollicitudin, turpis eget mattis semper, justo nulla hendrerit felis, consectetur imperdiet ipsum massa ac lectus. Suspendisse nibh ipsum, tincidunt id augue mollis, lacinia vestibulum neque. In ullamcorper dui in nisl tempor pulvinar. Mauris non scelerisque tellus.'),
(8, 7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut orci scelerisque, viverra purus sed, ultrices mauris. Vestibulum imperdiet vitae libero eu ornare. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas tincidunt gravida est ut feugiat. Nulla magna magna, posuere non risus vel, aliquam lacinia felis. Phasellus eu augue id enim feugiat eleifend. Duis sit amet ligula imperdiet, euismod felis in, placerat risus. Duis ultrices magna eget ultrices viverra.'),
(9, 8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget elit lobortis, viverra lorem et, elementum nibh. Aenean scelerisque nulla sed quam aliquam, ut volutpat eros lacinia. Phasellus fringilla lectus lectus, in eleifend nulla condimentum et. Donec feugiat ornare libero, ac laoreet ipsum tincidunt sit amet. Curabitur blandit scelerisque malesuada. Praesent quis tortor orci. Nullam vitae elementum orci. Aenean sodales leo turpis, at rhoncus lacus facilisis ut. Praesent a magna vitae magna suscipit aliquet. Cras quis nisi vitae neque tempus consectetur. Curabitur dolor velit, facilisis faucibus arcu nec, elementum tempus arcu. Donec non dui finibus, luctus neque vel, vehicula nulla. Sed feugiat est ligula, id luctus nunc convallis sit amet.'),
(10, 9, 'In vehicula magna dignissim arcu laoreet imperdiet. Aenean bibendum et quam vitae finibus. Proin eu augue elit. Vestibulum iaculis libero est, at vulputate augue ultricies eu. Morbi ultrices viverra rhoncus. Integer eget urna vel dui tincidunt iaculis euismod nec metus. Phasellus ornare lectus quis quam porta, nec iaculis eros aliquam. Cras sed magna mollis risus tristique vulputate quis non dui. Proin sed facilisis enim. Pellentesque facilisis, felis et elementum ultricies, ex eros dignissim ipsum, et gravida dolor urna at tortor. Fusce tincidunt pulvinar nisl in consectetur. Mauris ac vulputate magna. Sed finibus at nisl pretium mollis. In neque nisl, varius egestas enim vel, maximus rhoncus metus.'),
(11, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget elit lobortis, viverra lorem et, elementum nibh. Aenean scelerisque nulla sed quam aliquam, ut volutpat eros lacinia. Phasellus fringilla lectus lectus, in eleifend nulla condimentum et. Donec feugiat ornare libero, ac laoreet ipsum tincidunt sit amet. Curabitur blandit scelerisque malesuada. Praesent quis tortor orci. Nullam vitae elementum orci. Aenean sodales leo turpis, at rhoncus lacus facilisis ut. Praesent a magna vitae magna suscipit aliquet. Cras quis nisi vitae neque tempus consectetur. Curabitur dolor velit, facilisis faucibus arcu nec, elementum tempus arcu. Donec non dui finibus, luctus neque vel, vehicula nulla. Sed feugiat est ligula, id luctus nunc convallis sit amet.'),
(12, 11, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget elit lobortis, viverra lorem et, elementum nibh. Aenean scelerisque nulla sed quam aliquam, ut volutpat eros lacinia. Phasellus fringilla lectus lectus, in eleifend nulla condimentum et. Donec feugiat ornare libero, ac laoreet ipsum tincidunt sit amet. Curabitur blandit scelerisque malesuada. Praesent quis tortor orci. Nullam vitae elementum orci. Aenean sodales leo turpis, at rhoncus lacus facilisis ut. Praesent a magna vitae magna suscipit aliquet. Cras quis nisi vitae neque tempus consectetur. Curabitur dolor velit, facilisis faucibus arcu nec, elementum tempus arcu. Donec non dui finibus, luctus neque vel, vehicula nulla. Sed feugiat est ligula, id luctus nunc convallis sit amet.'),
(13, 12, 'In vehicula magna dignissim arcu laoreet imperdiet. Aenean bibendum et quam vitae finibus. Proin eu augue elit. Vestibulum iaculis libero est, at vulputate augue ultricies eu. Morbi ultrices viverra rhoncus. Integer eget urna vel dui tincidunt iaculis euismod nec metus. Phasellus ornare lectus quis quam porta, nec iaculis eros aliquam. Cras sed magna mollis risus tristique vulputate quis non dui. Proin sed facilisis enim. Pellentesque facilisis, felis et elementum ultricies, ex eros dignissim ipsum, et gravida dolor urna at tortor. Fusce tincidunt pulvinar nisl in consectetur. Mauris ac vulputate magna. Sed finibus at nisl pretium mollis. In neque nisl, varius egestas enim vel, maximus rhoncus metus.'),
(14, 13, 'In vehicula magna dignissim arcu laoreet imperdiet. Aenean bibendum et quam vitae finibus. Proin eu augue elit. Vestibulum iaculis libero est, at vulputate augue ultricies eu. Morbi ultrices viverra rhoncus. Integer eget urna vel dui tincidunt iaculis euismod nec metus. Phasellus ornare lectus quis quam porta, nec iaculis eros aliquam. Cras sed magna mollis risus tristique vulputate quis non dui. Proin sed facilisis enim. Pellentesque facilisis, felis et elementum ultricies, ex eros dignissim ipsum, et gravida dolor urna at tortor. Fusce tincidunt pulvinar nisl in consectetur. Mauris ac vulputate magna. Sed finibus at nisl pretium mollis. In neque nisl, varius egestas enim vel, maximus rhoncus metus.'),
(15, 14, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget elit lobortis, viverra lorem et, elementum nibh. Aenean scelerisque nulla sed quam aliquam, ut volutpat eros lacinia. Phasellus fringilla lectus lectus, in eleifend nulla condimentum et. Donec feugiat ornare libero, ac laoreet ipsum tincidunt sit amet. Curabitur blandit scelerisque malesuada. Praesent quis tortor orci. Nullam vitae elementum orci. Aenean sodales leo turpis, at rhoncus lacus facilisis ut. Praesent a magna vitae magna suscipit aliquet. Cras quis nisi vitae neque tempus consectetur. Curabitur dolor velit, facilisis faucibus arcu nec, elementum tempus arcu. Donec non dui finibus, luctus neque vel, vehicula nulla. Sed feugiat est ligula, id luctus nunc convallis sit amet.'),
(16, 15, 'request menu'),
(17, 18, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget elit lobortis, viverra lorem et, elementum nibh. Aenean scelerisque nulla sed quam aliquam, ut volutpat eros lacinia. Phasellus fringilla lectus lectus, in eleifend nulla condimentum et. Donec feugiat ornare libero, ac laoreet ipsum tincidunt sit amet. Curabitur blandit scelerisque malesuada. Praesent quis tortor orci. Nullam vitae elementum orci. Aenean sodales leo turpis, at rhoncus lacus facilisis ut. Praesent a magna vitae magna suscipit aliquet. Cras quis nisi vitae neque tempus consectetur. Curabitur dolor velit, facilisis faucibus arcu nec, elementum tempus arcu. Donec non dui finibus, luctus neque vel, vehicula nulla. Sed feugiat est ligula, id luctus nunc convallis sit amet.'),
(18, 19, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget elit lobortis, viverra lorem et, elementum nibh. Aenean scelerisque nulla sed quam aliquam, ut volutpat eros lacinia. Phasellus fringilla lectus lectus, in eleifend nulla condimentum et. Donec feugiat ornare libero, ac laoreet ipsum tincidunt sit amet. Curabitur blandit scelerisque malesuada. Praesent quis tortor orci. Nullam vitae elementum orci. Aenean sodales leo turpis, at rhoncus lacus facilisis ut. Praesent a magna vitae magna suscipit aliquet. Cras quis nisi vitae neque tempus consectetur. Curabitur dolor velit, facilisis faucibus arcu nec, elementum tempus arcu. Donec non dui finibus, luctus neque vel, vehicula nulla. Sed feugiat est ligula, id luctus nunc convallis sit amet.'),
(19, 20, 'In vehicula magna dignissim arcu laoreet imperdiet. Aenean bibendum et quam vitae finibus. Proin eu augue elit. Vestibulum iaculis libero est, at vulputate augue ultricies eu. Morbi ultrices viverra rhoncus. Integer eget urna vel dui tincidunt iaculis euismod nec metus. Phasellus ornare lectus quis quam porta, nec iaculis eros aliquam. Cras sed magna mollis risus tristique vulputate quis non dui. Proin sed facilisis enim. Pellentesque facilisis, felis et elementum ultricies, ex eros dignissim ipsum, et gravida dolor urna at tortor. Fusce tincidunt pulvinar nisl in consectetur. Mauris ac vulputate magna. Sed finibus at nisl pretium mollis. In neque nisl, varius egestas enim vel, maximus rhoncus metus.'),
(20, 21, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget elit lobortis, viverra lorem et, elementum nibh. Aenean scelerisque nulla sed quam aliquam, ut volutpat eros lacinia. Phasellus fringilla lectus lectus, in eleifend nulla condimentum et. Donec feugiat ornare libero, ac laoreet ipsum tincidunt sit amet. Curabitur blandit scelerisque malesuada. Praesent quis tortor orci. Nullam vitae elementum orci. Aenean sodales leo turpis, at rhoncus lacus facilisis ut. Praesent a magna vitae magna suscipit aliquet. Cras quis nisi vitae neque tempus consectetur. Curabitur dolor velit, facilisis faucibus arcu nec, elementum tempus arcu. Donec non dui finibus, luctus neque vel, vehicula nulla. Sed feugiat est ligula, id luctus nunc convallis sit amet.'),
(21, 22, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget elit lobortis, viverra lorem et, elementum nibh. Aenean scelerisque nulla sed quam aliquam, ut volutpat eros lacinia. Phasellus fringilla lectus lectus, in eleifend nulla condimentum et. Donec feugiat ornare libero, ac laoreet ipsum tincidunt sit amet. Curabitur blandit scelerisque malesuada. Praesent quis tortor orci. Nullam vitae elementum orci. Aenean sodales leo turpis, at rhoncus lacus facilisis ut. Praesent a magna vitae magna suscipit aliquet. Cras quis nisi vitae neque tempus consectetur. Curabitur dolor velit, facilisis faucibus arcu nec, elementum tempus arcu. Donec non dui finibus, luctus neque vel, vehicula nulla. Sed feugiat est ligula, id luctus nunc convallis sit amet.'),
(22, 23, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget elit lobortis, viverra lorem et, elementum nibh. Aenean scelerisque nulla sed quam aliquam, ut volutpat eros lacinia. Phasellus fringilla lectus lectus, in eleifend nulla condimentum et. Donec feugiat ornare libero, ac laoreet ipsum tincidunt sit amet. Curabitur blandit scelerisque malesuada. Praesent quis tortor orci. Nullam vitae elementum orci. Aenean sodales leo turpis, at rhoncus lacus facilisis ut. Praesent a magna vitae magna suscipit aliquet. Cras quis nisi vitae neque tempus consectetur. Curabitur dolor velit, facilisis faucibus arcu nec, elementum tempus arcu. Donec non dui finibus, luctus neque vel, vehicula nulla. Sed feugiat est ligula, id luctus nunc convallis sit amet.'),
(23, 24, 'In vehicula magna dignissim arcu laoreet imperdiet. Aenean bibendum et quam vitae finibus. Proin eu augue elit. Vestibulum iaculis libero est, at vulputate augue ultricies eu. Morbi ultrices viverra rhoncus. Integer eget urna vel dui tincidunt iaculis euismod nec metus. Phasellus ornare lectus quis quam porta, nec iaculis eros aliquam. Cras sed magna mollis risus tristique vulputate quis non dui. Proin sed facilisis enim. Pellentesque facilisis, felis et elementum ultricies, ex eros dignissim ipsum, et gravida dolor urna at tortor. Fusce tincidunt pulvinar nisl in consectetur. Mauris ac vulputate magna. Sed finibus at nisl pretium mollis. In neque nisl, varius egestas enim vel, maximus rhoncus metus.'),
(24, 25, 'Lorem'),
(25, 26, 'Lorem'),
(26, 27, 'Ipsum')
GO

INSERT INTO work_type_timeline (work_type_timeline_id, work_type_id, work_type_created_date, work_type_release_date, work_type_notification_date)
VALUES (1, 1, '12-9-2018', NULL, NULL),
(2, 2, '1-1-2018', '2-2-2018', '1-30-2018'),
(3, 3, '1-1-2018', '2-2-2018', '1-30-2018'),
(4, 4, '1-1-2018', '2-2-2018', '1-30-2018'),
(5, 5, '1-1-2018', '2-2-2018', '1-30-2018'),
(6, 6, '1-1-2018', '2-2-2018', '1-30-2018'),
(7, 7, '1-1-2018', '2-2-2018', '1-30-2018'),
(8, 8, '1-9-2018', '2-2-2018', '1-30-2018'),
(9, 9, '1-9-2018', NULL, NULL),
(10, 10, '1-9-2018', NULL, NULL),
(11, 11, '1-9-2018', NULL, NULL),
(12, 12, '1-9-2018', NULL, NULL),
(13, 13, '1-9-2018', NULL, NULL),
(14, 14, '1-9-2018', NULL, NULL),
(15, 15, '1-9-2018', '2-22-2018', '2-15-2018'),
(16, 16, '1-9-2018', '2-22-2018', '2-15-2018'),
(17, 17, '1-9-2018', '2-22-2018', '2-15-2018'),
(18, 18, '1-16-2018', '2-22-2018', '2-15-2018'),
(19, 19, '1-16-2018', '2-22-2018', '2-15-2018'),
(20, 20, '1-16-2018', '2-22-2018', '2-15-2018'),
(21, 21, '1-16-2018', '2-22-2018', '2-15-2018'),
(22, 22, '1-9-2018', NULL, NULL),
(23, 23, '1-16-2018', '2-22-2018', '2-15-2018'),
(24, 24, '1-16-2018', '2-22-2018', '2-15-2018'),
(25, 25, '1-16-2018', '2-22-2018', '2-15-2018'),
(26, 26, '1-16-2018', '2-22-2018', '2-15-2018'),
(27, 27, '1-16-2018', '2-22-2018', '2-15-2018')
GO

INSERT INTO work_type_author (work_type_author_id, work_type_id,  work_type_system_origin, work_type_creator_reportor)
VALUES (1, 1, 'TFS', 'HH'),
(2, 2, 'TFS', 'HH'),
(3, 3, 'TFS', 'HH'),
(4, 4, 'TFS', 'HH'),
(5, 5, 'TFS', 'HH'),
(6, 6, 'SupportSystem', 'Client1'),
(7, 7, 'SupportSystem', 'Client1'),
(8, 8, 'TFS', 'HH'),
(9, 9, 'TFS', 'HH'),
(10, 10, 'TFS', 'HH'),
(11, 11, 'TFS', 'HH'),
(12, 12, 'TFS', 'HH'),
(13, 13, 'TFS', 'HH'),
(14, 14, 'TFS', 'HH'),
(15, 15, 'SupportSystem', 'Client2'),
(16, 16, 'SupportSystem', 'Client2'),
(17, 17, 'SupportSystem', 'Client2'),
(18, 18, 'SupportSystem', 'Client2'),
(19, 19, 'SupportSystem', 'Client2'),
(20, 20, 'SupportSystem', 'Client1'),
(21, 21, 'TFS', 'HH'),
(22, 22, 'TFS', 'HH'),
(23, 23, 'TFS', 'HH'),
(24, 24, 'TFS', 'HH'),
(25, 25, 'TFS', 'HH'),
(26, 26, 'TFS', 'HH'),
(27, 27, 'TFS', 'HH')
GO

INSERT INTO work_type_software_version (work_type_software_version_id, work_type_id, release_number, software_version)
VALUES (1, 1, '1.1.8', '1.1.8.1'),
(2, 2, '1.1.8', '1.1.8.1'),
(3, 3, '1.1.8', '1.1.8.1'),
(4, 4, '1.1.8', '1.1.8.1'),
(5, 5, '1.1.8', '1.1.8.1'),
(6, 6, '1.1.8', '1.1.8.1'),
(7, 7, '1.1.8', '1.1.8.1'),
(8, 8, '1.1.8', '1.1.8.1'),
(9, 9, '1.1.8', '1.1.8.2'),
(10, 10, '1.1.8', '1.1.8.2'),
(11, 11, '1.1.8', '1.1.8.2'),
(12, 12, '1.1.8', '1.1.8.2'),
(13, 13, '1.1.8', '1.1.8.2'),
(14, 14, '1.1.8', '1.1.8.2'),
(15, 15, '1.1.9', '1.1.9.1'),
(16, 16, '1.1.9', '1.1.9.1'),
(17, 17, '1.1.9', '1.1.9.1'),
(18, 18, '1.1.9', '1.1.9.1'),
(19, 19, '1.1.9', '1.1.9.1'),
(20, 20, '1.1.9', '1.1.9.1'),
(21, 21, '1.1.9', '1.1.9.1'),
(22, 22, '1.1.8', '1.1.8.2'),
(23, 23, '1.1.9', '1.1.9.1'),
(24, 24, '1.1.9', '1.1.9.1'),
(25, 25, '1.1.9', '1.1.9.1'),
(26, 26, '1.1.9', '1.1.9.1'),
(27, 27, '1.1.9', '1.1.9.1')
GO

-- =========================
-- Drop Database Template
-- =========================
USE master
GO

ALTER DATABASE managment_systemdb SET OFFLINE

IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'managment_systemdb'
)
DROP DATABASE managment_systemdb
GO