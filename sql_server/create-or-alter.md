# create of alter for stored procedures and views etc



it's better to `alter` a stored procedure than to `drop` it and re `create` it.

but here's something that's better again:


	create or alter procedure MySproc

and: no need to test for existence before creating. no more:


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