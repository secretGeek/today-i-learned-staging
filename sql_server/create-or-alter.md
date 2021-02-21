# Create of alter for stored procedures and views etc



It's better to `alter` a stored procedure than to `drop` it and re `create` it.

(It's better because it doesn't drop any 'custom' grants you've applied. And it's less typing.)

But here's something that's better again:


	create or alter procedure MySproc

...because: no need to test for existence before creating


No more:


	if exists ( select *
            from   sysobjects
            where  id = object_id(N'[dbo].[MySproc]')
                   and objectproperty(id, N'IsProcedure') = 1 )
	begin
		--create procedure [dbo].[MySproc]
	end
	else
	begin
		--alter procedure [dbo].[MySproc]
	end