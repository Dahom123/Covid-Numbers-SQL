select 
location,date,population,new_cases,total_deaths, (total_deaths/total)*100
from Death
order by 1,2

SELECT location,date,total_cases,new_cases,population ,total_deaths ,(total_deaths/total_cases)*100
from Coviddeath
--looking at total cases vs total deaths

alter table Coviddeath
alter column total_cases int; 
--# alter data type #
--shows what percanatge of population got covid 

SELECT location,date,new_cases,population ,total_deaths ,(total_cases/population)*100 as Death_percentag
from Coviddeath

--looking at countries with highest infecction rate compered to the popoulation 

SELECT location,population ,max (total_cases) as Highstinfection_count ,max((total_cases/population))*100 as PercentpopoulationInfected
from Coviddeath

Group by population,location 
order by PercentpopoulationInfected desc



--showing countries with highets death count per population  

SELECT location, max(total_deaths) as TotalDeathCount
from Coviddeath
group by location
order by TotalDeathCount desc


--lest break things down by continenet 
--shwoing the continent with the hights death count per population  


SELECT continent, max(total_deaths) as TotalDeathCount
from Coviddeath
where continent is not null 
group by continent
 
order by TotalDeathCount desc

--Global numbers 
select 
SUM (new_cases) as total_cases ,SUM (new_deaths) as total_deaths, Sum (cast(new_cases as int))/SUM(cast(new_deaths as int ))*100 as DeathPercentage 
from Coviddeath
--where location like '%atates'%
where continent is not null 
order by 1,2

--looking at total vacsination vs total population 

select dea.continent , dea.location, dea.date, vac.new_vaccinations 
from Vacsination vac
join Coviddeath dea
   on dea.location=vac. continent
   and dea.date=vac.date

order by 1,2,3

