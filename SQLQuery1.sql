-- Nettoyage des données 
-- (Supprimer Les lignes vides)

DELETE FROM stolen_vehicles
WHERE vehicle_type IS NULL
OR vehicle_desc IS NULL;

-- (Supprimer Les colonnes inutiles)

ALTER TABLE stolen_vehicles
DROP COLUMN vehicle_desc, color;

-- Ajouter une nouvelle colonne pour stocker le nom du jour
ALTER TABLE stolen_vehicles
ADD DayOfWeek NVARCHAR(50); 


-- Update the new column with the day names
UPDATE stolen_vehicles
SET DayOfWeek = DATENAME(dw, [DATE]);

--Affichage
select DayOfWeek, COUNT (*) AS NumStolen
from stolen_vehicles
group by DayOfWeek
Order By NumStolen DESC;
