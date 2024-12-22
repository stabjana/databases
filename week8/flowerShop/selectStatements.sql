-- which farmer is growing roses?

select farmerName from farmer
natural join farmer_grows_flower
natural join flower
where flowerName = 'Rose'
order by farmerName asc;

select farmerName from farmer
inner join farmer_grows_flower on farmer_grows_flower.farmerId=farmer.farmerId
inner join flower on farmer_grows_flower.flowerId=flower.flowerId
where flowerName='Rose'
order by farmerName asc;

select farmerName from farmer as farmer
inner join farmer_grows_flower as fgf on fgf.farmerId=f.farmerId
inner join flower as flo on fgf.flowerId=flo.flowerId
where flowerName='Rose';

--- flower that needs sunny side

select flowerName from flower
natural join growingSite
where siteType='sunny';

-- all sites in use with all informations

select * from farmer
natural join farmer_grows_flower
natural join flower
natural join growingSite;