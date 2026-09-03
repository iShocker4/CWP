# CWP — CustomWeapon

เอกสารนี้สรุปอาวุธ custom ในแพ็กเกจ `CWP` และค่าที่ถูกปรับแต่งใน source ปัจจุบัน โดยอ้างอิงจาก `Classes/`, `KFWeapDef_*.uc` และ localization file `Localization/INT/CWP.int` ที่อยู่ด้านนอกโฟลเดอร์ Git ของแพ็กเกจนี้

สถานะเอกสาร: 18 สิงหาคม 2026

## ภาพรวม

- มี active `WeaponDef` ทั้งหมด 57 รายการ
- อาวุธ custom ส่วนใหญ่ inherit จากอาวุธ KF2 เดิม แล้ว override เฉพาะ damage, recoil, fire interval, reload, ammo, control power หรือพฤติกรรมพิเศษที่ระบุไว้
- รายละเอียดที่ผู้เล่นเห็นในร้านค้าอยู่ใน `..\Localization\INT\CWP.int`
- ชื่อและคำอธิบายใน `.int` ต้องตรงกับ `WeaponClassPath` และ `GetItemDescription()` ของ WeaponDef
- ตารางด้านล่างใช้ damage รวมต่อหนึ่งการยิงสำหรับ shotgun เพื่อให้อ่านง่าย ไม่ใช่ damage ต่อ pellet

## ค่าที่ควรรู้เกี่ยวกับ reload

ใน UnrealScript ค่า `GetReloadRateScale()` เป็นตัวคูณเวลา reload ไม่ใช่เปอร์เซ็นต์ตรง ๆ:

| ตัวคูณเวลา | ความหมาย |
|---:|---|
| `0.85` | เร็วขึ้น 15% |
| `0.75` | เร็วขึ้น 25% |
| `0.70` | เร็วขึ้น 30% |
| `0.55` | เร็วขึ้น 45% |

เงื่อนไข `AmmoCount[0] > 0` หมายถึงตอนเริ่ม reload ยังมีกระสุนเหลือในแม็ก จึงได้ bonus แบบ tactical/partial reload ตามที่ระบุในแต่ละอาวุธ

## Deagle และ AF2011

### Deagle Ex

| อาวุธ | การปรับแต่ง |
|---|---|
| Deagle Ex | Reload เร็วขึ้น 20% เมื่อยังมีกระสุน, recoil ตรงกับ vanilla (`max/min recoil 650/550`), fire interval `0.20` = 300 RPM |
| Dual Deagle Ex | Reload เร็วขึ้น 20% เมื่อยังมีกระสุน, recoil ตรงกับ vanilla (`650/550`), fire interval `0.11` = ประมาณ 545 RPM ทั้ง default และ alt-fire |
| Deagle AT | สืบทอด recoil/reload ของ Deagle Ex และ right-click ใช้สลับ full-auto, 300 RPM |
| Dual Deagle AT | สืบทอด recoil/reload ของ Dual Deagle Ex และ right-click ใช้สลับ full-auto, 545 RPM |
| Evil Deagle | รุ่น Meme แบบเดี่ยว, damage 115 ต่อกระสุน, 350 RPM, แม็ก 12 นัด, reserve 132 นัด, recoil `325/325` |
| Dual Evil's Deagle | รุ่น Meme แบบคู่, damage 115 ต่อกระสุนทั้งสอง fire mode, 650 RPM, แม็ก 24 นัด, reserve 264 นัด, recoil `325/325` |

ค่า fire interval ของ Deagle ปกติและ Dual Deagle ถูกตรวจเทียบกับ source vanilla แล้ว โดยใช้ `0.20` และ `0.11` ตามลำดับ

### AF2011

- `AF2011 Ex`: 316 RPM, penetration 1.5, ลด control power ของ knockdown/stumble/gun hit และมี reload เร็วขึ้น 20% เมื่อยังมีกระสุน / ใช้ความเร็ว Vanilla เมื่อแม็กหมด
- `Dual AF2011 Ex`: 462 RPM, penetration 1.5, ใช้ reload และ control-power behavior เดียวกัน
- `AF2011 Ex AT`: ชื่อหน้าร้านคือ **AF2011 Ex AT**, เพิ่ม right-click full-auto และใช้ 316 RPM
- `Dual AF2011 AT`: เพิ่ม right-click full-auto และใช้ 462 RPM

## Support shotguns

