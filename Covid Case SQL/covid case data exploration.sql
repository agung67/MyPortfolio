---Querry for power BI

select SUM(new_cases) AS total_cases ,SUM(cast(new_deaths as int)) AS total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases) * 100 as DeathPercentage
from Portfolio..covid_death$
where continent is not null
order by 1,2;


select continent, MAX(cast(total_deaths as int)) as totaldeathcount
from Portfolio..covid_death$
where continent is not null
group by continent
order by totaldeathcount desc;

select location, population, MAX(total_cases) as HighestInfectionCount,MAX(total_cases/population)*100 As PopulationPercentageInfected
from Portfolio..covid_death$
group by location,population
order by PopulationPercentageInfected desc;

select location, population, date, MAX(total_cases) as HighestInfectionCount,MAX(total_cases/population)*100 As PopulationPercentageInfected
from Portfolio..covid_death$
group by location,population,date
order by PopulationPercentageInfected desc;



--data exploration


--print number of people who are vaccinated in Indonesia.
select *
from Portfolio..covid_vaccinated$
where location = 'Indonesia'
order by 3,4;

--print number of people who died with total cases and new cases in Indonesia.

select location, date, total_cases,new_cases, total_deaths, population
from Portfolio..covid_death$
where location = 'Indonesia'
order by 1,2;

--print percentage of death of new cases in Indonesia.
select location, date, total_cases,new_cases, total_deaths, (total_deaths/total_cases)*100 As Deathpercentage
from Portfolio..covid_death$
where location = 'Indonesia'
order by 1,2;




select location, SUM(cast(new_deaths as int)) as totaldeathcount
from Portfolio..covid_death$
where continent is null
group by location
order by totaldeathcount desc;




--printing continents with highest death count

--global covid numbers

select SUM(new_cases) AS total_cases ,SUM(cast(new_deaths as int)) AS total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases) * 100 as DeathPercentage
from Portfolio..covid_death$
where continent is not null
order by 1,2;

--indonesia covid numbers

select SUM(new_cases) AS total_cases ,SUM(cast(new_deaths as int)) AS total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases) * 100 as DeathPercentage
from Portfolio..covid_death$
where location ='Indonesia'
order by 1,2;


---join death and vaccination tables

select * 
from Portfolio..covid_death$ death
join Portfolio..covid_vaccinated$ vaxx
	on death.location = vaxx.location
	and death.date = vaxx.date



--population vs vaccination global

select death.continent, death.location, death.date, death.population, vaxx.new_vaccinations
from Portfolio..covid_death$ death
join Portfolio..covid_vaccinated$ vaxx
	on death.location = vaxx.location
	and death.date = vaxx.date

where death.continent is not null
order by 1,2,3

--indonesia population vs vaccination

select death.continent, death.location, death.date, death.population, vaxx.new_vaccinations
from Portfolio..covid_death$ death
join Portfolio..covid_vaccinated$ vaxx
	on death.location = vaxx.location
	and death.date = vaxx.date

where death.location = 'Indonesia'
order by 1,2,3

--join table

select death.continent, death.location, death.date, death.population, vaxx.new_vaccinations
, SUM(CONVERT(BIGINT,vaxx.new_vaccinations)) OVER (Partition by death.location Order by death.location, death.date ROWS UNBOUNDED PRECEDING) as RollingPeopleVaccinated
from Portfolio..covid_death$ death
join Portfolio..covid_vaccinated$ vaxx
	on death.location = vaxx.location
	and death.date = vaxx.date

where death.continent is not null
order by 1,2,3

select death.continent, death.location, death.date, death.population, vaxx.new_vaccinations
, SUM(CONVERT(BIGINT,vaxx.new_vaccinations))
OVER (Partition by death.location Order by death.location
, death.date ROWS UNBOUNDED PRECEDING) as RollingPeopleVaccinated
from Portfolio..covid_death$ death
join Portfolio..covid_vaccinated$ vaxx
	on death.location = vaxx.location
	and death.date = vaxx.date

where death.continent is not null
order by 1,2,3

--USING CTE

--select here
with PopvsVAC (continent, location, date, population, new_vaccinations,RollingPeopleVaccinated)
as
(

select death.continent, death.location, death.date, death.population, vaxx.new_vaccinations
, SUM(CONVERT(BIGINT,vaxx.new_vaccinations))
OVER (Partition by death.location Order by death.location
, death.date ROWS UNBOUNDED PRECEDING) as RollingPeopleVaccinated
from Portfolio..covid_death$ death
join Portfolio..covid_vaccinated$ vaxx
	on death.location = vaxx.location
	and death.date = vaxx.date

where death.continent is not null
--order by 1,2,3

)
select * , (RollingPeopleVaccinated/population)*100
from PopvsVac
--to here




--temporary table


--block this part from here

drop table if exist #percentpopulationvaccinated

create table #percentpopulationvaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
RollingPeopleVaccinated numeric,
)

insert into #percentpopulationvaccinated

select death.continent, death.location, death.date, death.population, vaxx.new_vaccinations
, SUM(CONVERT(BIGINT,vaxx.new_vaccinations))
OVER (Partition by death.location Order by death.location
, death.date ROWS UNBOUNDED PRECEDING) as RollingPeopleVaccinated
from Portfolio..covid_death$ death
join Portfolio..covid_vaccinated$ vaxx
	on death.location = vaxx.location
	and death.date = vaxx.date
	


--to here

--then execute here
select * , (RollingPeopleVaccinated/population)*100
from #percentpopulationvaccinated;

--Note: Query may take longer than usual

create view percentpopulationvaccinated as
select death.continent, death.location, death.date, death.population, vaxx.new_vaccinations
, SUM(CONVERT(BIGINT,vaxx.new_vaccinations))
OVER (Partition by death.location Order by death.location
, death.date ROWS UNBOUNDED PRECEDING) as RollingPeopleVaccinated
from Portfolio..covid_death$ death
join Portfolio..covid_vaccinated$ vaxx
	on death.location = vaxx.location
	and death.date = vaxx.date

where death.continent is not null
--order by 1,2,3



select * from percentpopulationvaccinated