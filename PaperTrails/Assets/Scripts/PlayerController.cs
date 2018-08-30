using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlayerController : MonoBehaviour {

    public float jumpForce;
    public float moveForce = 365;
    public float maxSpeed = 5;
    public float jumpTime;
    public bool grounded;
    public LayerMask whatIsGround;
    public GameController GameController;


    private Rigidbody2D myRigidBody;
    private Collider2D myCollider;
    private Animator myAnimator;
    private bool jumping;
    private Vector2 pos;
    private float jumpTimeCounter;
    private string levelName;

    // Use this for initialization
    void Start () {
        Screen.orientation = ScreenOrientation.LandscapeLeft;
        myRigidBody = GetComponent<Rigidbody2D>();
        myCollider = GetComponent<Collider2D>();
        myAnimator = GetComponent<Animator>();
        jumpTimeCounter = jumpTime;
    }
	
	// Update is called once per frame
	void Update () {
        pos = Input.mousePosition;
        grounded = Physics2D.IsTouchingLayers(myCollider, whatIsGround);
        if(myRigidBody.velocity.y != 0){
            jumping = true;
        }
        else{
            jumping = false;
        }
        
        if (myRigidBody.velocity.x < maxSpeed)
            myRigidBody.AddForce(Vector2.right * moveForce);

        if (Mathf.Abs(myRigidBody.velocity.x) > maxSpeed)
            myRigidBody.velocity = new Vector2(Mathf.Sign(myRigidBody.velocity.x) * maxSpeed, myRigidBody.velocity.y);

        //(!((pos.x > 810) && (pos.y > 320))) area of pause button, you will need this later
        if (Input.GetMouseButtonDown(0)){
            if (pos.x < 600) {
                if (grounded) {
                    myRigidBody.velocity = new Vector2(myRigidBody.velocity.x, jumpForce);
                }
            }
        }

        if(Input.GetMouseButton(0)) {
            if(jumpTimeCounter > 0) {
                if (pos.x < 600) {
                    myRigidBody.velocity = new Vector2(myRigidBody.velocity.x, jumpForce);
                    jumpTimeCounter -= Time.deltaTime;
                }
            }
        }

        if(Input.GetMouseButtonUp(0)) {
            jumpTimeCounter = 0;
        }

        if (grounded && !Input.GetMouseButton(0)) {
            jumpTimeCounter = jumpTime;
        }


        myAnimator.SetFloat("Speed", myRigidBody.velocity.x);
        myAnimator.SetBool("Jumping", jumping);
       
    }

    public void OnBecameInvisible() {
        SceneManager.LoadScene(1);
    }
}
