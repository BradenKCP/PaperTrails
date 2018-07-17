using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ChangeButtonText : MonoBehaviour {

    private bool isPaused = false;

    // Use this for initialization
    void Start () {

    }
	
	// Update is called once per frame
	void Update () {
        if (isPaused) {
            GetComponentsInChildren<Text>()[0].text = "Unpause";
        }
        if (!isPaused) {
            GetComponentsInChildren<Text>()[0].text = "Pause";
        }
    }

    public void ButtonPressed() {
        isPaused = !isPaused;
    }

}
