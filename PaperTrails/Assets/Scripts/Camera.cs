using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Camera : MonoBehaviour {

    public PlayerController Player;

    void OnBecameInvisible() {
        if(gameObject == Player) {
            print("Off Screen");
        }  
    }
}