Support shotgun ทั้งหมดใช้ damage รวมต่อการยิงในคำอธิบายร้านค้า ส่วน source ยังคงตั้ง damage เป็นต่อ pellet และให้ engine รวมตามจำนวน pellet

| อาวุธ | Damage รวม | RPM / penetration | Reload |
|---|---:|---|---|
| AA-12 Ex | 168 ต่อการยิง (+20%) | 300 RPM / 2 | เร็วขึ้น 15%; ถ้ายังมีกระสุนรวม 30% |
| Double-Barreled Boomstick Ex | 275 ยิงลำกล้องเดียว / 550 ยิงสองลำกล้อง (+10%) | 240 RPM / 2 | เร็วขึ้น 25%; ถ้ายังมีกระสุนรวม 45% |
| Elephant Gun Ex | 264 ต่อการยิง (+10%) | 240 RPM / 4 | เร็วขึ้น 25%; ถ้ายังมีกระสุนรวม 45% |
| HZ12 Multi-Action Ex | 240 ต่อการยิง (+20%) | 600 RPM / 2 | เร็วขึ้น 15%; ถ้ายังมีกระสุนรวม 30% |
| M4 Combat Shotgun Ex | 276 ต่อการยิง (+15%) | 267 RPM / 2 | เร็วขึ้น 15% |
| S12 Shockgun Ex | 235.2 ต่อการยิง (+20%) และระเบิด alt-fire 240 (+20%) | ปกติ 300 / alt 240 RPM; penetration 2 / 0 | เร็วขึ้น 15%; ถ้ายังมีกระสุนรวม 30% |

## ปืนพกและ Revolver อื่น ๆ

| อาวุธ | การปรับแต่งปัจจุบัน |
|---|---|
| M1911 Ex | Recoil ตรงกับ vanilla (`450/400`), 343 RPM, penetration 1 |
| Dual M1911 Ex | Recoil ตรงกับ vanilla (`450/400`), 600 RPM, penetration 1 |
| M1911 AT | สืบทอด recoil vanilla, เพิ่ม right-click full-auto, 343 RPM, penetration default 1 / alt 0 |
| Dual M1911 AT | สืบทอด recoil vanilla, เพิ่ม right-click full-auto, 600 RPM default / 500 RPM alt |
| AutoMag Ex | 127 damage, 300 RPM, penetration 2, ไม่มี knockdown/stumble และมี gun hit 150 |
| Dual AutoMag Ex | 167 damage ต่อกระสุน, 450 RPM, DPM รวมประมาณ 75,150, penetration 2, gun hit 150 |
| Casull | 113 damage, 300 RPM, penetration 2, recoil คุมได้สำหรับพลัง damage และ heavy bash 300 |
| Jackal & Casull | 156 damage ต่อกระสุน, 545.45 RPM, DPM รวมประมาณ 85,091, penetration 2, heavy bash 300 |
| Glock 18C Ex | 40 damage, weight 3, 800 RPM auto / 343 RPM single, recoil ด้านข้างลด 60%, reload เร็วขึ้น 20% เมื่อยังมีกระสุน / 10% เมื่อแม็กหมด |
| Dual Glock 18C Ex | 40 damage ต่อกระสุน, weight 6, 1200 RPM, recoil ด้านข้างลด 60%, reload เร็วขึ้น 20% เมื่อยังมีกระสุน / 10% เมื่อแม็กหมด |
| Magnum Ex | 160 -> 180 damage, stumble 60 -> 40, 250 RPM, penetration 3, recoil แรงขึ้น |
| Dual Magnum Ex | 160 -> 180 damage, stumble 60 -> 40, 316 RPM, penetration 3, reload เร็วขึ้น 45% |
| Magnum AT | เหมือน Magnum Ex และเพิ่ม right-click full-auto, 250 RPM |
| Dual Magnum AT | เหมือน Dual Magnum Ex และเพิ่ม right-click full-auto, 316 RPM |

## SMG และ Medic weapons

| อาวุธ | การปรับแต่งปัจจุบัน |
|---|---|
| Kriss Ex | 36.3 damage ต่อกระสุน (+10%), 1200 RPM, penetration 0 |
| MP7 Ex | 21.6 damage ต่อกระสุน (+35%), 952 RPM, penetration 0 |
| P90 Ex | 36 damage ต่อกระสุน (+20%), 857 RPM default / 600 RPM alt, penetration 0 |
| Medic SMG Ex | Heal 15 -> 10, dart cost 40 -> 25, alt-fire ยิง 2 darts, ใช้ secondary slot และมีคำสั่ง `togglelockon` |
| Medic Rifle Ex | Recoil แนวตั้งแรงขึ้นเล็กน้อย, มี `togglelockon`, 750 RPM default / 343 RPM alt |
| Hemoclogger Ex | Damage 120 -> 100, แม็ก/กระสุนสำรอง 7/112 -> 6/56, heal 25 -> 20, DoT เปลี่ยนจาก bleeding เป็น toxic และมี `togglelockon` |

