using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameController : MonoBehaviour {

    public PlayerController Player;
    private Vector3 PlayerStartPoint;


    // Use this for initialization
    void Start () {
        PlayerStartPoint = Player.transform.position;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    public void RestartGame() {
        StartCoroutine("RestartCo");
    }

    public IEnumerator RestartCo() {
        Player.gameObject.SetActive(false);
        yield return new WaitForSeconds(0.5f);
        Player.transform.position = PlayerStartPoint;
        Player.gameObject.SetActive(true);
    }
}
