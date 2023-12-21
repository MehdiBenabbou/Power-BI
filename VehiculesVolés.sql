-- Nettoyage des données 
-- Supprimer Les lignes vides

DELETE FROM stolen_vehicles
WHERE vehicle_type IS NULL
OR vehicle_desc IS NULL;

-- Supprimer Les colonnes inutiles

ALTER TABLE stolen_vehicles
DROP COLUMN vehicle_desc, color;

-- Ajouter une nouvelle colonne pour stocker le nom du jour
ALTER TABLE stolen_vehicles
ADD DayOfWeek NVARCHAR(50); 


-- Mettre à jour la nouvelle colonne avec les noms des jours
UPDATE stolen_vehicles
SET DayOfWeek = DATENAME(dw, [DATE]);

--Affichage
select DayOfWeek, COUNT (*) AS NumStolen
from stolen_vehicles
group by DayOfWeek
Order By NumStolen DESC;


--Type de vehicules plus souvent volés et les moins souvent volés
select vehicle_type, COUNT (*) AS NumStolen
from stolen_vehicles
group by vehicle_type
Order by NumStolen DESC;

--Regions ont le plus et le moins de véhicules volés
selec region, COUNT(*) AS NumStolen
from locations ls, stolen_vehicles sv
where ls.location_id = sv.location_id
group by ls.region
Order by NumStolen DESC;