## Assault rifles และ LMG

| อาวุธ | การปรับแต่งปัจจุบัน |
|---|---|
| AK-12 Ex | Damage 40 -> 46, weight 6 -> 7, recoil คุม burst ได้มั่นคงขึ้น, 600 RPM default / 1000 RPM alt |
| SA80 L85A2 Bullpup Ex | Damage 32 -> 33, recoil steadier, 660 RPM default / 600 RPM alt |
| FN FAL (4x Scope) | Damage 70 -> 75, fire rate 606 -> 496 RPM, recoil หนักขึ้นและดึงขวา, reload เร็วขึ้น 5% |
| diamondhead's FN FAL | Damage 70 -> 91, fire rate 606 -> 496 RPM, ไม่มี side pull, Sharpshooter reload เร็วขึ้น 25% เมื่อ Tactical Reload ไม่ทำงาน, empty-mag reload เร็วขึ้นอีก 8.25%, weight 8 -> 9 |
| FN FAL (2x Scope) | Damage 70 -> 60, scope 4x -> 2x, fire rate 606 -> 700 RPM, กระสุนสำรอง 160 -> 280, reload เร็วขึ้น 5%, recoil steadier, penetration 0 |
| SCAR Ex | fire rate 600 -> 625 RPM ทั้งสอง fire mode, recoil แนวตั้งแรงขึ้นเล็กน้อย |
| SCAR NonoN | Damage 55 -> 80, fire rate 625 -> 650 RPM, แม็ก/กระสุนสำรอง 20/340 -> 30/570, reload เร็วขึ้น 15% เมื่อยังมีกระสุน / 10% เมื่อแม็กหมด, ราคา 1500 -> 16000 |
| MG3 Ex | Damage 35 -> 50, reload เร็วขึ้น 20%, 909 RPM default / 455 RPM alt |

## Rifles และ Marksman weapons

| อาวุธ | การปรับแต่งปัจจุบัน |
|---|---|
| Centerfire MB464 Ex | Damage 165 -> 180, Sharpshooter/Gunslinger reload เร็วขึ้น 20% เมื่อ perk reload skill ไม่ทำงาน, recoil แนวตั้งแรงขึ้นเล็กน้อย, draw/put-away เร็วขึ้น, 150 RPM |
| Chole's SPX centerfire | Damage 165 -> 220, Sharpshooter reload เร็วขึ้น 50%, Gunslinger reload เร็วขึ้น 60%, empty-mag reload เร็วขึ้นอีก 8.25%, recoil แนวตั้งแรงขึ้นเล็กน้อย, draw/put-away เร็วขึ้น |
| M14EBR (ACOG) | Damage 80 -> 90, pitch recoil `225/225`, horizontal yaw recoil inherited from vanilla `200/-200`, 273 RPM, penetration 2 |
| Chloe's M14 MBR (RS) | Damage 80 -> 116, pitch recoil `225/225`, horizontal yaw recoil inherited from vanilla `200/-200`, Sharpshooter reload เร็วขึ้น 35% เมื่อ Tactical Reload ไม่ทำงาน, 273 RPM |
| M14EBR No Scope | Damage 80 -> 90, default pitch recoil `225/225`; ระหว่างกำลัง zoom-in pitch recoil เป็น `320/320`; horizontal yaw recoil inherited from vanilla `200/-200`, 273 RPM |
| M24 Ex | 400 damage, 70 RPM, penetration 2, bolt-action recoil หนักแต่เบากว่า M107, reload เร็วขึ้น 15% |
| M107 Ex | 300 damage, 200 RPM, penetration 8, weight 10, แม็ก 10 นัด, recoil ใกล้ M99 แต่เบากว่าเล็กน้อย |
| M110 SASS Ex | 138 damage, 300 RPM, penetration 2, weight 8, แม็ก 30 นัด, recoil หนักกว่า M14 แต่คุมได้สำหรับ rapid fire |
| MosinNagant Ex | Damage 250 -> 350, Sharpshooter reload เร็วขึ้น 25% เมื่อ Tactical Reload ไม่ทำงาน, กระสุนสำรอง 60 -> 70, ราคา 700 -> 2500, 71 RPM, penetration 3 |

