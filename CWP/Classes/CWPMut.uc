//=============================================================================
// CWPMut
//=============================================================================
// มิวเตเตอร์หลักของ Custom Weapon Pack (CWP)
// ทำหน้าที่ spawn SkinsAdder เพื่อแทนที่สกินอาวุธให้แสดงผลถูกต้อง
// ทำงานเฉพาะฝั่งเซิร์ฟเวอร์เท่านั้น
//=============================================================================

class CWPMut extends KFMutator;

var private SkinsAdder SkinsAdder;

// PostBeginPlay — ถูกเรียกเมื่อมิวเตเตอร์เริ่มทำงานในโลกเกม
//   จะ spawn SkinsAdder ฝั่งเซิร์ฟเวอร์เพื่อทำการแทนที่สกินอาวุธ
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    if (WorldInfo.NetMode != NM_Client)
    {
        SkinsAdder = Spawn(class'SkinsAdder');
    }
}

DefaultProperties
{
}
