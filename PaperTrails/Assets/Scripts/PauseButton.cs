using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PauseButton : MonoBehaviour {

    private bool isPaused = false;

	// Use this for initialization
	void Start () {
		
	}

    // Update is called once per frame
    void Update() {
        if (isPaused) {
            Time.timeScale = 0;
        }
        if (!isPaused) {
            Time.timeScale = 1;
        }
    }

    public void ButtonPress() {
        isPaused = !isPaused;
    }
}