## Bows และ Crossbows

| อาวุธ | การปรับแต่งปัจจุบัน |
|---|---|
| Crossbow Ex | Reload เร็วขึ้น 10%, 200 RPM, penetration 4 |
| HRG Crossbow Ex | Medic crossbow, heal dart 27 HP, กระสุน 34 -> 14, weight 7 -> 6, ใช้ HRG Incision targeting, penetration default 4 / alt 3 |
| Compound Bow Ex | Damage 250 -> 300, reload เร็วขึ้น 10%, 300 RPM, penetration default 5 / alt 0 |

## อุปกรณ์พิเศษ

| อุปกรณ์ | การปรับแต่งปัจจุบัน |
|---|---|
| Syringe Armor | Heal armor แทน health, 50 armor ต่อ dose, มี 3 doses, ไม่เติมจาก perk และ recharge 5 วินาทีต่อ dose จาก reserve stock |

## AT variants

ปืน AT คือ variant ที่เพิ่มการสลับโหมดด้วย right-click โดยชื่อที่แสดงในร้านค้าปัจจุบันมีดังนี้:

| WeaponDef / class | ชื่อในร้านค้า |
|---|---|
| `CW_Pistol_AF2011Ex_AT` | AF2011 Ex AT |
| `CW_Pistol_DualAF2011Ex_AT` | Dual AF2011 AT |
| `CW_Pistol_Colt1911Ex_AT` | M1911 AT |
| `CW_Pistol_DualColt1911Ex_AT` | Dual M1911 AT |
| `CW_Pistol_DeagleEx_AT` | Deagle AT |
| `CW_Pistol_DualDeagleEx_AT` | Dual Deagle AT |
| `CW_Revolver_SW500Ex_AT` | Magnum AT |
| `CW_Revolver_DualSW500Ex_AT` | Dual Magnum AT |

ทุก AT WeaponDef มี localization section ครบ และไม่มีชื่อ active ซ้ำกันหลังแก้ `AF2011 Ex AT` และ `HRG Crossbow Ex`

## SkinsAdder

`Classes/SkinsAdder.uc` ใช้ map custom WeaponDef ไปยังอาวุธ vanilla เพื่อให้ระบบ skin ของอาวุธต้นแบบทำงานได้

### เพิ่มใน SkinsAdder

- `KFWeapDef_DeagleEx_Meme` -> vanilla Deagle
- `KFWeapDef_DeagleDualEx_Meme` -> vanilla Dual Deagle

### จงใจไม่เพิ่มใน SkinsAdder

รายการต่อไปนี้เป็น custom weapon ที่ไม่ควรใช้ skin replacement จากอาวุธ vanilla:

- AutoMag Ex และ Dual AutoMag Ex
- M107 Ex
- M110 SASS Ex
- M24 Ex
- Casull และ Jackal & Casull
- Syringe Armor

M14 variants, Evil Deagle และอาวุธ custom อื่นที่มี skin mapping จะใช้รายการใน `SkinsAdder.uc` ตามปัจจุบัน

## โครงสร้างไฟล์สำคัญ

```text
CWP/
├─ Classes/
│  ├─ CW_*.uc              # weapon implementation
│  ├─ KFWeapDef_*.uc       # trader/WeaponDef mapping
│  ├─ KFDT_*.uc            # package-owned damage types
│  └─ SkinsAdder.uc        # vanilla skin replacement mapping
├─ Weapons/                # package assets/build-related content
└─ README.md

Localization/INT/CWP.int  # อยู่นอก Git repo CWP แต่เป็น localization ที่ใช้งานจริง
```

## การตรวจสอบล่าสุด

- ตรวจ active WeaponDef: 57 รายการ
- ตรวจ WeaponClassPath -> source class: ครบ
- ตรวจ WeaponClassPath -> localization section: ครบ
- ตรวจ AT WeaponDef -> localization section: 8/8
- ตรวจชื่อ ItemName ซ้ำใน active WeaponDef: ไม่พบ
- ตรวจ `CWP.int`: UTF-16 LE BOM ถูกต้อง
- ตรวจ `git diff --check`: ผ่าน
- ยังไม่ได้ compile ในการอัปเดตเอกสารนี้

หมายเหตุ: `CWP.int` มี section legacy บางรายการที่ไม่มี active WeaponDef เช่น `CW_SMG_Medic_Ex`; section เหล่านี้ไม่ได้ถูกนับเป็นอาวุธ active ในตารางด้านบน
